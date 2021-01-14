unit UntMsgGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, Buttons, Grids, ExtCtrls;

type
  Tdlgmsggoods = class(TfmBase)
    Panel1: TPanel;
    Gridbase: TStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridbaseSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure GridbaseDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    prow:integer;
    procedure frominit;
    procedure readdata;
    function binddata():boolean;
    function YdRead():boolean;
  public
    { Public declarations }
    model:integer;//(0:商品需求；1：陪送申请;2:预定申请)
  end;

var
  dlgmsggoods: Tdlgmsggoods;

implementation

uses untdatadm, func, Untgoodcodedetail, UntgoodscodeRe;

{$R *.dfm}
/////////////
procedure tdlgmsggoods.frominit;
begin
  if model=1 then
  begin
  Gridbase.ColCount:=5;
  Gridbase.Cells[0,0]:='序号';
  Gridbase.Cells[1,0]:='商品类别';
  Gridbase.Cells[2,0]:='申请数量';
  Gridbase.Cells[3,0]:='已配送数量';
  Gridbase.Cells[4,0]:='差额数量';
  Gridbase.ColWidths[0]:=30;
  Gridbase.ColWidths[1]:=70;
  Gridbase.ColWidths[2]:=70;
  Gridbase.ColWidths[3]:=70;
  Gridbase.ColWidths[4]:=70;
  readdata;
  end ;
  if model=0 then
  begin
    caption:='部门需求商品';
    Gridbase.ColCount:=3;
    Gridbase.Cells[0,0]:='序号';
    Gridbase.Cells[1,0]:='商品类别';
    Gridbase.Cells[2,0]:='需求数量';
    Gridbase.ColWidths[0]:=30;
    Gridbase.ColWidths[1]:=70;
    Gridbase.ColWidths[2]:=70;
    binddata();
  end;
  if model=2 then
  begin
    caption:='部门预定商品';
    Gridbase.ColCount:=4;
    Gridbase.Cells[0,0]:='序号';
    Gridbase.Cells[1,0]:='商品类别';
    Gridbase.Cells[2,0]:='商品品种';
    Gridbase.Cells[3,0]:='预定数量';
    Gridbase.ColWidths[0]:=30;
    Gridbase.ColWidths[1]:=70;
    Gridbase.ColWidths[2]:=70;
    Gridbase.ColWidths[3]:=70;
    YdRead();
  end;
end;

procedure tdlgmsggoods.readdata;
var
  sqlpub:widestring;
  i:integer;
begin
  sqlpub:='select sum(nqty) as sqnum,sum(nsendqty) as psnum,sum(totalamount) as totalnum ,type from vpssq where vcofficeid='+''''+trim(officeid)+''''+'group by type';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  try
    dmmain.CDSquery2.Data:=adisp.GetRecord(sqlpub);
    dmmain.CDSquery2.Open;
    gridbase.RowCount:=dmmain.CDSquery2.RecordCount +1;
    i:=1;
    while not dmmain.CDSquery2.Eof do
    begin
      gridbase.Cells[0,i]:=inttostr(i);
      gridbase.Cells[1,i]:=trim(dmmain.CDSquery2.fieldbyname('type').AsString);
      gridbase.Cells[2,i]:=trim(dmmain.CDSquery2.fieldbyname('sqnum').AsString);
      gridbase.Cells[3,i]:=trim(dmmain.CDSquery2.fieldbyname('psnum').AsString);
      gridbase.Cells[4,i]:=trim(dmmain.CDSquery2.fieldbyname('totalnum').AsString);
      inc(i);
      dmmain.CDSquery2.Next;
    end;
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
  except
  end;
end;

function  Tdlgmsggoods.binddata() :boolean;
var
  sqlpub:widestring;
  i:integer;
begin
  result:=false;
  sqlpub:='select sum(amount) as amount ,type from [VRequirement] group by type';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  try
    dmmain.CDSquery2.Data:=adisp.GetRecord(sqlpub);
    dmmain.CDSquery2.Open;
    gridbase.RowCount:=dmmain.CDSquery2.RecordCount +1;
    i:=1;
    while not dmmain.CDSquery2.Eof do
    begin
      gridbase.Cells[0,i]:=inttostr(i);
      gridbase.Cells[1,i]:=trim(dmmain.CDSquery2.fieldbyname('type').AsString);
      gridbase.Cells[2,i]:=trim(dmmain.CDSquery2.fieldbyname('amount').AsString);
      inc(i);
      dmmain.CDSquery2.Next;
    end;
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
  except
  end;

end;

function  Tdlgmsggoods.YdRead() :boolean;
var
  sqlpub:widestring;
  i:integer;
begin
  result:=false;
  sqlpub:='select sum(amount) as amount ,type,breed from [VYdgoods] group by type,breed';
  dmmain.CDSquery2.Close;
  dmmain.CDSquery2.Data:=null;
  try
    dmmain.CDSquery2.Data:=adisp.GetRecord(sqlpub);
    dmmain.CDSquery2.Open;
    gridbase.RowCount:=dmmain.CDSquery2.RecordCount +1;
    i:=1;
    while not dmmain.CDSquery2.Eof do
    begin
      gridbase.Cells[0,i]:=inttostr(i);
      gridbase.Cells[1,i]:=trim(dmmain.CDSquery2.fieldbyname('type').AsString);
      gridbase.Cells[2,i]:=trim(dmmain.CDSquery2.fieldbyname('breed').AsString);
      gridbase.Cells[3,i]:=trim(dmmain.CDSquery2.fieldbyname('amount').AsString);
      inc(i);
      dmmain.CDSquery2.Next;
    end;
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
  except
    dmmain.CDSquery2.Close;
    dmmain.CDSquery2.Data:=null;
  end;

end;
///////////////
procedure Tdlgmsggoods.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tdlgmsggoods.FormShow(Sender: TObject);
begin
  inherited;
  frominit;
end;

procedure Tdlgmsggoods.GridbaseSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  prow:=arow;
end;

procedure Tdlgmsggoods.btnOkClick(Sender: TObject);
begin
  inherited;
  if (prow>0)  then
  begin
    if model=1 then
    begin
    fmgoodCodedetail:= TfmgoodCodedetail.Create(nil);
     try
    fmgoodCodedetail.show_mode := '配送收货单';
    fmgoodCodedetail.CBType.Text:=trim(gridbase.Cells[1,prow]);
    fmgoodCodedetail.billtyped:='501';//申请;
     fmgoodCodedetail.ShowModal;
    finally
     fmgoodCodedetail.Free;
     self.SetFocus;
    end;
    end else
    begin
      fmgoodCodeRE:=tfmgoodCodeRE.Create(self);
      fmgoodCodeRE.cbType.Text:=trim(gridbase.Cells[1,prow]);
      fmgoodCodeRE.ShowMode:=model;
      fmgoodCodeRE.ShowModal;
      self.SetFocus;
      fmgoodCodeRE.Free;
    end;
  end;
end;

procedure Tdlgmsggoods.GridbaseDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin

 with Sender as Tstringgrid do
  begin
  if gdSelected in State then
  Canvas.Brush.Color:= clTeal;
  Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
  if gdFocused in State then
  Canvas.DrawFocusRect(Rect);
  end;
 with Sender as Tstringgrid do
  begin
    Canvas.FillRect(Rect);
    s:=Cells[ACol,ARow];
    r:=Rect;
    DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  end;

end;

end.

unit UBaseprices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, StdCtrls, ExtCtrls, ComCtrls, DB, DBClient,
  Buttons;

type
  TfmBaseprices = class(TfmBase)
    Pc1: TPageControl;
    TabManager: TTabSheet;
    TabShop: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Gridbase1: TStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Gridbase2: TStringGrid;
    cdsdata: TClientDataSet;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Pc2: TPageControl;
    Tabpart: TTabSheet;
    Tabprice: TTabSheet;
    Cmd_JSR: TSpeedButton;
    Edit_Storage_Name: TLabeledEdit;
    Edit_Storage_NO: TEdit;
    edtshop: TEdit;
    Label4: TLabel;
    Sgridbase: TStringGrid;
    Label5: TLabel;
    Cmd_Storage_Up: TSpeedButton;
    Cmd_Storage_Down: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Gridbase1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Gridbase1DblClick(Sender: TObject);
    procedure Gridbase2DblClick(Sender: TObject);
    procedure Gridbase1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure Cmd_JSRClick(Sender: TObject);
    procedure Cmd_Storage_DownClick(Sender: TObject);
    procedure SgridbaseDblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
    pcol,prow,wz1,wz2:integer;
    procedure readprice;
    procedure ShopCurPrice(storageNo:string);
    procedure updatedata(gridbase:tstringgrid;index:integer);
  public
    { Public declarations }
  end;

var
  fmBaseprices: TfmBaseprices;

implementation

uses func, Untpart, untdatadm;

{$R *.dfm}
//////////////////////////////////////////////////

procedure tfmBaseprices.ShopCurPrice(storageNo:string);
var
  temp:widestring;
  datas:olevariant;
  Sname,Scomp:string;
  i,j:integer;
begin
  temp:='select Curprices from Storage where Storage_no='+''''+trim(storageNo)+'''';
  cdsdata.Close;
  cdsdata.Data :=null;
  datas:=null;
  Sname:='singleprice';
  try
    datas:=adisp.execSql(temp);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      cdsdata.Open;
      datas:=null;
      Sname:=trim(cdsdata.fieldbyname('Curprices').AsString);
      cdsdata.Close;
      cdsdata.data:=null;
    end;
    if (pos('singleprice',trim(Sname))>0) then
    begin
      Scomp:='零售价格';
    end;
    if (pos('batchprice',trim(Sname))>0) then
    begin
      Scomp:='批发价格';
    end;
    if (pos('prices',trim(Sname))>0) then
    begin
      j:=pos('prices',trim(Sname));
      i:=strtoint(copy(trim(Sname),j+6,1));
      Scomp:='预定价格'+inttostr(i);
    end;
    for i:=1 to sgridbase.RowCount-1 do
    begin
      if trim(SComp)=trim(Sgridbase.Cells[0,i]) then
      begin
        Sgridbase.Cells[1,i]:='√';
      end else
      begin
        Sgridbase.Cells[1,i]:='';
      end;
    end;
  except
  end;
end;
procedure tfmBaseprices.updatedata(gridbase:tstringgrid;index:integer);
var
  i,j:integer;
  Fg,Fd:string;
  temp:widestring;
begin
  case index of
  1: fg:='L';
  2: fg:='P';
  end;
  for i:=1 to gridbase.RowCount-1 do
  begin
    if trim(gridbase.Cells[1,i])='√' then
    begin
      j:=i;
    end;
  end;
  fd:='';
  case j of
  1: fd:=' singleprice';
  2: fd:=' batchprice' ;
  3..10: begin
           fd:=' prices'+inttostr(j-2);
          end;
  end;
  try
  temp:=' update userprices set flag=1,usename='+''''+fg+''''+' where fieldsname='+''''+trim(fd)+'''';
  adisp.updatesql(temp);
  if fg='L' then
  begin
    temp:='update storage set curprices='+''''+trim(fd)+'''';
    Adisp.updatesql(temp);
  end;
  case index of
  1: j:=wz1;
  2: j:=wz2;
  end;
  fd:='';
  case j of
  1: fd:=' singleprice';
  2: fd:=' batchprice' ;
  3..10: begin
           fd:=' prices'+inttostr(j-2);
          end;
  end;
  temp:=' update userprices set flag=0,usename='+''''+trim('')+''''+' where fieldsname='+''''+trim(fd)+'''';
  adisp.updatesql(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
procedure tfmBaseprices.readprice;
var
  tempsql:widestring;
  datas:olevariant;
  i,j,t:integer;
begin
  gridbase1.ColWidths[0]:=100;
  gridbase2.ColWidths[0]:=100;
  gridbase1.cells[0,0]:='价格体系名';
  gridbase1.cells[1,0]:='是否使用';
  //////////////////////////////////
  gridbase2.cells[0,0]:='价格体系名';
  gridbase2.cells[1,0]:='是否使用';
  /////////////////////////////////////
  //////////////////////////////////
  sgridbase.cells[0,0]:='价格体系名';
  sgridbase.cells[1,0]:='是否使用';
  //////////////////////
  tempsql:='select * from userprices';
  cdsdata.Close;
  cdsdata.Data :=null;
  i:=0;
  try
    datas:=adisp.execSql(tempsql);
    if not varisnull(datas) then
    begin
      cdsdata.Data:=datas;
      cdsdata.Open;
      while not cdsdata.Eof do
      begin
        inc(i);
        if (pos('prices',trim(cdsdata.FieldByName('fieldsname').AsString))>0) then
        begin
          t:=pos('prices',trim(cdsdata.FieldByName('fieldsname').AsString));
          j:=strtoint(copy(trim(cdsdata.FieldByName('fieldsname').AsString),t+6,1));
          gridbase1.Cells[0,j+2]:='预定价格'+inttostr(j);
          gridbase2.Cells[0,j+2]:='预定价格'+inttostr(j);
          sgridbase.Cells[0,j+2]:='预定价格'+inttostr(j);
          if (cdsdata.FieldByName('flag').AsBoolean) and (trim(cdsdata.FieldByName('usename').AsString)='L')  then
          begin
            gridbase1.Cells[1,j+2]:='√';
            wz1:=j+2
          end;
          if (cdsdata.FieldByName('flag').AsBoolean) and (trim(cdsdata.FieldByName('usename').AsString)='P')  then
          begin
            gridbase2.Cells[1,j+2]:='√';
            wz2:=j+2
          end;
        end;
        if (pos('singleprice',trim(cdsdata.FieldByName('fieldsname').AsString))>0) then
        begin
          gridbase1.Cells[0,1]:='零售价格';
          gridbase2.Cells[0,1]:='零售价格';
          sgridbase.Cells[0,1]:='零售价格';
          if (cdsdata.FieldByName('flag').AsBoolean) and (trim(cdsdata.FieldByName('usename').AsString)='L')  then
          begin
            gridbase1.Cells[1,1]:='√';
            wz1:=1 ;
          end;
          if (cdsdata.FieldByName('flag').AsBoolean) and (trim(cdsdata.FieldByName('usename').AsString)='P')  then
          begin
            gridbase2.Cells[1,1]:='√';
            wz2:=1;
          end;
        end;
         if (pos('batchprice',trim(cdsdata.FieldByName('fieldsname').AsString))>0) then
        begin
          gridbase1.Cells[0,2]:='批发价格';
          gridbase2.Cells[0,2]:='批发价格';
          sgridbase.Cells[0,2]:='批发价格';
          if (cdsdata.FieldByName('flag').AsBoolean) and (trim(cdsdata.FieldByName('usename').AsString)='L')  then
          begin
            gridbase1.Cells[1,2]:='√';
            wz1:=2;
          end;
          if (cdsdata.FieldByName('flag').AsBoolean) and (trim(cdsdata.FieldByName('usename').AsString)='P')  then
          begin
            gridbase2.Cells[1,2]:='√';
            wz2:=2;
          end;
        end;
        cdsdata.Next;
      end;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;
///////////////////////////////////////////////////////
procedure TfmBaseprices.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmBaseprices.FormShow(Sender: TObject);
begin
 ///////调类别
  pc1.ActivePageIndex:=0;
  pc2.ActivePageIndex:=0 ;
  tabprice.tabVisible:=false;
  ///////////////////
  readprice;
  //gridbase
end;

procedure TfmBaseprices.Gridbase1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin       
  inherited ;
  with Sender as Tstringgrid do
  begin
  if gdSelected in State then
  Canvas.Brush.Color:= clTeal; //clyellow;//clRed;
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

procedure TfmBaseprices.Gridbase1DblClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if pcol=1 then
  begin
    if prow=0 then exit;
    if trim(gridbase1.Cells[1,prow])='' then
    begin
      gridbase1.Cells[1,prow]:='√';
      for i:=1 to gridbase1.RowCount-1 do
      begin
        if i<>prow then
        gridbase1.Cells[1,i]:='';
      end;
    end else
    begin
      gridbase1.Cells[1,prow]:='';
    end;
  end;
end;

procedure TfmBaseprices.Gridbase2DblClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if pcol=1 then
  begin
    if prow=0 then exit;
    if trim(gridbase2.Cells[1,prow])='' then
    begin
      gridbase2.Cells[1,prow]:='√';
      for i:=1 to gridbase2.RowCount-1 do
      begin
        if i<>prow then
        gridbase2.Cells[1,i]:='';
      end;
    end else
    begin
      gridbase2.Cells[1,prow]:='';
    end;
  end;
end;

procedure TfmBaseprices.Gridbase1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  pcol:=acol;
  prow:=arow;
end;

procedure TfmBaseprices.btnOkClick(Sender: TObject);

begin
  inherited;
  updatedata(gridbase1,1);
  updatedata(gridbase2,2);
  close;
end;

procedure TfmBaseprices.Cmd_JSRClick(Sender: TObject);
begin
  inherited;
  fmps_part:=tfmps_part.Create(self);
   fmps_part.ShowModal;
   fmps_part.Free;
   if dmmain.CDSdata.IsEmpty  then exit;
   edit_storage_name.Text:=trim(dmmain.CDSdata.fieldbyname('part_name').AsString);
   edtshop.Text:=trim(dmmain.CDSdata.fieldbyname('part_no').AsString);
   edit_storage_no.Text:=trim(dmmain.CDSdata.fieldbyname('storageid').AsString);
   dmmain.CDSdata.Close;
end;

procedure TfmBaseprices.Cmd_Storage_DownClick(Sender: TObject);
begin
  inherited;
  if trim(Edit_Storage_Name.Text)='' then
  begin
    application.MessageBox('请选择部门或门店！',pchar(application.Title),mb_iconinformation);
    Edit_Storage_Name.SetFocus;
    exit;
  end;
  ShopCurprice(Edit_Storage_No.Text);
  tabpart.TabVisible:=false;
  tabprice.TabVisible:=true;
end;

procedure TfmBaseprices.SgridbaseDblClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if pcol=1 then
  begin
    if prow=0 then exit;
    if trim(sgridbase.Cells[1,prow])='' then
    begin
      sgridbase.Cells[1,prow]:='√';
      for i:=1 to sgridbase.RowCount-1 do
      begin
        if i<>prow then
        sgridbase.Cells[1,i]:='';
      end;
    end else
    begin
      sgridbase.Cells[1,prow]:='';
    end;
  end;
end;

procedure TfmBaseprices.BitBtn3Click(Sender: TObject);
var
  str,fd:string;
  temp:widestring;
  i,j:integer;
begin
  inherited;
  /////////////////////
  for i:=1 to sgridbase.RowCount-1 do
  begin
    if trim(sgridbase.Cells[1,i])='√' then
    begin
      j:=i;
    end;
  end;
  fd:='';
  case j of
  1: fd:=' singleprice';
  2: fd:=' batchprice' ;
  3..10:
  begin
    fd:=' prices'+inttostr(j-2);
  end;
  end;
  temp:='update Storage set Curprices= '+''''+trim(fd)+''''+'  where storage_no='+''''+trim(Edit_Storage_NO.Text)+'''';
  screen.Cursor := crhourglass;
  try
    adisp.updatesql(temp);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  screen.Cursor :=  crdefault;
  application.MessageBox(pchar('门店：'+trim(Edit_Storage_Name.Text)+'  价格拟订成功！'),pchar(application.Title),mb_iconinformation);
  close;
  //////////////////////
end;

procedure TfmBaseprices.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  tabpart.TabVisible:=true;
  tabprice.TabVisible:=false;
end;

end.

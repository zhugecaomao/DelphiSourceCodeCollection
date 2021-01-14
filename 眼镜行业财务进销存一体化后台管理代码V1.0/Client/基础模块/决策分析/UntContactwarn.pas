unit UntContactwarn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, DB, DBClient, StdCtrls, Buttons, Grids;

type
  TfmContactWarn = class(TfmBase)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    btnCancel: TBitBtn;
    cdsdata: TClientDataSet;
    procedure btnCancelClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    prow:integer;
    procedure forminit;
    procedure readdata;
  public
    { Public declarations }
  end;

var
  fmContactWarn: TfmContactWarn;

implementation

uses untdatadm, func, UntMoneyStaff;

{$R *.dfm}
procedure  tfmContactWarn.forminit;
begin
  stringgrid1.ColWidths[0]:=80;
  stringgrid1.Cells[0,1]:='信用额度:';
  stringgrid1.Cells[0,2]:='应收金额:';
  stringgrid1.Cells[1,0]:='数量或金额';
  readdata;                    
end;

procedure tfmContactWarn.readdata;
var
  sql:widestring;
begin
  sql:='select count(supply_NO) as numbers  from [Supply_Company] where Must_gather>contact';
  cdsdata.Close;
  cdsdata.Data:=null;
  try
    cdsdata.Data:=adisp.execSql(sql);
    stringgrid1.Cells[1,1]:=cdsdata.fieldbyname('numbers').AsString;
  except
  end;
   sql:='select isnull(sum(Must_gather),0) as numbers from [Supply_Company] where Must_gather>contact ';
  cdsdata.Close;
  cdsdata.Data:=null;
  try
    cdsdata.Data:=adisp.execSql(sql);
    stringgrid1.Cells[1,2]:=cdsdata.fieldbyname('numbers').AsString;
  except
  end;
  cdsdata.Close;
  cdsdata.Data:=null;
end;
procedure TfmContactWarn.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmContactWarn.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  s:string;
  r:TRect;
begin
  inherited;
   with Sender as Tstringgrid do
        begin
        if gdSelected in State then
        Canvas.Brush.Color:= clTeal;  //clBlue; //clyellow;//clRed;
        Canvas.TextRect(Rect,Rect.Left,Rect.Top,' '+Cells[ACol,ARow]);
        if gdFocused in State then
        Canvas.DrawFocusRect(Rect);
        end;

//不但水平居中，还垂直居中
with Sender as Tstringgrid do
    begin
      Canvas.FillRect(Rect);
      s:=Cells[ACol,ARow];
      r:=Rect;
      DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
    end;


end;

procedure TfmContactWarn.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  prow:=arow;
end;

procedure TfmContactWarn.FormShow(Sender: TObject);
begin
  inherited;
  forminit;
end;

procedure TfmContactWarn.BitBtn1Click(Sender: TObject);
begin
  inherited;
  fmMoneyStaff:=tfmMoneyStaff.Create(self);
  fmMoneyStaff.model:=1;
  fmMoneyStaff.ShowModal;
  fmMoneyStaff.Free;
end;

end.

unit dlg_warning_limit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, Grids, StdCtrls, Buttons, DB, DBClient, Menus;

type
  Tfm_limit_warning = class(TfmBase)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    btnCancel: TBitBtn;
    cdsdata: TClientDataSet;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
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
  fm_limit_warning: Tfm_limit_warning;

implementation

uses Unt_PubStrGrid, func, untdatadm, Untlimitgoods;

{$R *.dfm}
procedure  tfm_limit_warning.forminit;
begin
  stringgrid1.ColWidths[0]:=80;
  InitialStrGrid(stringgrid1,'库存预警');
  stringgrid1.Cells[0,1]:='库存上限:';
  stringgrid1.Cells[0,2]:='库存下限:';
  stringgrid1.Cells[0,3]:='商品品牌:';
  stringgrid1.Cells[0,4]:='商品品种:';
  readdata;                    
end;

procedure tfm_limit_warning.readdata;
var
  sql:widestring;
begin
  sql:='exec  stockWarningLimit'+''''+trim(shopid)+'''';
  cdsdata.Close;
  cdsdata.Data:=null;
 try
   cdsdata.Data:=adisp.execSql(sql);
   cdsdata.Open;
   stringgrid1.Cells[1,1]:=cdsdata.fieldbyname('upamount').AsString;
   stringgrid1.Cells[2,1]:='0';
   stringgrid1.Cells[1,2]:=cdsdata.fieldbyname('downamount').AsString;
   stringgrid1.Cells[2,2]:='0';
   stringgrid1.Cells[1,3]:=cdsdata.fieldbyname('brandamount').AsString;
   stringgrid1.Cells[2,3]:='0';
   stringgrid1.Cells[1,4]:=cdsdata.fieldbyname('breedamount').AsString;
   stringgrid1.Cells[2,4]:='0';
 except
 end;
   cdsdata.Close;
  cdsdata.Data:=null;
end;
procedure Tfm_limit_warning.StringGrid1DrawCell(Sender: TObject; ACol,
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

procedure Tfm_limit_warning.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfm_limit_warning.FormShow(Sender: TObject);
begin
  inherited;
  forminit;
end;

procedure Tfm_limit_warning.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  prow:=arow;
end;

procedure Tfm_limit_warning.BitBtn1Click(Sender: TObject);
begin
  inherited;
  fmlimitgoods:=tfmlimitgoods.Create(self);
  case prow of
  0:
  begin
    fmlimitgoods.tj:=' where  overflow <0 and up_amount>0  and storage_no='+''''+trim(shopid)+'''';
  end;
   1:
  begin
    fmlimitgoods.tj:=' where  overflow <0 and up_amount>0  and storage_no='+''''+trim(shopid)+'''';
  end;
  2:
  begin
   fmlimitgoods.tj:= ' where enteramount < 0 and down_amount>0 and storage_no='+''''+trim(shopid)+'''';
  end;
  3:
  begin
    fmlimitgoods.tj:=' where (overflow <0 or enteramount<0) and (up_amount>0 or down_amount>0) and storage_no='+''''+trim(shopid)+'''';
  end;
  4:
  begin
    fmlimitgoods.tj:=' where (overflow <0 or enteramount<0) and (up_amount>0 or down_amount>0) and storage_no='+''''+trim(shopid)+'''';
  end;
  end;
  fmlimitgoods.btnmode:=prow;
  fmlimitgoods.ShowModal;
end;

end.

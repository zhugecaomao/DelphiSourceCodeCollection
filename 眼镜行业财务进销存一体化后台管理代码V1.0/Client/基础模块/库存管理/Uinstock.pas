{继承于“采购入库”}
unit Uinstock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Stock_Enter, Grids, StdCtrls, ExtCtrls, Buttons;

type
  Tfrmin_stock = class(Tfrm_Stock_Enter)
    procedure Cmd_HTClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    spcol,prow:integer;
  public
    { Public declarations }
  end;

var
  frmin_stock: Tfrmin_stock;

implementation

uses Public_Don, untdatadm, Data, Main, func, UntgoodCodeSelStr,
  Supply_Monad;

{$R *.dfm}

procedure Tfrmin_stock.Cmd_HTClick(Sender: TObject);
begin
  //inherited;

end;

procedure Tfrmin_stock.Edit3Change(Sender: TObject);
begin
  //inherited;

end;

procedure Tfrmin_stock.StringGrid1DblClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  if spcol in [1,2] then
  begin
   fmgoodCodeSelStr:= TfmgoodCodeSelStr.Create(self);
   try
   fmgoodcodeselStr.show_mode:='8';
   fmgoodcodeselStr.ShowModal;
   finally
   fmgoodcodeselStr.Free;
   end;
  end;
  if spcol = 4 then  //复制数量
  begin
   for i := prow+1 to STRINGGRID1.rowcount -1 do
   begin
   STRINGGRID1.cells[4,i]:= STRINGGRID1.cells[4,prow];
   //同时要计算金额
   end;
  end;
end;

procedure Tfrmin_stock.SpeedButton2Click(Sender: TObject);
var
  wldwname,remarks:widestring;
  intof:olevariant;
  i:integer;
  totals:double;
  bmbh,user:string;
begin
  inherited;
  totals:=0;
  for i:=1 to stringgrid1.RowCount-1 do
  begin
     totals:=totals+strtofloat(stringgrid1.Cells[5,i]); //已结算金额
  end;
  wldwname:=trim(edit4.Text);
  remarks:='非营业性入库';
  user:=trim(Handle_No);
  bmbh:=shopid;
  shopid:=edit5.Text;
  try
    intof:=ipubtemp.MoneyTable(2,no,totals,user,user,user,wldwno,wldwname,shopid,remarks);
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
  shopid:=bmbh;
  if vartostr(intof)='1' then
  begin
    application.MessageBox('单据已过帐！',pchar(application.Title),mb_iconinformation);
    exit;
  end ;
  close;
end;

procedure Tfrmin_stock.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  spcol:=acol;
  prow:=arow;
end;

end.

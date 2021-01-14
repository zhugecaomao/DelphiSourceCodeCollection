unit qhgysForm_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls, Mask,
  XPMenu;

type
  TFormqhgys = class(TForm)
    GroupBox1: TGroupBox;
    DBNavigator3: TDBNavigator;
    DBGrid4: TDBGrid;
    BitBtn_qhgys_print: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBEdit8: TDBEdit;
    XPMenu1: TXPMenu;
    procedure BitBtn_qhgys_printClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formqhgys: TFormqhgys;

implementation

uses QHGYSBB_, DMypgl_, qhgys_ckBB;

{$R *.dfm}

procedure TFormqhgys.BitBtn_qhgys_printClick(Sender: TObject);
begin
Formqhgysbb.QuickRep1.Preview;
end;

procedure TFormqhgys.BitBtn1Click(Sender: TObject);
begin
//传递供应商信息到打印页面
Formqhgys_ckbb.QRLabel1.Caption:=Formqhgys.DBEdit1.Text;
Formqhgys_ckbb.QRLabel3.Caption:=Formqhgys.DBEdit2.Text;
Formqhgys_ckbb.QRLabel4.Caption:=Formqhgys.DBEdit3.Text;
Formqhgys_ckbb.QRLabel5.Caption:=Formqhgys.DBEdit4.Text;
Formqhgys_ckbb.QRLabel6.Caption:=Formqhgys.DBEdit5.Text;
Formqhgys_ckbb.QRLabel7.Caption:=Formqhgys.DBEdit8.Text;
Formqhgys_ckbb.QRLabel2.Caption:=Formqhgys.DBEdit6.Text;
Formqhgys_ckbb.QRLabel8.Caption:=Formqhgys.DBEdit7.Text;
Formqhgys_ckbb.QuickRep1.Preview;
end;

end.

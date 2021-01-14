unit denglu_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, XPMenu;

type
  Tdenglu = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Eygbh: TEdit;
    Emm: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEmm: TDBEdit;
    DBEszzw: TDBEdit;
    XPMenu1: TXPMenu;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  denglu: Tdenglu;

implementation

uses DM_zygl_, zygl_;

{$R *.dfm}

procedure Tdenglu.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tdenglu.BitBtn1Click(Sender: TObject);
begin
   DMzygl.ADOQdenglu.Close;
   DMzygl.ADOQdenglu.Parameters.ParamByName('‘±π§±‡∫≈').Value:=Eygbh.Text;
   DMzygl.ADOQdenglu.Open;
   if Emm.Text<>DBEmm.Text then
      begin
        showmessage('√‹¬Î¥ÌŒÛ');
        exit;
      end
   else
      begin
        zygl.ShowModal;
      end;
end;

end.

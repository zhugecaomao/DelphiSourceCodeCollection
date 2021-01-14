unit UnitOther;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialog, DsFancyButton, ExtCtrls, ComCtrls, MenuBar, ToolWin,
  StdCtrls;

type
  TfrmOther = class(TBaseDialogFrm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOther: TfrmOther;

implementation

uses UnitData;

{$R *.dfm}

procedure TfrmOther.FormShow(Sender: TObject);
begin
  inherited;
self.Caption:='参数管理';

ComboBox1.Items:=Screen.Imes;

if ComboBox1.Items.IndexOf(sIme)=-1 then
    ComboBox1.ItemIndex:=0
else
    ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(sIme);

Edit1.Text:=sCompanyName;
Edit2.Text:=sCompanyPhone;
Edit3.Text:=sCompanyAddress;
if FileExists(sPath+'Attention.txt') then
    Memo1.Lines.LoadFromFile(sPath+'Attention.txt');
end;

procedure TfrmOther.OKBtnClick(Sender: TObject);
begin
  inherited;
sIme:=ComboBox1.Text;
sCompanyName:=Edit1.Text;
sCompanyPhone:=Edit2.Text;
sCompanyAddress:=Edit3.Text;


ini.WriteString('参数','输入法',sIme);
ini.WriteString('参数','公司名称',sCompanyName);
ini.WriteString('参数','公司电话',sCompanyPhone);
ini.WriteString('参数','公司地址',sCompanyAddress);

Memo1.Lines.SaveToFile(sPath+'Attention.txt');
Close;
end;

end.

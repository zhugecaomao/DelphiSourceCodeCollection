unit ComUserOption;

interface

uses Windows, Messages, Dialogs, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

type
  TfrmComUserOption = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    DefBtn: TButton;
    cPageControl: TPageControl;
    cTab1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure DefBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComUserOption: TfrmComUserOption;

implementation

{$R *.DFM}

procedure TfrmComUserOption.OKBtnClick(Sender: TObject);
begin
  ShowMessage('Save');
  Close;
end;

procedure TfrmComUserOption.DefBtnClick(Sender: TObject);
begin
  if Application.MessageBox('确定把所有设置设成默认值吗?',
    '我的设置', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then exit;
  ShowMessage('Def');
end;

procedure TfrmComUserOption.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.

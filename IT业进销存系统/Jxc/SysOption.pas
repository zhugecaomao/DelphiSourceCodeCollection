unit SysOption;

interface

uses Windows, Messages, Dialogs, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

type
  TfrmSysOption = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    DefBtn: TButton;
    cPageControl: TPageControl;
    cTab1: TTabSheet;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure DefBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSysOption: TfrmSysOption;

implementation

{$R *.DFM}

procedure TfrmSysOption.OKBtnClick(Sender: TObject);
begin
  ShowMessage('Save');
  Close;
end;

procedure TfrmSysOption.DefBtnClick(Sender: TObject);
begin
  if Application.MessageBox('确定把所有设置设成默认值吗?',
    '系统设置', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then exit;
  ShowMessage('Def');
end;

procedure TfrmSysOption.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.

unit RedirectUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, TntStdCtrls;

type
  TRedirect = class(TForm)
    Net2: TTntGroupBox;
    Label14: TTntLabel;
    Label15: TTntLabel;
    Label16: TTntLabel;
    Label17: TTntLabel;
    PortType: TComboBox;
    HPort: TEdit;
    RPort: TEdit;
    Button3: TTntButton;
    Button4: TTntButton;
    Button1: TButton;
    Button2: TButton;
    TCPMEMO: TListBox;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Redirect: TRedirect;

implementation

uses MainUnit;

{$R *.dfm}

procedure TRedirect.Button3Click(Sender: TObject);
begin
If (PortType.ItemIndex = -1) or (HPort.Text = '') or (RPort.Text ='') Then  MessageDlg('Please ensure you have filled in all the fields!',MtError,[MBOK],0) Else
  Begin
  TCPMemo.Items.Add(Lowercase(PortType.Text)+':'+HPort.Text+'::'+RPort.Text);
  HPort.Text := '';
  RPort.Text := '';
  end;

end;

procedure TRedirect.Button4Click(Sender: TObject);
var
NS : String;
I : Integer;
begin
I :=TCPMemo.ItemIndex;
If I >= 0 Then TCPMemo.Items.Delete(i);
end;

end.

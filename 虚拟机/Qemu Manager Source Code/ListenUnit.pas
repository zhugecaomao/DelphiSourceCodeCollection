unit ListenUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, Mask, DBCtrls, TntDBCtrls;

type
  TListeners = class(TForm)
    Button2: TButton;
    Button1: TButton;
    Net2: TTntGroupBox;
    Label14: TTntLabel;
    Label16: TTntLabel;
    HPort: TEdit;
    Button3: TTntButton;
    Button4: TTntButton;
    TCPMEMO: TListBox;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Listeners: TListeners;

implementation

{$R *.dfm}

procedure TListeners.Button3Click(Sender: TObject);
begin
If HPort.Text = '' Then MessageDlg('Please ensure you have filled in all the fields!',MtError,[MBOK],0) Else
  Begin
  TCPMemo.Items.Add(HPort.Text);
  HPort.Text := '';

  end;

end;

procedure TListeners.Button4Click(Sender: TObject);
var
NS : String;
I : Integer;
begin
I :=TCPMemo.ItemIndex;
If I >= 0 Then TCPMemo.Items.Delete(i);
end;


end.

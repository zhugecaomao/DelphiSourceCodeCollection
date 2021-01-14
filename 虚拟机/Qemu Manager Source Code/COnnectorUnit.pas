unit COnnectorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls;

type
  TConnectors = class(TForm)
    Net2: TTntGroupBox;
    Label14: TTntLabel;
    Label16: TTntLabel;
    HPort: TEdit;
    Button3: TTntButton;
    Button4: TTntButton;
    TCPMEMO: TListBox;
    Button1: TButton;
    Button2: TButton;
    TntLabel1: TTntLabel;
    CIP: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Connectors: TConnectors;

implementation

{$R *.dfm}

procedure TConnectors.Button3Click(Sender: TObject);
begin
If HPort.Text = '' Then MessageDlg('Please ensure you have filled in all the fields!',MtError,[MBOK],0) Else
  Begin
  TCPMemo.Items.Add(CIP.Text+':'+HPort.Text);
  HPort.Text := '';
  end;

end;

procedure TConnectors.Button4Click(Sender: TObject);
var
NS : String;
I : Integer;
begin
I :=TCPMemo.ItemIndex;
If I >= 0 Then TCPMemo.Items.Delete(i);
end;


end.

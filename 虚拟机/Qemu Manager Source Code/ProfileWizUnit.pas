
unit ProfileWizUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls,IniFiles,TntComCtrls, TntDBGrids, TntStdCtrls, TntMenus, TntDialogs,TntForms,FileCtrl,
  TntExtCtrls, TntButtons,ShellApi;
type
  TDefProWiz = class(TTNTForm)
    Bevel3: TTntBevel;
    Panel2: TTntPanel;
    Label5: TTntLabel;
    OK: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Kqemu: TCheckBox;
    Keyb: TTntComboBox;
    Label11: TTntLabel;
    Lang: TTntComboBox;
    TntLabel1: TTntLabel;
    Label1: TLabel;
    Label2: TLabel;
    Client: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure TntFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TntFormCreate(Sender: TObject);
    procedure LangChange(Sender: TObject);
    procedure OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DefProWiz: TDefProWiz;
  AllowClose : Boolean;

implementation

uses MainUnit;

{$R *.DFM}

procedure TDefProWiz.Button2Click(Sender: TObject);
begin
if MessageDlg('QEMU Manager cannot be ran until the default settings have been selected are you sure you wish to cancel ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  AllowClose := True;
  Application.Terminate;
  End;

end;

procedure TDefProWiz.TntFormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
If AllowClose = False Then CanClose := False;
end;

procedure TDefProWiz.TntFormCreate(Sender: TObject);
begin
AllowClose := False;
end;

procedure TDefProWiz.LangChange(Sender: TObject);
begin
If (Lang.ItemIndex = -1) or (Keyb.ItemIndex = -1) Then OK.Enabled := false Else OK.Enabled := True;

end;

procedure TDefProWiz.OKClick(Sender: TObject);
begin
AllowClose := True;
end;

end.

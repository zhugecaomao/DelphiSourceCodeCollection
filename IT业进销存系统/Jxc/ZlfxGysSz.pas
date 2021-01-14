unit ZlfxGysSz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZlfxSz, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TfrmZlfxGysSz = class(TfrmZlfxSz)
    Label1: TLabel;
    Label2: TLabel;
    btnKhHelp: TSpeedButton;
    Bevel2: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormShow(Sender: TObject);override;
    procedure Edit1Exit(Sender: TObject);
    procedure btnKhHelpClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);override;
  private
    { Private declarations }
  public
    { Public declarations }
    intGYSID: integer;
  end;

var
  frmZlfxGysSz: TfrmZlfxGysSz;

implementation

uses GysHelp, Dm, Common;

{$R *.DFM}

procedure TfrmZlfxGysSz.FormShow(Sender: TObject);
begin
  inherited;
  intGYSID := 0;
  if not Data.GysHelp.Active then
    Data.GysHelp.Active;
  Edit1.SetFocus;
  if Edit1.Text <> '' then
    self.Perform(WM_KEYDOWN, VK_RETURN, 0);
end;

procedure TfrmZlfxGysSz.Edit1Exit(Sender: TObject);
begin
  if Screen.ActiveControl = btnCancel then Exit;
  with CurDs do
  begin
    CommandText := 'select ID, MC from GYS where BH = ''' + Edit1.Text + '''';
    Open;
    if IsEmpty then
    begin
      intGYSID := 0;
      Edit2.Text := '';
      TControl(Sender).Perform(WM_LBUTTONDBLCLK, 0, 0);
    end
    else
    begin
      intGYSID := Fields[0].AsInteger;
      Edit2.Text := Fields[1].AsString;
    end;
  end;
end;

procedure TfrmZlfxGysSz.btnKhHelpClick(Sender: TObject);
begin
  frmGysHelp := TFrmGysHelp.Create(Application);
  with frmGysHelp do
  begin
    dsEditing := nil;
    Edit1.Text := self.Edit1.Text;
    ShowModal;
    self.Edit1.Text := dsHelp.FieldByName('BH').AsString;
    if ModalResult = mrOk then
      Edit1Exit(nil);
    Free;
  end;
end;

procedure TfrmZlfxGysSz.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Application.MessageBox('无效的客户，请重新输入！', '提示', MB_OK + MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;
  inherited;
end;

end.

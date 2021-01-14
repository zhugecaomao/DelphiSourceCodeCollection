unit KhRqd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm;

type
  TfrmKhRqd = class(TfrmComForm)
    btnOk: TBitBtn;                       
    btnCancel: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    btnKhHelp: TSpeedButton;
    Bevel2: TBevel;
    labRq: TLabel;
    dtpRqa: TDateTimePicker;
    Label3: TLabel;
    dtpRqb: TDateTimePicker;
    Edit2: TEdit;
    Edit1: TEdit;
    procedure btnKhHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    intKHID: integer;
  end;

var
  frmKhRqd: TfrmKhRqd;

implementation

uses Main, Dm, KhHelp, ComFun, Common;

{$R *.DFM}

procedure TfrmKhRqd.FormShow(Sender: TObject);
begin
  intKHID := 0;
  if not Data.KhHelp.Active then
    Data.KhHelp.Active;
  dtpRqa.Date := BOFM(Date);
  dtpRqb.Date := Date;
  Edit1.SetFocus;
  if Edit1.Text <> '' then
    self.Perform(WM_KEYDOWN, VK_RETURN, 0);
end;

procedure TfrmKhRqd.Edit1Exit(Sender: TObject);
begin
  if Screen.ActiveControl = btnCancel then Exit;
  with CurDs do
  begin
    CommandText := 'select ID, MC from KH where BH = ''' + Edit1.Text + '''';
    Open;
    if IsEmpty then
    begin
      intKHID := 0;
      Edit2.Text := '';
      TControl(Sender).Perform(WM_LBUTTONDBLCLK, 0, 0);
    end
    else
    begin
      intKHID := Fields[0].AsInteger;
      Edit2.Text := Fields[1].AsString;
    end;
  end;
end;

procedure TfrmKhRqd.btnKhHelpClick(Sender: TObject);
begin
  frmKhHelp := TFrmKhHelp.Create(Application);
  with frmKhHelp do
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

procedure TfrmKhRqd.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Application.MessageBox('无效的客户，请重新输入！', '提示', MB_OK + MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;
  if dtpRqb.Date < dtpRqa.Date then
  begin
    Application.MessageBox('结束日期不能大于起始日期，请重新输入！', '提示', MB_OK + MB_ICONWARNING);
    dtpRqb.SetFocus;
    abort;
  end;
  Close;
  self.ModalResult := MROK;
end;

end.

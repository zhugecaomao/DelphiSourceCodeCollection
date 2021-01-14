unit HpRqd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm;

type
  TfrmHpRqd = class(TfrmComForm)
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
    Label4: TLabel;
    Edit3: TEdit;
    procedure btnKhHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    intHPID: integer;
  end;

var
  frmHpRqd: TfrmHpRqd;

implementation

uses Main, Dm, HpHelp, ComFun, Common;

{$R *.DFM}

procedure TfrmHpRqd.FormShow(Sender: TObject);
begin
  intHPID := 0;
  if not Data.HpHelp.Active then
    Data.HpHelp.Active;
  dtpRqa.Date := BOFM(Date);
  dtpRqb.Date := Date;
  Edit1.SetFocus;
  if Edit1.Text <> '' then
    self.Perform(WM_KEYDOWN, VK_RETURN, 0);
end;

procedure TfrmHpRqd.Edit1Exit(Sender: TObject);
begin
  if Screen.ActiveControl = btnCancel then Exit;
  with CurDs do
  begin
    CommandText := 'select ID, PM, DW from HP where BH = ''' + Edit1.Text + '''';
    Open;
    if IsEmpty then
    begin
      intHPID := 0;
      Edit2.Text := '';
      Edit3.Text := '';
      TControl(Sender).Perform(WM_LBUTTONDBLCLK, 0, 0);
    end
    else
    begin
      intHPID := Fields[0].AsInteger;
      Edit2.Text := Fields[1].AsString;
      Edit3.Text := Fields[2].AsString;
    end;
  end;
end;

procedure TfrmHpRqd.btnKhHelpClick(Sender: TObject);
begin
  frmHpHelp := TFrmHpHelp.Create(Application);
  with frmHpHelp do
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

procedure TfrmHpRqd.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Application.MessageBox('无效的货品，请重新输入！', '提示', MB_OK + MB_ICONWARNING);
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

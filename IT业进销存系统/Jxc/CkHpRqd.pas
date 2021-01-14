unit CkHpRqd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm, Rqdsz;

type
  TfrmCkHpRqd = class(TfrmComForm)
    btnOk: TBitBtn;                       
    btnCancel: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    labRq: TLabel;
    dtpRqa: TDateTimePicker;
    Label3: TLabel;
    dtpRqb: TDateTimePicker;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    btnKhHelp: TSpeedButton;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Bevel3: TBevel;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure btnKhHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    strMC: string;
    intCKID, intHPID: integer;
  end;

var
  frmCkHpRqd: TfrmCkHpRqd;

implementation

uses Main, Dm, MyLib, ComFun, HpHelp, Common;

{$R *.DFM}

procedure TfrmCkHpRqd.FormShow(Sender: TObject);
begin
  intCKID := 0;
  ValuesToStrings(ComboBox1.Items, 'select MC from CK');
  ComboBox1.Items.Insert(0, '全部仓库');
  ComboBox1.ItemIndex := 0;
  intHPID := 0;
  if not Data.HpHelp.Active then
    Data.HpHelp.Active;
  dtpRqa.Date := BOFM(Date);
  dtpRqb.Date := Date;
  ComboBox1.SetFocus;
  if Edit1.Text <> '' then
  begin
    Edit1.SetFocus;
    self.Perform(WM_KEYDOWN, VK_RETURN, 0);
  end;
end;

procedure TfrmCkHpRqd.ComboBox1Exit(Sender: TObject);
begin
  if Screen.ActiveControl = btnCancel then Exit;
  strMC := ComboBox1.Text;
end;

procedure TfrmCkHpRqd.Edit1Exit(Sender: TObject);
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

procedure TfrmCkHpRqd.btnKhHelpClick(Sender: TObject);
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

procedure TfrmCkHpRqd.btnOkClick(Sender: TObject);
begin
  if ComboBox1.Text = '' then
  begin
    Application.MessageBox('无效的仓库，请重新输入！', '提示', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
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
  intCKID := GetFieldValue('select ID from CK where MC = ''' + ComboBox1.Text + '''');
  Close;
  self.ModalResult := MROK;
end;

end.

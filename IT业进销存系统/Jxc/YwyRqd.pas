unit YwyRqd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm;

type
  TfrmYwyRqd = class(TfrmComForm)
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
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    strYWY: string;
  end;

var
  frmYwyRqd: TfrmYwyRqd;

implementation

uses Main, Dm, MyLib, ComFun, Common;

{$R *.DFM}

procedure TfrmYwyRqd.FormShow(Sender: TObject);
begin
  dtpRqa.Date := BOFM(Date);
  dtpRqb.Date := Date;
  ValuesToStrings(ComboBox1.Items, 'select XM from YG where YWYBZ order by BH');
  ComboBox1.Items.Add('其他');
  ComboBox1.SetFocus;
  if ComboBox1.Text <> '' then
    self.Perform(WM_KEYDOWN, VK_RETURN, 0);
end;

procedure TfrmYwyRqd.ComboBox1Exit(Sender: TObject);
begin
  if Screen.ActiveControl = btnCancel then Exit;
  with CurDs do
  begin
    CommandText := 'select XM from YG where BH = ''' + ComboBox1.Text + '''';
    Open;
    if not IsEmpty then
      ComboBox1.Text := Fields[0].AsString;
    Close;
  end;
  strYWY := ComboBox1.Text;
  if strYWY = '其他' then
    strYWY := '';
end;

procedure TfrmYwyRqd.btnOkClick(Sender: TObject);
begin
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

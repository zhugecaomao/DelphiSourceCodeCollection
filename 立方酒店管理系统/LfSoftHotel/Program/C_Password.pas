unit C_Password;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, C_Define, DateUtils, DosMove,
  ExtCtrls;

type
  TPasswordForm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    cmbCzy: TComboBox;
    edtPassword: TEdit;
    tblYgda: TTable;
    Label1: TLabel;
    Label2: TLabel;
    DosMove1: TDosMove;
    Label4: TLabel;
    Label6: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbCzyExit(Sender: TObject);
  private
    { Private declarations }
    FDl : Boolean;
  public
    { Public declarations }
  end;

var
  PasswordForm: TPasswordForm;

function CzyDl : Boolean;

implementation

uses C_HotelData;

{$R *.dfm}

function CzyDl : Boolean;
begin
  PasswordForm := TPasswordForm.Create(Application);
  Result := False;
  try
    with PasswordForm do
    begin
      FDl := False;
      try
        tblYgda.Open;
      except
        On E:Exception do
        begin
          ShowWarning('打开数据库出错，请检查网络连接是否正常！'
                      +#13#10
                      +'错误信息:'
                      +E.Message);
          raise;
        end;
      end;

      ShowModal;
      Result := FDl;
    end;
  finally
    PasswordForm.Free;
  end;
end;

procedure TPasswordForm.btnCancelClick(Sender: TObject);
begin
  FDl := False;
  Close;
end;

procedure TPasswordForm.btnOKClick(Sender: TObject);
var
  APassword: string;
begin
  APassword := edtPassword.Text;
  with tblYgda do
  begin
    if FindKey([CZY.Czybh]) then
    begin
      if FieldByName('D_KL').AsString=APassword then
      begin
        FDl := True;
        PasswordForm.Close;
      end
      else
      begin
        ShowWarning('口令错误！');
        edtPassword.SetFocus;
      end;
    end;
  end;
end;

procedure TPasswordForm.FormShow(Sender: TObject);
begin
  HotelData.ListDm(cmbCzy,'YGDA','D_YGXM');
  //cmbCzy.ItemIndex := 1;
  cmbCzy.SetFocus;
end;

procedure TPasswordForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblYgda.Close;
end;

procedure TPasswordForm.cmbCzyExit(Sender: TObject);
begin
  CZY.CzyXm := HotelData.FindMc('YGDA','D_YGBH','D_YGXM',cmbCzy.Text);
  if CZY.CzyXm='' then
  begin
    CZY.CzyXm := GetMc(cmbCzy.Items[cmbCzy.ItemIndex]);
    CZY.CzyBh := HotelData.FindBh('YGDA','D_YGBH','D_YGXM',CZY.CzyXm);
    DQCZY.CzyXm := CZY.CzyXm;
    if CZY.CzyBh='' then
      cmbCzy.SetFocus;
  end;
end;

end.

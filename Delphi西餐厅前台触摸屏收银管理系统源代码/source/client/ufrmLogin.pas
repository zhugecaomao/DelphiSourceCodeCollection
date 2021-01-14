unit ufrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxfColorButton;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    eEmpCd: TEdit;
    eEmpPassword: TEdit;
    bbtnConfirm: TBitBtn;
    bbtnBack: TBitBtn;
    btnNum0: TdxfColorButton;
    btnNum1: TdxfColorButton;
    btnNum2: TdxfColorButton;
    btnNum3: TdxfColorButton;
    btnNum4: TdxfColorButton;
    btnNum5: TdxfColorButton;
    btnNum6: TdxfColorButton;
    btnNum7: TdxfColorButton;
    btnNum8: TdxfColorButton;
    btnNum9: TdxfColorButton;
    btnModify: TdxfColorButton;
    btnClear: TdxfColorButton;
    procedure bbtnConfirmClick(Sender: TObject);
    procedure bbtnBackClick(Sender: TObject);
  private  
    Fi_Flag: Integer;
    Fs_EmpCd, Fs_EmpPassword: String;
    procedure prip_IniInterFace;
    procedure prip_IniData;     
    procedure OnEditEnter(Sender: TObject);
    procedure prip_GetEmpPower(As_EmpCD: String);
    procedure OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function prif_CheckUser: Boolean;
  public
    procedure pubp_Ini;
    function pubf_Ini: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses StrUtils, udmData, upubCommon, ufrmMain, uPubClient;

{$R *.dfm}

procedure TfrmLogin.prip_IniData; 
begin
  Fi_Flag := 0;
end;

procedure TfrmLogin.prip_IniInterFace;
begin
  eEmpCd.OnEnter := OnEditEnter;
  eEmpPassword.OnEnter := OnEditEnter; 
  btnNum0.OnMouseDown := OnBbtnNumClick;
  btnNum1.OnMouseDown := OnBbtnNumClick;
  btnNum2.OnMouseDown := OnBbtnNumClick;
  btnNum3.OnMouseDown := OnBbtnNumClick;
  btnNum4.OnMouseDown := OnBbtnNumClick;
  btnNum5.OnMouseDown := OnBbtnNumClick;
  btnNum6.OnMouseDown := OnBbtnNumClick;
  btnNum7.OnMouseDown := OnBbtnNumClick;
  btnNum8.OnMouseDown := OnBbtnNumClick;
  btnNum9.OnMouseDown := OnBbtnNumClick;
  btnModify.OnMouseDown := OnBbtnNumClick;
  btnClear.OnMouseDown := OnBbtnNumClick;
  WindowState := wsMaximized;
end;

procedure TfrmLogin.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmLogin.OnEditEnter(Sender: TObject);
begin
  if Sender is TEdit then
  begin
    Fi_Flag := (Sender as TEdit).Tag;
    (Sender as TEdit).Clear;
    (Sender as TEdit).SelectAll;
  end;
end;

procedure TfrmLogin.OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
var
  li_Tag: Integer;
begin
  li_Tag := (Sender as TdxfColorButton).Tag;
  case li_Tag of
    11:
    begin
      case Fi_Flag of
        0:
        begin
          eEmpCd.Text := LeftStr(eEmpCd.Text, Length(eEmpCd.Text) - 1);
        end;
        1:
        begin
          eEmpPassword.Text := LeftStr(eEmpPassword.Text,
            Length(eEmpPassword.Text) - 1);
        end;
      end;
      Exit;
    end;
    12:
    begin
      case Fi_Flag of
        0:
        begin
          eEmpCd.Clear;
        end;
        1:
        begin
          eEmpPassword.Clear;
        end;
      end;
      Exit;
    end;
  end;
  Case Fi_Flag of
    0:
    begin
      if Length(Trim(eEmpCd.Text)) >= 4 then
      begin
        Fs_EmpCd := '';
        eEmpCd.Clear;
      end;
      Fs_EmpCd := LeftStr((Sender as TdxfColorButton).Caption.Text, 1);
      eEmpCd.Text := eEmpCd.Text + Fs_EmpCd;
    end;
    1:
    begin  
      if Length(Trim(eEmpPassword.Text)) >= 4 then
      begin
        Fs_EmpPassword := '';
        eEmpPassword.Clear;
      end;
      Fs_EmpPassword := LeftStr((Sender as TdxfColorButton).Caption.Text, 1);
      eEmpPassword.Text := eEmpPassword.Text + Fs_EmpPassword;
    end;
  end;
end;

procedure TfrmLogin.bbtnConfirmClick(Sender: TObject);
begin
  if not prif_CheckUser then
  begin
    Exit;
  end;
  prip_GetEmpPower(LoginInfo.UserId); 
  pubCommon.OnOffLine := True; 
  ModalResult := mrOk;
  //if not OpenSelectMain then Exit;
end;

function TfrmLogin.prif_CheckUser: Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM sys_user WHERE user_id = ''%s'' AND ' +
      ' password = ''%s''', [eEmpCd.Text, eEmpPassword.Text]);
    Open;
    if not IsEmpty then
    begin
      LoginInfo.UserId := FieldByName('user_id').AsString;
      LoginInfo.UserName := FieldByName('user_name').AsString;
      LoginInfo.IsLogin := 1;
      LoginInfo.OnLineTime := Now;
      Result := True;
    end else Result := False;
    Close;
  end;
end;

procedure TfrmLogin.prip_GetEmpPower(As_EmpCD: String);
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT * FROM T_EMPLOYEE_MS WHERE I_EMP_CD = ''%s''', [LoginInfo.UserId]);
    Open;
    if not IsEmpty then
    begin
      PowerInfo.UnLock := FieldByName('I_UNLOCK').AsBoolean;
      PowerInfo.Change := FieldByName('I_CHANGE').AsBoolean;
      PowerInfo.Delete := FieldByName('I_DELETE').AsBoolean;
      PowerInfo.OutDiscount := FieldByName('I_OUTDISCOUNT').AsBoolean;
      PowerInfo.PosSet := FieldByName('I_POS_SET').AsBoolean;
      PowerInfo.Beginning := FieldByName('I_BEGINNING').AsBoolean;
      PowerInfo.ExitPos := FieldByName('I_EXIT').AsBoolean;
      PowerInfo.ChangeDateTime := FieldByName('I_DATETIME').AsBoolean;
    end else
    begin   
      PowerInfo.UnLock := False;
      PowerInfo.Change := False;
      PowerInfo.Delete := False;
      PowerInfo.OutDiscount := False;
      PowerInfo.PosSet := False;
      PowerInfo.Beginning := False;
      PowerInfo.ExitPos := False;
      PowerInfo.ChangeDateTime := False;
    end;
    Close;
  end;
end;

function TfrmLogin.pubf_Ini: Boolean;
begin
  dmData := TdmData.Create(nil);
  Result := dmData.pubf_Connect;
end;

procedure TfrmLogin.bbtnBackClick(Sender: TObject);
begin
  Close;
end;

end.

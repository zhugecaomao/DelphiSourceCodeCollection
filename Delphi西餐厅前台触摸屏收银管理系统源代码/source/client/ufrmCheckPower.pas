unit ufrmCheckPower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxfColorButton, StdCtrls, Buttons;

type
  TfrmCheckPower = class(TForm)
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
    Fs_Power, Fs_EmpCd, Fs_EmpPassword: String;
    procedure prip_IniInterFace;
    procedure prip_IniData;     
    procedure OnEditEnter(Sender: TObject);  
    procedure OnBbtnNumClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function prif_CheckUser: Boolean;
  public
    procedure pubp_Ini(As_Power: String);
  end;

var
  frmCheckPower: TfrmCheckPower;

implementation
uses StrUtils, udmData, upubCommon, ufrmDiscount;

{$R *.dfm}

{ TfrmCheckPower }

procedure TfrmCheckPower.OnBbtnNumClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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

procedure TfrmCheckPower.OnEditEnter(Sender: TObject);
begin
  if Sender is TEdit then
  begin
    Fi_Flag := (Sender as TEdit).Tag;
    (Sender as TEdit).Clear;
    (Sender as TEdit).SelectAll;
  end;
end;

function TfrmCheckPower.prif_CheckUser: Boolean;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := Format('SELECT A.user_id FROM sys_user A, sys_user_power B WHERE A.user_id = ''%s'' AND ' +
      ' A.password = ''%s'' AND B.menu_itemid = ''%s'' AND B.menu_parentid = ''%s'' AND ' +
      ' B.user_id  = A.user_id', [eEmpCd.Text, eEmpPassword.Text, Fs_Power, Fs_Power]);
    Open;
    if not IsEmpty then
    begin
      //LoginInfo.PowerUser := eEmpCd.Text;
      //LoginInfo.PowerCode := Fs_Power;
      Result := True;
    end else Result := False;
    Close;
  end;
end;

procedure TfrmCheckPower.prip_IniData;
begin
  Fi_Flag := 0;
end;

procedure TfrmCheckPower.prip_IniInterFace;
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

procedure TfrmCheckPower.pubp_Ini(As_Power: String);
begin
  Fs_Power := As_Power;
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmCheckPower.bbtnConfirmClick(Sender: TObject);
begin
  if prif_CheckUser then
  begin
    if Fs_Power = '9999' then
    begin
      frmDiscount := TfrmDiscount.Create(nil);
      try
        frmDiscount.pubp_Ini;
        ModalResult := frmDiscount.ShowModal; 
      finally
        frmDiscount.Free;
      end;
    end else ModalResult := MrOk;
  end;
end;

procedure TfrmCheckPower.bbtnBackClick(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

end.

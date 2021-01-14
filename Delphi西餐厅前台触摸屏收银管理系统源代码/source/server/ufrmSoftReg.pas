unit ufrmSoftReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSoftReg = class(TForm)
    Panel1: TPanel;
    spbtnReg: TSpeedButton;
    spbtnClose: TSpeedButton;
    Panel2: TPanel;
    memRemark: TMemo;
    Label1: TLabel;
    eRegCode: TEdit;
    pRegInput: TPanel;
    Label2: TLabel;
    eCode: TEdit;
    procedure spbtnCloseClick(Sender: TObject);
    procedure spbtnRegClick(Sender: TObject);
    procedure eRegCodeChange(Sender: TObject);
  private
    procedure prip_IniInterFace;
    procedure prip_Reg(As_RegCode: String);
//    function prif_CheckReg: Boolean;
    function prif_DecodePass(As_RegCode: String): String;
  public

    procedure pubp_Ini;
  end;

var
  frmSoftReg: TfrmSoftReg;
Const
  REGINFO = '    本软件版权归上海利达软件公司所有，未经许可使用者，将负相应的法律责任。' + Chr(13) + Chr(10) +
            '对本软件在使用过程中出现的问题，本人提供电话技术支持。' + Chr(13) + Chr(10) +
            '联系电话：13361978926' + Chr(13) + Chr(10) +
            'QQ：398009509';
  UNREGINFO = '    谢谢使用本软件！'  + Chr(13) + Chr(10) +
            '对本软件在使用过程中出现的问题，本人提供电话技术支持。' + Chr(13) + Chr(10) +
            '联系电话：13361978926' + Chr(13) + Chr(10) +
            'QQ：398009509';
implementation
uses Registry, udmData;
{$R *.dfm}

{ TfrmSoftReg }

{function TfrmSoftReg.prif_CheckReg: Boolean;
var
  lc_Reg: TRegistry;
  ls_KeyName: String;
  ls_Pass: String;
  ls_Temp: String;
begin
  Result := True;
  ls_KeyName := 'SOFTWARE\' + Application.ExeName;
  lc_Reg := TRegistry.Create;
  try
    lc_Reg.RootKey := HKEY_LOCAL_MACHINE;
    if lc_Reg.OpenKey(ls_KeyName, True) then
    begin
      ls_Temp := ExtractFileName(Application.ExeName);
      ls_Pass := lc_Reg.ReadString(ls_Temp);
      if ls_Pass = prif_DecodePass(dmData.GlobalKey) then begin
        Result := True;
      end else Result := False;
    end;
  finally
    lc_Reg.Free;
  end;
end;}

procedure TfrmSoftReg.prip_IniInterFace;
begin
  Position := poScreenCenter;
end;

procedure TfrmSoftReg.prip_Reg(As_RegCode: String);
var
  lc_Reg: TRegistry;
  ls_KeyName: String; 
  ls_Temp: String;
begin
  ls_KeyName := 'SOFTWARE\' + Application.ExeName;
  lc_Reg := TRegistry.Create;
  try
    lc_Reg.RootKey := HKEY_LOCAL_MACHINE;
    if lc_Reg.OpenKey(ls_KeyName, True) then
    begin
      ls_Temp := ExtractFileName(Application.ExeName);
      lc_Reg.WriteString(ls_Temp, As_RegCode);
    end;
  finally
    lc_Reg.Free;
  end;
end;

procedure TfrmSoftReg.pubp_Ini;
begin
  prip_IniInterFace;
  if not dmData.IsReg  then
  begin
    memRemark.Lines.Add(REGINFO);
    eCode.Text := dmData.As_SerialNum;
    Caption := '软件未注册';
  end else
  begin
    memRemark.Lines.Add(UNREGINFO);
    eCode.Visible := False;
    Caption := '软件已注册';
    spbtnReg.Visible := False;
    pRegInput.Visible := False;
  end;
end;

procedure TfrmSoftReg.spbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSoftReg.spbtnRegClick(Sender: TObject);
begin
  prip_Reg(eRegCode.Text);
  Application.MessageBox('感谢您注册本软件！请重新运行本程序！', PChar(Caption), MB_OK + MB_ICONINFORMATION);
  Close;
end;

procedure TfrmSoftReg.eRegCodeChange(Sender: TObject);
begin
  spbtnReg.Enabled := eRegCode.Text = prif_DecodePass(dmData.As_SerialNum) ;
end;

function TfrmSoftReg.prif_DecodePass(As_RegCode: String): String;
var
  li_I: Integer;
begin
  for li_I := 1 to Length(As_RegCode) - 1 do
  begin
    Result := Result + IntToStr(Ord(As_RegCode[li_I]) + li_I + $20);
  end;
end;

end.

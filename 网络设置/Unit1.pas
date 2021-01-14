unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls,xpman, Buttons;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Button1: TButton;
    Dialog1: TOpenDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//Download by http://www.codefans.net
var
  Form1: TForm1;

implementation
  uses Registry;
{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  Reg: TReginiFile;
  CompName: Pchar;
  NameSize: Cardinal;
begin
  if (Trim(Edit1.Text)<>'')and(Trim(Edit2.Text)<>'')then
  begin
    Try
      Namesize := 30;
      getmem(CompName,namesize);
      GetComputerName(Compname,NameSize);
      Reg := TReginiFile.Create;
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.RegistryConnect('\\'+ Edit1.Text) = True then
        ShowMessage('成功.')
      else
        ShowMessage('失败.');
      Reg.WriteString('software\microsoft\windows\currentversion\run'+#0,'自动运行',CompName+'\\'+Copy(Trim(Edit2.Text),4,Length(edit2.Text)));
    Finally
      Reg.Free;
    End;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Dialog1.Execute then
    Edit2.Text := Trim(Dialog1.FileName);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  comname: String;
begin
  if InputQuery('修改计算机名称','请输入新的计算机名称',comname) then
    if Trim(comname)<>'' then
    begin
      if SetComputerName(Pchar(comname))= True then
        Application.MessageBox('修改成功,系统重新启动后生效.','提示',64)
      else
        Application.MessageBox('修改失败.','提示',64);
    end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  Reg: TRegIniFile;
  Addr: String;
begin
  if InputQuery('修改DNS地址','请输入DNS地址',addr) then
    if Trim(Addr)<>'' then
    begin
      Try
        Reg := TRegIniFile.Create('');
        reg.RootKey := HKEY_LOCAL_MACHINE;
        reg.WriteString('system\currentControlset\services\tcpip\parameters','NameServer',addr);
        Application.MessageBox('修改成功.','提示',64);
      Finally
        Reg.Free;
      End;
    end;
end;

end.

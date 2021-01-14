unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, ActiveX, bsSkinData, BusinessSkinForm, bsSkinCtrls,
  StdCtrls, Mask, bsSkinBoxCtrls, bsSkinShellCtrls, bsMessages;

type
  TfrmMain = class(TForm)
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsSkinLabel1: TbsSkinLabel;
    edtDatabaseFile: TbsSkinFileEdit;
    bsSkinLabel2: TbsSkinLabel;
    edtPassword: TbsSkinPasswordEdit;
    bsSkinButton1: TbsSkinButton;
    bsSkinButton2: TbsSkinButton;
    SkinMessage: TbsSkinMessage;
    procedure bsSkinButton2Click(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CompactDatabase(const AFileName, APassWord: string): Boolean;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function TfrmMain.CompactDatabase(const AFileName, APassWord: string): Boolean;
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
var
  SPath: string;
  SFile: array[0..254] of Char;
  STempFileName: string;
  JE: OleVariant;

  function GetTempDir: string;
  var
    Buffer: array[0..MAX_PATH] of Char;
  begin
    ZeroMemory(@Buffer, MAX_PATH);
    GetTempPath(MAX_PATH, Buffer);
    Result := IncludeTrailingBackslash(StrPas(Buffer));
  end;

begin
  Result := False;
  SPath := GetTempDir; //取得Windows的Temp路径
  GetTempFileName(PChar(SPath), '~ACP', 0, SFile); //取得Temp文件名,Windows将自动建立0字节文件
  STempFileName := SFile; //PChar->String
  if not DeleteFile(STempFileName) then Exit; //删除Windows建立的0字节文件
  try
    JE := CreateOleObject('JRO.JetEngine'); //建立OLE对象,函数结束OLE对象超过作用域自动释放
    OleCheck(JE.CompactDatabase(Format(SConnectionString, [AFileName, APassWord]),
      Format(SConnectionString, [STempFileName, APassWord]))); //压缩数据库
    //复制并覆盖源数据库文件,如果复制失败则函数返回假,压缩成功但没有到函数的功能
    Result := CopyFile(PChar(STempFileName), PChar(AFileName), False);
    DeleteFile(STempFileName); //删除临时文件
  except
    //压缩失败
  end;
end;

procedure TfrmMain.bsSkinButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.bsSkinButton1Click(Sender: TObject);
begin
  if Trim(edtDatabaseFile.Text) <> '' then
    if SkinMessage.MessageDlg('压缩数据库操作可能会需要很长时间，期间请不要关闭本程序',
      mtWarning, [mbOK, mbCancel], 0) = idOK then
    if CompactDatabase(edtDatabaseFile.Text, edtPassword.Text) then
      SkinMessage.MessageDlg('压缩数据库成功', mtInformation, [mbOK], 0)
    else
      SkinMessage.MessageDlg('压缩失败，可能是您的计算机中没有安装 ADO 引擎，或者是数据库文件正被其它程序打开',
        mtError, [mbOK], 0);

end;

end.

unit FrmBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPageControl, ComCtrls, StdCtrls, ADODB, Buttons, ComObj, IdGlobal;

type
  TBackup = class(TForm)
    AdvPageControl1: TAdvPageControl;
    AdvTabSheet1: TAdvTabSheet;
    AdvTabSheet2: TAdvTabSheet;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    AdvTabSheet3: TAdvTabSheet;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RichEdit2: TRichEdit;
    Label3: TLabel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Edit2: TEdit;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    
  public
    
  end;

var
  Backup: TBackup;

implementation

uses
  FrmData;
{$R *.dfm}

procedure TBackup.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TBackup.BitBtn3Click(Sender: TObject);
var 
 dao:OLEVariant; 
 mdbpath:string; 
begin 
 mdbpath:=extractfilepath(application.exename) +'Data\BkData.mdb';
 
 Try
   if DataModule1.ADOCon.Connected then
   DataModule1.ADOCon.Close;
   screen.Cursor:=crHourGlass;
   
   If Application.Messagebox('确定数据库压缩吗？','提示信息',Mb_YesNo+Mb_IconQuestion)=Mryes Then 
   begin 
     Try
       Application.MessageBox(PChar('数据库未压缩时大小:'+IntToStr(FileSizeByName(mdbpath) div 1024) + ' KB'),'提示信息',MB_OK +
         MB_ICONINFORMATION);
       dao:=CreateOleObject('DAO.DBEngine.36');
       dao.CompactDatabase(mdbpath,'temp.mdb');
       DeleteFile(mdbpath); 
       RenameFile('temp.mdb',mdbpath);
       Application.MessageBox(PChar('数据库压缩完毕！'#10#13'数据库压缩后大小:'+IntToStr(FileSizeByName(mdbpath) div 1024) + ' KB'),'提示信息',MB_OK +
         MB_ICONINFORMATION);
     Except
       Application.MessageBox('数据库压缩失败！','提示信息',MB_OK + MB_ICONINFORMATION);
     End; 
   end;
   DataModule1.ADOCon.Open;
 Finally
   screen.Cursor:=crDefault; 
 End; 
end;

procedure TBackup.BitBtn6Click(Sender: TObject);
var
  aDataPath: string;
begin
  if Edit2.Text='' then
  begin
    Application.MessageBox('请选择路径！    ', '贝壳提示', MB_OK + 
      MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
    Exit;  
  end;
  if RadioButton3.Checked then
  begin
    if SaveDialog1.FileName<>'' then
    begin
      aDataPath:=ExtractFilePath(ParamStr(0))+'data\BKdata.mdb';
      if FileExists(Savedialog1.FileName) then
         if Messagebox(handle,'存在数据库重名，是否覆盖？','存盘选项',mb_iconquestion+mb_yesno) = ID_YES then
         begin
            CopyFile(PChar(aDataPath),PChar(SaveDialog1.FileName+'.MDB'),False);
            Application.MessageBox('备份成功！   ', '贝壳提示', MB_OK +
            MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
         end;
    end;
  end;
  if RadioButton4.Checked then
  begin
    if OpenDialog1.FileName<>'' then
    begin
      aDataPath:=ExtractFilePath(ParamStr(0))+'data\BKdata.mdb';
      if FileExists(aDataPath) then
         if Messagebox(handle,'存在数据库重名，是否覆盖？','存盘选项',mb_iconquestion+mb_yesno) = ID_YES then
         begin
            CopyFile(PChar(OpenDialog1.FileName),PChar(aDataPath),False);
            Application.MessageBox('恢复成功！   ', '贝壳提示', MB_OK +
            MB_ICONWARNING + MB_DEFBUTTON3 + MB_TOPMOST);
         end;
    end;
  end;
end;

procedure TBackup.Button2Click(Sender: TObject);
begin
  if RadioButton3.Checked then
  begin
    SaveDialog1.Execute;
    if SaveDialog1.FileName<>'' then
      edit2.Text:=SaveDialog1.FileName;
  end;
  if RadioButton4.Checked then
  begin
    OpenDialog1.Execute;
    if OpenDialog1.FileName<>'' then
      edit2.Text:=OpenDialog1.FileName;
  end;
end;

end.

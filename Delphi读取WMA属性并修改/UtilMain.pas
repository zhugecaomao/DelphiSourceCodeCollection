unit UtilMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ClsWmaOpter, ComCtrls, AdoDB, ActiveX;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    PageCtrlMain: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtTitle: TEdit;
    edtArtist: TEdit;
    edtCopyRight: TEdit;
    edtComment: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel1: TPanel;
    btnSearch: TButton;
    Edit1: TEdit;
    Button1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Button7: TButton;
    OpenDlgDir: TOpenDialog;
    MemoDir: TMemo;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    edtDir: TEdit;
    edtDest: TEdit;
    procedure btnSearchClick(Sender: TObject);
    procedure OpenDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
    FAdoQuery: TAdoQuery;
    FWmaObj: TWma;
    FFileList: TStringList;

    function  LoadChildDirList(const strPath: string): TComboBox;
    procedure SearchFile(strDir: string);
    procedure LoadMusicList(strPath: string);
    procedure getSingerAndSong(strFileName: string; var singer, song: string);
    procedure updateDB(strSQL: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
   Util2;

{$R *.dfm}

procedure TForm1.btnSearchClick(Sender: TObject);
begin
   OpenDialog1.Execute;
end;



procedure TForm1.OpenDialog1CanClose(Sender: TObject;
  var CanClose: Boolean);
var
   j: Integer;
   strFile: string;
   container: TContainer;
   objN: TNormalTagFrame;
   objE: TExtendTagFrame;
   objS: TSystemTagFrame;
   list: TList;
   sect: TExtendTagSection;
begin
   edtTitle.Text := '';
   edtArtist.Text := '';
   edtCopyRight.Text := '';
   edtComment.Text := '';

   FreeAndNil(FWmaObj);
   if (OpenDialog1.Files.Count > 0) then
   begin
      strFile := Trim(OpenDialog1.Files.Strings[0]);

      if (FileExists(strFile)) then
      begin
         FWmaObj := TWma.Create;
         FWmaObj.loadFromFile(strFile);

         container := FWmaObj.RootList;

         if (Assigned(container)) then
         begin
            objN := container.getNormalTag();
            if (Assigned(objN)) then
            begin
               Memo1.Lines.Add(Format('Title      =  [%s]', [objN.Title]));
               Memo1.Lines.Add(Format('Artist     =  [%s]', [objN.Artist]));
               Memo1.Lines.Add(Format('CopyRight  =  [%s]', [objN.CopyRight]));
               Memo1.Lines.Add(Format('Comment    =  [%s]', [objN.Comment]));

               edtTitle.Text := objN.Title;
               edtArtist.Text := objN.Artist;
               edtCopyRight.Text := objN.CopyRight;
               edtComment.Text := objN.Comment;
            end;

            objE := container.getExtendTag();
            if (Assigned(objE)) then
            begin
               list := objE.SectionList;
               if (Assigned(list)) then
               begin
                  for j := 0 to list.Count - 1 do
                  begin
                     sect := TExtendTagSection(list.Items[j]);
                     if (Assigned(sect)) then
                     begin
                        Memo1.Lines.Add(Format('%s  = [%s]', [sect.SectionName, sect.SectionValue]));
                     end;
                  end;
               end;
            end;

            objS := container.getSystemTag();
            if (Assigned(objS)) then
            begin
               Memo1.Lines.Add(Format('The wma file''size=[%d]', [objS.FileSize]));
            end;
         end;
      end;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   FWmaObj := nil;
   FFileList := nil;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   if (Assigned(FWmaObj)) then
   begin
      FWmaObj.setTitle(edtTitle.Text);
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   if (Assigned(FWmaObj)) then
   begin
      FWmaObj.setArtist(edtArtist.Text);
   end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   if (Assigned(FWmaObj)) then
   begin
      FWmaObj.setCopyRight(edtCopyRight.Text);
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   if (Assigned(FWmaObj)) then
   begin
      FWmaObj.setComment(edtComment.Text);
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
   strFileName: string;
begin
   if (Assigned(FWmaObj)) then
   begin
      strFileName := Edit1.Text;
      //if (FileExists(strFileName)) then
      //begin
      FWmaObj.saveToFile(strFileName);
      //end;
   end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   if (Assigned(FWmaObj)) then
   begin
      FWmaObj.clearExtendTag;
   end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
   strDir, strPath: string;
   cbox: TComboBox;
   i: Integer;
begin
   MemoDir.Clear;
   strDir := edtDir.Text;
   if (not DirectoryExists(strDir)) then
      showMessage('文件夹' + strDir + '不存在')
   else
   begin
      strDir := IncludeTrailingBackSlash(edtDir.Text);

      cbox := LoadChildDirList(strDir);
      if (Assigned(cbox)) then
      begin
         try
            for i := 0 to cbox.Items.Count - 1 do
            begin
               strPath := cbox.Items[i];
               if (Length(strPath) > 2) then
               begin
                  strPath := Copy(strPath, 2, Length(strPath) - 2);
               end;

               if ((strPath <> '.') and (strPath <> '..')) then
               begin
                  SearchFile(strDir + strPath);
               end;
            end;
         finally
            FreeAndNil(cBox);
         end;
      end;

      //读取文件
      LoadMusicList(strDir);
   end;
end;

function TForm1.LoadChildDirList(const strPath: string): TComboBox;
var
   strTemp: string;
   cboxRet: TComboBox;
begin
   cboxRet := TComboBox.Create(self);
   cboxRet.Visible := false;

   if (Assigned(cboxRet)) then
   begin
      cboxRet.Parent := self;
      cboxRet.Items.Clear;

      //将目录下的子目录保存到ComboBox中
      strTemp := strPath + '*.*';
      SendMessage(cboxRet.Handle, CB_DIR, (DDL_EXCLUSIVE + DDL_DIRECTORY),
         Integer(strTemp));
   end;

   Result := cboxRet;
end;

procedure TForm1.SearchFile(strDir: string);
var
   cbox: TComboBox;
   i: Integer;
   strPath: string;
begin
   strDir := IncludeTrailingBackSlash(strDir);

   //读取文件夹并递归调用
   cbox := LoadChildDirList(strDir);
   if (Assigned(cbox)) then
   begin
      try
         for i := 0 to cbox.Items.Count - 1 do
         begin
            strPath := cbox.Items[i];
            if (Length(strPath) > 2) then
            begin
               strPath := Copy(strPath, 2, Length(strPath) - 2);
            end;

            if ((strPath <> '.') and (strPath <> '..')) then
            begin
               SearchFile(strDir + strPath);
            end;
         end;
      finally
         FreeAndNil(cBox);
      end;
   end;

   //读取文件
   LoadMusicList(strDir);
end;

procedure TForm1.LoadMusicList(strPath: string);
var
   strFileName, strTemp: string;
   nRet: Integer;
   F: TSearchRec;
begin
   strPath := IncludeTrailingBackSlash(strPath);

   Sleep(5);
   Application.ProcessMessages;

   //分种类读取音乐,分种类插入队列
   strTemp := Format('%s*.wma', [strPath]);
   if (not Assigned(FFileList)) then
      FFileList := TStringList.Create;

   if (Assigned(FFileList)) then
   begin
      nRet := FindFirst(strTemp, faAnyFile, F);
      while (nRet = 0) do
      begin
         strFileName := F.Name;
         if ((strFileName <> '.') and (strFileName <> '..')) then
         begin
            strFileName := strPath + strFileName;
            FFileList.Add(strFileName);
            MemoDir.Lines.Add('Find File-->[' + strFileName + ']');
         end;

         nRet := FindNext(F);

         Sleep(2);
         Application.ProcessMessages;
      end;
      
      FindClose(F);
   end;
end;

//将wma文件的信息读取出来,更新到数据库
procedure TForm1.Button8Click(Sender: TObject);
var
   i: Integer;
   strFileName, strSongName, strSinger: string;
   strSQL: string;
   wma: TWma;

   nTag: TNormalTagFrame;
   eTag: TExtendTagFrame;

   strWMFSDKVersion: string;
   strWMFSDKNeeded: string;
   strWMAlbumTitle: string;
   strIsVBR: string;
   strWMYear: string;
   strWMPromotionURL: string;
   strWMGenreID: string;
   strWMGenre: string;
   strWMComposer: string;
   strWMOriginalArtist: string;
   strWMURL: string;
   strWMUserWebURL: string;
   strWMEncodedBy: string;
   strWMTrackNumber: string;
   strTitle: string;
   strArtist: string;
   strCopyRight: string;
   strComment: string;
begin
   if (Assigned(FFileList)) then
   begin
      for i := 0 to FFileList.Count - 1 do
      begin
         strFileName := FFileList.Strings[i];
         getSingerAndSong(strFileName, strSinger, strSongName);

         wma := TWma.Create;

         try
            try
               wma.loadFromFile(strFileName);
         
               if (Assigned(wma)) then
               begin
                  if (not wma.isWmaFile()) then
                  begin
                     strSQL := Format('update t_1tingtask set descb2 = %s ' +
                        ' where singer_name = %s and song_name = %s',
                        [QuotedStr('is not wma'), QuotedStr(strSinger),
                         QuotedStr(strSongName)]);
                     updateDB(strSQL);
                  end
                  else
                  begin
                     nTag := wma.NormalTag;
                     eTag := wma.ExtendTag;

                     if (Assigned(nTag)) then
                     begin
                        strTitle := nTag.Title;
                        strArtist := nTag.Artist;
                        strCopyRight := nTag.CopyRight;
                        strComment := nTag.Comment;
                     end;

                     if (Assigned(eTag)) then
                     begin
                        strWMFSDKVersion := eTag.WMFSDKVersion;
                        strWMFSDKNeeded := eTag.WMFSDKNeeded;
                        strWMAlbumTitle := eTag.WMAlbumTitle;
                        strIsVBR := eTag.IsVBR;
                        strWMYear := eTag.WMYear;
                        strWMPromotionURL := eTag.WMPromotionURL;
                        strWMGenreID := eTag.WMGenreID;
                        strWMGenre := eTag.WMGenre;
                        strWMComposer := eTag.WMComposer;
                        strWMOriginalArtist := eTag.WMOriginalArtist;
                        strWMURL := eTag.WMURL;
                        strWMUserWebURL := eTag.WMUserWebURL;
                        strWMEncodedBy := eTag.WMEncodedBy;
                        strWMTrackNumber := eTag.WMTrackNumber;
                     end;

                     strSQL := Format('update t_1tingtask set wmfsdkversion=%s,' +
                        'wmfsdkneeded = %s, wmalbumtitle = %s, isvbr = %s, ' +
                        'wmyear = %s, wmpromotionurl = %s, wmgenreid = %s, ' +
                        'wmgenre = %s, wmcomposer = %s, wmoriginalartist = %s, ' +
                        'wmurl = %s, wmuserweburl = %s, wmencodedby = %s, ' +
                        'wmtracknumber = %s, title = %s, artist = %s, ' +
                        'copyright = %s, comments = %s, descb2 = %s ' +
                        'where singer_name = %s and song_name = %s',
                        [QuotedStr(strWMFSDKVersion),
                         QuotedStr(strWMFSDKNeeded),
                         QuotedStr(strWMAlbumTitle),
                         QuotedStr(strIsVBR),
                         QuotedStr(strWMYear),
                         QuotedStr(strWMPromotionURL),
                         QuotedStr(strWMGenreID),
                         QuotedStr(strWMGenre),

                         QuotedStr(strWMComposer),
                         QuotedStr(strWMOriginalArtist),
                         QuotedStr(strWMURL),
                         QuotedStr(strWMUserWebURL),
                         QuotedStr(strWMEncodedBy),
                         QuotedStr(strWMTrackNumber),
                         QuotedStr(strTitle),
                         QuotedStr(strArtist),
                         QuotedStr(strCopyRight),
                         QuotedStr(strComment),

                         QuotedStr('checked by delphi'),
                         QuotedStr(strSinger),
                         QuotedStr(strSongName)]);

                     updateDB(strSQL);
                  end;
               end;
            except
               On E: Exception do
               begin
                  MemoDir.Lines.Add(strFileName + ' Exception! err=' + E.Message);
               end;
            end;
         finally
            FreeAndNil(wma);
         end;
      end;  //for
   end;
end;




//==============================================================================
//◆◇-函数名称: updateDB
//◆◇-函数作用: 更新表T_1tingTask的记录
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
procedure TForm1.updateDB(strSQL: string);
begin
   if (not Assigned(FAdoQuery)) then
   begin
      CoInitialize(nil);
      FAdoQuery := TAdoQuery.Create(nil);
      FAdoQuery.ConnectionString := Format('File Name=%s', ['byinhe.udl']);
   end;


   With FAdoQuery do
   begin
      Close;
      SQL.Text := strSQL;

      try
         ExecSQL;
      except
         On E: Exception do
         begin
            MemoDir.Lines.Add(E.Message);
         end;
      end;

      Close;
   end;
end;


procedure TForm1.getSingerAndSong(strFileName: string; var singer,
  song: string);
var
   nPos: Integer;
begin
   singer := '';
   song := '';

   if (FileExists(strFileName)) then
   begin
      song := ExtractFileName(strFileName);
      nPos := Pos('.', song);
      if (nPos > 0) then
         song := Copy(song, 0, nPos - 1);

      singer := ExtractFilePath(strFileName);
      Delete(singer, Length(singer), 1);
      singer := ExtractFileName(singer);;
   end;
end;



//将所有的title修改成文件名,所有artist修改成文件夹(文件夹就是歌手名字,文件就是歌曲名字)
procedure TForm1.Button9Click(Sender: TObject);
var
   i: Integer;
   strFileName, strSongName, strSinger: string;
   wma: TWma;
   strDirDest, strFileDest, strDirTemp: string;
begin
   strDirDest := Trim(edtDest.Text);
   if (not DirectoryExists(strDirDest)) then
   begin
      ForceDirectories(strDirDest);
   end;

   if (not DirectoryExists(strDirDest)) then
   begin
      Application.MessageBox(PChar('文件夹' + strDirDest + '不存在也无法建立'),
         PChar('警告'), MB_OK);
      Exit;
   end;

   if (Assigned(FFileList)) then
   begin
      for i := 0 to FFileList.Count - 1 do
      begin
         strFileName := FFileList.Strings[i];
         getSingerAndSong(strFileName, strSinger, strSongName);

         wma := TWma.Create;

         try
            wma.loadFromFile(strFileName);
         
            if (Assigned(wma)) then
            begin
               if (wma.isWmaFile()) then
               begin
                  wma.setTitle(strSongName);
                  wma.setArtist(strSinger);
                  wma.setCopyRight('杭州网间');
                  wma.setComment('www.5GPOP.com');

                  //获取文件名
                  strFileDest := IncludeTrailingBackSlash(strDirDest) +
                     strSinger + '\' + strSongName + '.wma';
                  strDirTemp := ExtractFilePath(strFileDest);
                  ForceDirectories(strDirTemp);

                  wma.saveToFile(strFileDest);
               end;
            end;
         except
            On E: Exception do
            begin
               MemoDir.Lines.Add(strFileName + ' Exception! err=' + E.Message);
            end;
         end;

         wma.Free;
      end;  //for
   end;
end;


procedure TForm1.Button10Click(Sender: TObject);
var
   i: Integer;
   strFileName, strSongName, strSinger: string;
   wma: TWma;
   strDirDest, strFileDest, strDirTemp: string;
begin
   strDirDest := Trim(edtDest.Text);
   if (not DirectoryExists(strDirDest)) then
   begin
      ForceDirectories(strDirDest);
   end;

   if (not DirectoryExists(strDirDest)) then
   begin
      Application.MessageBox(PChar('文件夹' + strDirDest + '不存在也无法建立'),
         PChar('警告'), MB_OK);
      Exit;
   end;

   if (Assigned(FFileList)) then
   begin
      for i := 0 to FFileList.Count - 1 do
      begin
         strFileName := FFileList.Strings[i];
         getSingerAndSong(strFileName, strSinger, strSongName);

         wma := TWma.Create;

         try
            wma.loadFromFile(strFileName);
         
            if (Assigned(wma)) then
            begin
               if (wma.isWmaFile()) then
               begin
                  wma.setTitle(strSongName);
                  wma.setArtist(strSinger);
                  wma.setCopyRight('www.5gpop.com');
                  wma.setComment('www.5gpop.com');

                  //修改扩展tag
                  wma.modifyExtendTag('www.5gpop.com');

                  //获取文件名
                  strFileDest := IncludeTrailingBackSlash(strDirDest) +
                     strSinger + '\' + strSongName + '.wma';
                  strDirTemp := ExtractFilePath(strFileDest);
                  ForceDirectories(strDirTemp);

                  wma.saveToFile(strFileDest);
               end;
            end;
         except
            On E: Exception do
            begin
               MemoDir.Lines.Add(strFileName + ' Exception! err=' + E.Message);
            end;
         end;

         wma.Free;
      end;  //for
   end;
end;

end.

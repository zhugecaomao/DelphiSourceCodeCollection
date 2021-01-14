//==============================================================================
//◆-公司名称: IN-NET Cor.
//◆-单元名称: ClsWmaOpter.pas
//◆-单元作用: wma文件的操作类.包括读取,写入等
//◆-作者姓名: Viking.Liu
//◆-注意事项:
//==============================================================================
unit ClsWmaOpter;

interface
Uses
   Classes, SysUtils;


Const
   //wma文件头:  30 26 B2 75 8E 66 CF 11 A6 D9 00 AA 00 62 CE 6C
   WAM_LBL_BUF: Array[0..15] of char = (
      Chr($30), Chr($26), Chr($B2), Chr($75), Chr($8E), Chr($66), Chr($CF),
      Chr($11), Chr($A6), Chr($D9), Chr($00), Chr($AA), Chr($00), Chr($62),
      Chr($CE), Chr($6C));
      
   //标准tag标志:33 26 B2 75 8E 66 CF 11 A6 D9 00 AA 00 62 CE 6C
   NORMALTAG_LBL_BUF: Array[0..15] of char = (
      Chr($33), Chr($26), Chr($B2), Chr($75), Chr($8E), Chr($66), Chr($CF),
      Chr($11), Chr($A6), Chr($D9), Chr($00), Chr($AA), Chr($00), Chr($62),
      Chr($CE), Chr($6C));

   //扩展tag标志:40 A4 D0 D2 07 E3 D2 11 97 F0 00 A0 C9 5E A8 50
   EXTENDTAG_LBL_BUF: Array[0..15] of char = (
      Chr($40), Chr($A4), Chr($D0), Chr($D2), Chr($07), Chr($E3), Chr($D2),
      Chr($11), Chr($97), Chr($F0), Chr($00), Chr($A0), Chr($C9), Chr($5E),
      Chr($A8), Chr($50));

   //系统tag标志:A1 DC AB 8C 47 A9 CF 11 8E E4 00 C0 0C 20 53 65
   SYSTEM_LBL_BUF: Array[0..15] of char = (
      Chr($A1), Chr($DC), Chr($AB), Chr($8C), Chr($47), Chr($A9), Chr($CF),
      Chr($11), Chr($8E), Chr($E4), Chr($00), Chr($C0), Chr($0C), Chr($20),
      Chr($53), Chr($65));



type
   TFrameBase = class;
   TNormalTagFrame = class;
   TContainer = class;
   TExtendTagSection = class;
   TExtendTagFrame = class;
   TSystemTagFrame = class;
   

   //解析wma文件的主类
   TWma = class(TObject)
   private
      FRootList: TContainer;

      function getNormalTag(): TNormalTagFrame;
      function getExtendTag(): TExtendTagFrame;
      function getSystemTag(): TSystemTagFrame;
   public
      constructor Create();
      destructor Destroy(); override;

      procedure loadFromStream(const fstream: TFileStream);
      procedure loadFromFile(const strFileName: string);
      procedure saveToFile(const strFileName: string);

      procedure setTitle(strTitle: string);
      procedure setArtist(strArtist: string);
      procedure setCopyRight(strCopyRight: string);
      procedure setComment(strComment: string);

      procedure clearExtendTag();
      procedure modifyExtendTag(strInfo: string);
      function  isWmaFile(): Boolean;
   published
      property NormalTag: TNormalTagFrame read getNormalTag;
      property ExtendTag: TExtendTagFrame read getExtendTag;
      property SystemTag: TSystemTagFrame read getSystemTag;

      property RootList: TContainer read FRootList;
   end;


   //容器类
   TContainer = class(TObject)
   private
      FIsWmaFile: Boolean;
      FFileHead: Array[0..15] of Char;
      FHeadSize: Int64;
      FHeadComment: Array[0..5] of Char;

      FList: TList;
   public
      constructor Create();
      destructor Destroy(); override;

      procedure parseFileStream(fstream: TFileStream);
      function  saveToStream(mmStream: TMemoryStream): Integer;

      function getNormalTag(): TNormalTagFrame;
      function getExtendTag(): TExtendTagFrame;
      function getSystemTag(): TSystemTagFrame;

      procedure setTitle(strTitle: string);
      procedure setArtist(strArtist: string);
      procedure setCopyRight(strCopyRight: string);
      procedure setComment(strComment: string);

      procedure clearExtendTag();
      procedure ModifyExtendTag(strInfo: string);

   published
      property isWmaFile: Boolean read FIsWmaFile;
   end;


   //wma解析的基类
   TFrameBase = class(TObject)
   private
      FFrameHead: Array[0..15] of Char;
      FFrameSize: Int64;
      FFrameCount: Word;
      FDataBuf: Array of Char;   //保存内容

      FType: Integer;   //0:标准tag 1:扩展tag 2:系统tag 3:其他tag
   public
      constructor Create();
      destructor Destroy(); override;

      procedure parseData(fstream: TFileStream); virtual; abstract;
      function  saveToStream(mmStream: TMemoryStream): Integer; virtual; abstract;

      property FrameType: Integer read FType write FType;
      property FrameSize: Int64 read FFrameSize write FFrameSize;
   end;


   //标准tag帧的类
   TNormalTagFrame = class(TFrameBase)
   private
      FTitleSize: Word;                //title的尺寸
      FArtistSize: Word;               //artist的尺寸
      FCopyRightSize: Word;            //copyright的尺寸
      FCommentSize: Word;              //comment的尺寸
      FDescbSize: Word;                //descb的尺寸

      FTitle: string;                  //title的信息
      FArtist: string;                 //artist的信息
      FCopyRight: string;              //copyright的信息
      FComment: string;                //comment的信息
      FDescb: string;                  //descb的信息
   public
      constructor Create();
      destructor Destroy(); override;

      procedure parseData(fstream: TFileStream); override;
      function  saveToStream(mmStream: TMemoryStream): Integer; override;
   published
      property TitleSize: Word read FTitleSize write FTitleSize;
      property ArtistSize: Word read FArtistSize write FArtistSize;
      property CopyRightSize: Word read FCopyRightSize write FCopyRightSize;
      property CommentSize: Word read FCommentSize write FCommentSize;
      property DescbSize: Word read FDescbSize write FDescbSize;

      property Title: string read FTitle write FTitle;
      property Artist: string read FArtist write FArtist;
      property CopyRight: string read FCopyRight write FCopyRight;
      property Comment: string read FComment write FComment;
      property Descb: string read FDescb write FDescb;
   end;


   //扩展tag帧的类
   TExtendTagFrame = class(TFrameBase)
   private
      FList: TList;  //保存section的容器
   public
      constructor Create();
      destructor Destroy(); override;

      procedure parseData(fstream: TFileStream); override;
      function  saveToStream(mmStream: TMemoryStream): Integer; override;

      function getWMFSDKVersion: string;
      function getWMFSDKNeeded: string;
      function getIsVBR: string;
      function getWMAlbumTitle: string;
      function getWMAlbumArtist: string;
      function getWMYear: string;
      function getWMPromotionURL: string;
      function getWMGenreID: string;
      function getWMGenre: string;
      function getWMComposer: string;
      function getWMOriginalArtist: string;
      function getWMURL: string;
      function getWMUserWebURL: string;
      function getWMEncodedBy: string;
      function getWMCodedBy: string;
      function getWMTrackNumber: string;
      function getWMTrack: string;
      function getID: string;
      function getID3: string;
      function getWMLyrics: string;
      function getWMPicture: string;
   published
      property SectionList: TList read FList;

      property WMFSDKVersion: string read getWMFSDKVersion;
      property WMFSDKNeeded: string read getWMFSDKNeeded;
      property IsVBR: string read getIsVBR;
      property WMAlbumTitle: string read getWMAlbumTitle;
      property WMAlbumArtist: string read getWMAlbumArtist;
      property WMYear: string read getWMYear;
      property WMPromotionURL: string read getWMPromotionURL;
      property WMGenreID: string read getWMGenreID;
      property WMGenre: string read getWMGenre;
      property WMComposer: string read getWMComposer;
      property WMOriginalArtist: string read getWMOriginalArtist;
      property WMURL: string read getWMURL;
      property WMUserWebURL: string read getWMUserWebURL;
      property WMEncodedBy: string read getWMEncodedBy;
      property WMCodedBy: string read getWMCodedBy;
      property WMTrackNumber: string read getWMTrackNumber;
      property WMTrack: string read getWMTrack;
      property ID: string read getID;
      property ID3: string read getID3;
      property WMLyrics: string read getWMLyrics;
      property WMPicture: string read getWMPicture;
   end;


   //wma文件系统信息类
   TSystemTagFrame = class(TFrameBase)
   private
      FOtherBuf: Array[0..15] of Char;
      FFileSize: Int64;                //wma文件的尺寸
      FData: Array of Char;
   public
      constructor Create();
      destructor Destroy(); override;

      procedure parseData(fstream: TFileStream); override;
      function  saveToStream(mmStream: TMemoryStream): Integer; override;
   published
      property FileSize: Int64 read FFileSize write FFileSize;
   end;


   //其他tag信息类
   TOtherFrame = class(TFrameBase)
   private
   public
      constructor Create();
      destructor Destroy(); override;

      procedure parseData(fstream: TFileStream); override;
      function  saveToStream(mmStream: TMemoryStream): Integer; override;
   end;


   //扩展tag的单元(section)类
   TExtendTagSection = class(TObject)
   private
      FSNameSize: Word;                //单元名字的尺寸
      FValueSize: Word;                //单元值的尺寸
      FSectionName: string;            //单元名字的值
      FFlag: Word;                     //单元的flag
      FSectionValue: string;           //单元的值

      
   public
      constructor Create(fstream: TFileStream);
      function  saveToStream(mstream: TMemoryStream): Integer;

      property SNameSize: Word Read FSNameSize Write FSNameSize;
      property Flag: Word Read FFlag Write FFlag;
      property ValueSize: Word Read FValueSize Write FValueSize;
      property SectionName: string Read FSectionName Write FSectionName;
      property SectionValue: string Read FSectionValue Write FSectionValue;
   end;

implementation



{ TWma }

//==============================================================================
//◆◇-函数名称: TWma类的构造和析构
//◆◇-函数作用:
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
constructor TWma.Create;
begin
   FRootList := TContainer.Create;
end;

destructor TWma.Destroy;
begin
   FreeAndNil(FRootList);

   inherited;
end;

//从容器中取出保存的扩展tag帧对象
function TWma.getExtendTag: TExtendTagFrame;
begin
   Result := nil;
   if (Assigned(FRootList)) then
   begin
      Result := FRootList.getExtendTag();
   end;
end;


//从容器中取出保存的标准tag帧对象
function TWma.getNormalTag: TNormalTagFrame;
begin
   Result := nil;
   if (Assigned(FRootList)) then
   begin
      Result := FRootList.getNormalTag();
   end;
end;


//从容器中取出保存的系统tag帧对象
function TWma.getSystemTag: TSystemTagFrame;
begin
   Result := nil;
   if (Assigned(FRootList)) then
   begin
      Result := FRootList.getSystemTag();
   end;
end;


//从文件中读取记录
procedure TWma.loadFromFile(const strFileName: string);
var
   fstream: TFileStream;
begin
   if (FileExists(strFileName)) then
   begin
      fstream := TFileStream.Create(strFileName, fmOpenReadWrite +
         fmShareDenyNone);

      if (Assigned(fstream)) then
      begin
         loadFromStream(fstream);
      end;

      FreeAndNil(fstream);
   end;
end;


//从文件流中读取记录并分解
procedure TWma.loadFromStream(const fstream: TFileStream);
begin
   if (Assigned(FRootList) and Assigned(fstream)) then
   begin
      FRootList.parseFileStream(fstream);
   end;
end;

//将当前数据保存到文件
procedure TWma.saveToFile(const strFileName: string);
var
   mmstream: TMemoryStream;
   nRet: Integer;
begin
   if (Assigned(FRootList)) then
   begin
      mmstream := TMemoryStream.Create;
      nRet := FRootList.saveToStream(mmstream);

      if (nRet > 0) then
      begin
         mmstream.SaveToFile(strFileName);
      end;

      FreeAndNil(mmstream);
   end;
end;


//设置title
procedure TWma.setTitle(strTitle: string);
begin
   if (Assigned(FRootList)) then
      FRootList.setTitle(strTitle);
end;


procedure TWma.setArtist(strArtist: string);
begin
   if (Assigned(FRootList)) then
      FRootList.setArtist(strArtist);
end;

procedure TWma.setCopyRight(strCopyRight: string);
begin
   if (Assigned(FRootList)) then
      FRootList.setCopyRight(strCopyRight);
end;

procedure TWma.setComment(strComment: string);
begin
   if (Assigned(FRootList)) then
      FRootList.setComment(strComment);
end;

procedure TWma.clearExtendTag;
begin
   if (Assigned(FRootList)) then
      FRootList.clearExtendTag();
end;


procedure TWma.modifyExtendTag(strInfo: string);
begin
   if (Assigned(FRootList)) then
      FRootList.ModifyExtendTag(strInfo);
end;



function TWma.isWmaFile: Boolean;
begin
   Result := true;
   if (Assigned(FRootList)) then
   begin
      Result := FRootList.isWmaFile;
   end;
end;




{ TContainer }

//==============================================================================
//◆◇-函数名称: TContainer.Create
//◆◇-函数作用: 容器类的构造和析构等
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
constructor TContainer.Create;
begin
   FIsWmaFile := true;
   FillChar(FFileHead, SizeOf(FFileHead), 0);
   FHeadSize := 0;
   FillChar(FHeadComment, SizeOf(FHeadComment), 0);

   FList := TList.Create;
end;

destructor TContainer.Destroy;
var
   i: Integer;
   obj: TFrameBase;
begin
   if (Assigned(FList)) then
   begin
      //释放容器中的对象
      for i := 0 to FList.Count - 1 do
      begin
         obj := TFrameBase(FList.Items[i]);
         obj.Free;
      end;

      FreeAndNil(FList);
   end;

   inherited;
end;



procedure TContainer.parseFileStream(fstream: TFileStream);
var
   chrBuf: Array[0..15] of Char;
   obj: TFrameBase;
begin
   if (not Assigned(fstream)) then
      Exit;
   fstream.Position := 0;

   //读取文件头部
   fstream.Read(FFileHead, 16);
   if (CompareMem(@FFileHead, @WAM_LBL_BUF, SizeOf(WAM_LBL_BUF))) then
   begin
      //读取文件头size
      fstream.Read(FHeadSize, 8);
      
      //读取文件头后面的6字节东西
      fstream.Read(FHeadComment, 6);

      //循环读取各帧
      while (fstream.Position < fstream.Size) do
      begin
         fstream.Read(chrBuf, 16);
         fstream.Position := fstream.Position - 16;

         if (CompareMem(@chrBuf, @NORMALTAG_LBL_BUF, SizeOf(NORMALTAG_LBL_BUF))) then
         begin
            obj := TNormalTagFrame.Create();
            obj.parseData(fstream);
            FList.Add(obj);
         end
         else if (CompareMem(@chrBuf, @EXTENDTAG_LBL_BUF, SizeOf(EXTENDTAG_LBL_BUF))) then
         begin
            obj := TExtendTagFrame.Create();
            obj.parseData(fstream);
            FList.Add(obj);
         end
         else if (CompareMem(@chrBuf, @SYSTEM_LBL_BUF, SizeOf(SYSTEM_LBL_BUF))) then
         begin
            obj := TSystemTagFrame.Create();
            obj.parseData(fstream);
            FList.Add(obj);
         end 
         else
         begin
            obj := TOtherFrame.Create();
            obj.parseData(fstream);

            FList.Add(obj);
         end;
      end;
   end
   else
   begin
      FIsWmaFile := false;
   end;
end;


//将容器内的所有帧转存到内存流中
function TContainer.saveToStream(mmStream: TMemoryStream): Integer;
var
   mstream: TMemoryStream;
   obj: TFrameBase;
   i, nRet: Integer;
   chrBuf: Array of Char;
begin
   Result := 0;

   if (Assigned(FList) and Assigned(mmStream)) then
      try
         mmStream.Position := 0;

         //写入文件头
         mmStream.Write(FFileHead, 16);
         //写入头的size
         mmStream.Write(FHeadSize, 8);
         //写入意义不清楚的6个字节.
         mmStream.Write(FHeadComment, 6);

         //从列表中读取各个保存的帧
         for i := 0 to FList.Count - 1 do
         begin
            obj := TFrameBase(FList.Items[i]);
            if (Assigned(obj)) then
            begin
               mstream := TMemoryStream.Create;
               nRet := obj.saveToStream(mStream);
               if (nRet > 0) then
               begin
                  //将帧信息读取到数组
                  mstream.Position := 0;
                  SetLength(chrBuf, mstream.Size);
                  mstream.Read(chrBuf[0], mstream.Size);

                  //将数组的信息保存到流
                  mmStream.Write(chrBuf[0], mstream.Size);
               end;
            
               FreeAndNil(mstream);
            end;
         end;

         Result := mmStream.Size;
      except
      end;
end;


//获取标准tag信息
function TContainer.getNormalTag: TNormalTagFrame;
var
   i: Integer;
   obj: TFrameBase;
begin
   Result := nil;

   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         obj := TFrameBase(FList.Items[i]);
         if (Assigned(obj)) then
         begin
            if (obj.FrameType = 0) then
            begin
               Result := TNormalTagFrame(obj);
               Break;
            end;
         end;
      end;
   end;
end;


//获取扩展tag的信息
function TContainer.getExtendTag: TExtendTagFrame;
var
   i: Integer;
   obj: TFrameBase;
begin
   Result := nil;

   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         obj := TFrameBase(FList.Items[i]);
         if (Assigned(obj)) then
         begin
            if (obj.FrameType = 1) then
            begin
               Result := TExtendTagFrame(obj);
               Break;
            end;
         end;
      end;
   end;
end;

//获取系统tag的信息
function TContainer.getSystemTag: TSystemTagFrame;
var
   i: Integer;
   obj: TFrameBase;
begin
   Result := nil;

   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         obj := TFrameBase(FList.Items[i]);
         if (Assigned(obj)) then
         begin
            if (obj.FrameType = 2) then
            begin
               Result := TSystemTagFrame(obj);
               Break;
            end;
         end;
      end;
   end;
end;


//设置title
procedure TContainer.setTitle(strTitle: string);
var
   ntag: TNormalTagFrame;
   nLen, nLenMore: Integer;
   stag: TSystemTagFrame;
begin
   ntag := getNormalTag();
   nLen := Length(WideString(strTitle)) * 2;

   if (Assigned(ntag)) then
   begin
      if (ntag.TitleSize >= nLen) then
         nTag.Title := strTitle
      else
      begin
         nLenMore := nLen - ntag.TitleSize + 2;

         //设置文件头size
         FHeadSize := FHeadSize + nLenMore;

         //设置文件总长size
         stag := getSystemTag();
         if (Assigned(stag)) then
         begin
            stag.FileSize := stag.FileSize + nLenMore;
         end;

         //设置本地size
         nTag.FrameSize := nTag.FrameSize + nLenMore;
         nTag.TitleSize := nTag.TitleSize + nLenMore;
         nTag.Title := strTitle;
      end;
   end;
end;


//设置
procedure TContainer.setArtist(strArtist: string);
var
   ntag: TNormalTagFrame;
   nLen, nLenMore: Integer;
   stag: TSystemTagFrame;
begin
   ntag := getNormalTag();
   nLen := Length(WideString(strArtist)) * 2;

   if (Assigned(ntag)) then
   begin
      if (ntag.ArtistSize >= nLen) then
         nTag.Artist := strArtist
      else
      begin
         nLenMore := nLen - ntag.ArtistSize + 2;

         //设置文件头size
         FHeadSize := FHeadSize + nLenMore;

         //设置文件总长size
         stag := getSystemTag();
         if (Assigned(stag)) then
         begin
            stag.FileSize := stag.FileSize + nLenMore;
         end;

         //设置本地size
         nTag.FrameSize := nTag.FrameSize + nLenMore;
         nTag.ArtistSize := nTag.ArtistSize + nLenMore;
         nTag.Artist := strArtist;
      end;
   end;
end;


procedure TContainer.setCopyRight(strCopyRight: string);
var
   ntag: TNormalTagFrame;
   nLen, nLenMore: Integer;
   stag: TSystemTagFrame;
begin
   ntag := getNormalTag();
   nLen := Length(WideString(strCopyRight)) * 2;

   if (Assigned(ntag)) then
   begin
      if (ntag.CopyRightSize >= nLen) then
         nTag.CopyRight := strCopyRight
      else
      begin
         nLenMore := nLen - ntag.CopyRightSize + 2;

         //设置文件头size
         FHeadSize := FHeadSize + nLenMore;

         //设置文件总长size
         stag := getSystemTag();
         if (Assigned(stag)) then
         begin
            stag.FileSize := stag.FileSize + nLenMore;
         end;

         //设置本地size
         nTag.FrameSize := nTag.FrameSize + nLenMore;
         nTag.CopyRightSize := nTag.CopyRightSize + nLenMore;
         nTag.CopyRight := strCopyRight;
      end;
   end;
end;


//设置comment
procedure TContainer.setComment(strComment: string);
var
   ntag: TNormalTagFrame;
   nLen, nLenMore: Integer;
   stag: TSystemTagFrame;
begin
   ntag := getNormalTag();
   nLen := Length(WideString(strComment)) * 2;

   if (Assigned(ntag)) then
   begin
      if (ntag.CommentSize >= nLen) then
         nTag.Comment := strComment
      else
      begin
         nLenMore := nLen - ntag.CommentSize;

         //设置文件头size
         FHeadSize := FHeadSize + nLenMore;

         //设置文件总长size
         stag := getSystemTag();
         if (Assigned(stag)) then
         begin
            stag.FileSize := stag.FileSize + nLenMore;
         end;

         //设置本地size
         nTag.FrameSize := nTag.FrameSize + nLenMore;
         nTag.CommentSize := nTag.CommentSize + nLenMore;
         nTag.Comment := strComment;
      end;
   end;
end;


//清除扩展tag中的信息.但是年代和流派除外
procedure TContainer.clearExtendTag();
var
   ntag: TExtendTagFrame;
   Item: TExtendTagSection;
   i: Integer;
begin
   ntag := getExtendTag();

   if (Assigned(ntag) and Assigned(ntag.FList)) then
   begin
      for i := 0 to ntag.FList.Count - 1 do
      begin
         Item := TExtendTagSection(ntag.FList.Items[i]);
         if (Item.SectionName <> 'WMFSDKVersion') and
            (Item.SectionName <> 'WMFSDKNeeded') and
            (Item.SectionName <> 'WM/Year') and
            (Item.SectionName <> 'WM/GenreID') and
            (Item.SectionName <> 'WM/Genre') and
            (Item.SectionName <> 'WM/TrackNumber') and
            (Item.SectionName <> 'WM/Track') and
            (Item.SectionName <> 'WMFSDKVersion') then
         begin
            Item.SectionValue := '';
         end;
      end;
   end;
end;


procedure TContainer.ModifyExtendTag(strInfo: string);
var
   etag: TExtendTagFrame;
   stag: TSystemTagFrame;
   Item: TExtendTagSection;
   i, nLen, nLenMore: Integer;
begin
   nLen := Length(WideString(strInfo)) * 2;
   etag := getExtendTag();

   if (Assigned(etag) and Assigned(etag.FList)) then
   begin
      for i := 0 to etag.FList.Count - 1 do
      begin
         Item := TExtendTagSection(etag.FList.Items[i]);
         if (Item.SectionName <> 'WM/Year') and
            (Item.SectionName <> 'WM/GenreID') and
            (Item.SectionName <> 'WM/Genre') and
            (Item.SectionName <> 'WM/TrackNumber') and
            (Item.SectionName <> 'WM/Track') and
            (Item.SectionName <> 'WM/Lyrics') then
         begin
            if (Item.Flag = 0) then
            begin
               if (Item.ValueSize >= nLen) then
                  Item.SectionValue := strInfo
               else
               begin
                  nLenMore := nLen - Item.ValueSize + 2;

                  //设置文件头size
                  FHeadSize := FHeadSize + nLenMore;

                  //设置文件总长size
                  stag := getSystemTag();
                  if (Assigned(stag)) then
                  begin
                     stag.FileSize := stag.FileSize + nLenMore;
                  end;

                  //设置扩展tag的size增加
                  etag.FrameSize := etag.FrameSize + nLenMore;

                  //设置本地size
                  Item.ValueSize := Item.ValueSize + nLenMore;
                  Item.SectionValue := strInfo;
               end;
            end;
         end;
      end;
   end;
end;




{ TFrameBase }

constructor TFrameBase.Create();
begin
   FFrameSize := 0;
   FFrameCount := 0;

   //FFatherContainer := AOwner;
end;

destructor TFrameBase.Destroy;
begin
   //FFatherContainer := nil;

   //debug
   inherited;
end;



{ TNormalTagFrame }


//==============================================================================
//◆◇-函数名称: TNormalTagFrame
//◆◇-函数作用: 标准tag的函数
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
constructor TNormalTagFrame.Create();
begin
   FFrameCount := 0;
   FrameType := 0;

   inherited Create();
end;

destructor TNormalTagFrame.Destroy;
begin
   //FFatherContainer := nil;

   inherited Destroy;
end;



//解析标准tag的内容
procedure TNormalTagFrame.parseData(fstream: TFileStream);
var
   wstrTemp: WideString;
begin
   //读取帧头
   fstream.Read(FFrameHead, 16);

   //读取帧长
   fstream.Read(FFrameSize, 8);

   //各个字段的size
   fstream.Read(FTitleSize, 2);
   fstream.Read(FArtistSize, 2);
   fstream.Read(FCopyRightSize, 2);
   fstream.Read(FCommentSize, 2);
   fstream.Read(FDescbSize, 2);

   //读取title
   SetLength(wstrTemp, FTitleSize div 2);
   fstream.Read(wstrTemp[1], FTitleSize);
   FTitle := PWideChar(wstrTemp);

   //读取artist
   SetLength(wstrTemp, FArtistSize div 2);
   fstream.Read(wstrTemp[1], FArtistSize);
   FArtist := PWideChar(wstrTemp);

   //读取CopyRight
   SetLength(wstrTemp, FCopyRightSize div 2);
   fstream.Read(wstrTemp[1], FCopyRightSize);
   FCopyRight := PWideChar(wstrTemp);

   //读取Comment
   SetLength(wstrTemp, FCommentSize div 2);
   fstream.Read(wstrTemp[1], FCommentSize);
   FComment := PWideChar(wstrTemp);

   //读取Descb
   SetLength(wstrTemp, FDescbSize div 2);
   fstream.Read(wstrTemp[1], FDescbSize);
   FDescb := PWideChar(wstrTemp);

   inherited;
end;



//==============================================================================
//◆◇-函数名称: saveToBuf
//◆◇-函数作用: 将本帧的信息反存到buf中
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
function TNormalTagFrame.saveToStream(mmStream: TMemoryStream): Integer;
var
   chrBuf: Array of Char;
begin
   Result := 0;

   if (Assigned(mmStream)) then
      try
         mmStream.Position := 0;

         mmStream.Write(FFrameHead, 16);
         mmStream.Write(FFrameSize, 8);
         mmStream.Write(FTitleSize, 2);
         mmStream.Write(FArtistSize, 2);
         mmStream.Write(FCopyRightSize, 2);
         mmStream.Write(FCommentSize, 2);
         mmStream.Write(FDescbSize, 2);

         //debug
         SetLength(chrBuf, FTitleSize + FArtistSize + FCopyRightSize + FCommentSize + FDescbSize);
         FillChar(chrBuf[0], FTitleSize + FArtistSize + FCopyRightSize + FCommentSize + FDescbSize, 0);
         mmStream.Write(chrBuf[0], FTitleSize + FArtistSize + FCopyRightSize + FCommentSize + FDescbSize);
         mmStream.Position := mmStream.Position - (FTitleSize + FArtistSize + FCopyRightSize + FCommentSize + FDescbSize);

         mmStream.Write(PWideChar(WideString(FTitle))^, FTitleSize);
         mmStream.Write(PWideChar(WideString(FArtist))^, FArtistSize);
         mmStream.Write(PWideChar(WideString(FCopyRight))^, FCopyRightSize);
         mmStream.Write(PWideChar(WideString(FComment))^, FCommentSize);
         mmStream.Write(PWideChar(WideString(FDescb))^, FDescbSize);

         Result := mmStream.Size;
      except
      end;
end;




{ TExtendTagFrame }

constructor TExtendTagFrame.Create();
begin
   FrameType := 1;
   FList := TList.Create;

   inherited Create();
end;

destructor TExtendTagFrame.Destroy;
var
   i: Integer;
   Item: TExtendTagSection;
begin
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         Item := TExtendTagSection(FList.Items[i]);
         Item.Free;
      end;
   end;
   FreeAndNil(FList);

   inherited Destroy;
end;



//==============================================================================
//◆◇-函数名称: parseData
//◆◇-函数作用: 解析扩展tag部分的数据
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
procedure TExtendTagFrame.parseData(fstream: TFileStream);
var
   i: Integer;
   sect: TExtendTagSection;
begin
   if (not Assigned(FList)) then
      FList := TList.Create;

   //读取帧头
   fstream.Read(FFrameHead, 16);

   //读取帧长
   fstream.Read(FFrameSize, 8);

   //读取单元(section)个数
   fstream.Read(FFrameCount, 2);

   //循环读取单元
   for i := 0 to FFrameCount - 1 do
   begin
      sect := TExtendTagSection.Create(fstream);
      if (Assigned(sect)) then
         FList.Add(sect);
   end;

   inherited;
end;



//将扩展部分的数据合成为一个内存流
function TExtendTagFrame.saveToStream(mmStream: TMemoryStream): Integer;
var
   sectObj: TExtendTagSection;
   sectStream: TMemoryStream;
   i, nRet: Integer;
   chrBuf: Array of Char;
begin
   Result := 0;
   
   if (Assigned(mmStream)) then
   begin
      mmStream.Position := 0;

      //写入头
      mmStream.Write(FFrameHead, 16);
      //写入帧size
      mmStream.Write(FFrameSize, 8);
      //写入单元个数
      mmStream.Write(FFrameCount, 2);

      //循环写入各单元
      for i := 0 to FList.Count - 1 do
      begin
         sectObj := TExtendTagSection(FList.Items[i]);
         if (Assigned(sectObj)) then
         begin
            //建立临时单元内存流
            sectStream := TMemoryStream.Create;
            nRet := sectObj.saveToStream(sectStream);

            if (nRet > 0) then
            begin
               //从临时单元内存流中读取信息
               sectStream.Position := 0;
               SetLength(chrBuf, sectStream.Size);
               sectStream.Read(chrBuf[0], sectStream.Size);

               //写入本地流
               mmStream.Write(chrBuf[0], sectStream.Size);
            end;

            //释放临时单元内存流
            FreeAndNil(sectStream);
         end;
      end;

      Result := mmStream.Size;
   end;
end;




function TExtendTagFrame.getWMFSDKVersion: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WMFSDKVersion') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMFSDKNeeded: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WMFSDKNeeded') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getIsVBR: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'IsVBR') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMAlbumTitle: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/AlbumTitle') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMAlbumArtist: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/AlbumArtist') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMYear: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/Year') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;

function TExtendTagFrame.getWMPromotionURL: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/PromotionURL') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;

function TExtendTagFrame.getWMGenreID: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/GenreID') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMGenre: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/Genre') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMComposer: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/Composer') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMOriginalArtist: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/OriginalArtist') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;

function TExtendTagFrame.getWMURL: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/URL') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMUserWebURL: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/UserWebURL') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMEncodedBy: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/EncodedBy') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMCodedBy: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/CodedBy') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;

function TExtendTagFrame.getWMTrackNumber: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/TrackNumber') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;

function TExtendTagFrame.getWMTrack: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/Track') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getID: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'ID') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;

function TExtendTagFrame.getID3: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'ID3') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;

function TExtendTagFrame.getWMLyrics: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/Lyrics') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;


function TExtendTagFrame.getWMPicture: string;
var
   i: Integer;
   sect: TExtendTagSection;
begin
   Result := '';
   
   if (Assigned(FList)) then
   begin
      for i := 0 to FList.Count - 1 do
      begin
         sect := TExtendTagSection(FList.Items[i]);

         if (Assigned(sect)) then
         begin
            if (sect.SectionName = 'WM/Picture') then
            begin
               Result := sect.SectionValue;
               Break;
            end;
         end;
      end;
   end;
end;



{ TSystemTagFrame }

constructor TSystemTagFrame.Create();
begin
   FrameType := 2;
   //inherited Create(AOwner);
end;

destructor TSystemTagFrame.Destroy;
begin

   inherited Destroy;
end;



//==============================================================================
//◆◇-函数名称: parseData
//◆◇-函数作用: 解析系统帧
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
procedure TSystemTagFrame.parseData;
var
   nLen: Integer;
begin
   //读取帧头
   FillChar(FFrameHead, SizeOf(FFrameHead), 0);
   fstream.Read(FFrameHead, 16);

   //读取帧长
   fstream.Read(FFrameSize, 8);

   //读取filesize的head
   FillChar(FOtherBuf, SizeOf(FOtherBuf), 0);
   fstream.Read(FOtherBuf, 16);

   //读取整个文件的size
   fstream.Read(FFileSize, 8);

   //读取其他数据
   nLen := FFrameSize - 16 - 8 - 16 - 8;
   SetLength(FData, nLen);
   FillChar(FData[0], nLen, 0);
   fstream.Read(FData[0], nLen);

   inherited;
end;



//将系统tag的信息转存到内存流
function TSystemTagFrame.saveToStream(mmStream: TMemoryStream): Integer;
begin
   Result := 0;

   if (Assigned(mmStream)) then
      try
         mmStream.Position := 0;

         mmStream.Write(FFrameHead, 16);
         mmStream.Write(FFrameSize, 8);
         mmStream.Write(FOtherBuf, 16);
         mmStream.Write(FFileSize, 8);
         mmStream.Write(FData[0], FFrameSize - 16 - 8 - 16 -8);

         Result := mmStream.Size;
      except
      end;
end;




{ TOtherFrame }

constructor TOtherFrame.Create();
begin
   FrameType := 3;

   //inherited Create();
end;

destructor TOtherFrame.Destroy;
begin                  

   inherited;
end;

//解析数据
procedure TOtherFrame.parseData;
begin
   //读取帧头
   fstream.Read(FFrameHead, 16);

   //读取帧长
   fstream.Read(FFrameSize, 8);

   //读取数据
   SetLength(FDataBuf, FFrameSize - 16 - 8);
   //bug
   //FillChar(FDataBuf[0], 16, 0);
   fstream.Read(FDataBuf[0], FFrameSize - 16 - 8);

   inherited;
end;


//将信息转存到内存流中
function TOtherFrame.saveToStream(mmStream: TMemoryStream): Integer;
begin
   Result := 0;

   if (Assigned(mmStream)) then
      try
         mmStream.Position := 0;

         mmStream.Write(FFrameHead, 16);
         mmStream.Write(FFrameSize, 8);
         mmStream.Write(FDataBuf[0], FFrameSize - 16 - 8);

         Result := mmStream.Size;
      except
      end;
end;



{ TExtendTagSection }

//==============================================================================
//◆◇-函数名称: parseSection
//◆◇-函数作用:
//◆◇-参数说明:
//◆◇-注意事项:
//==============================================================================
constructor TExtendTagSection.Create(fstream: TFileStream);
var
   wstrTemp: WideString;
begin
   if (Assigned(fstream)) then
   begin
      //读取section.name的size
      fstream.Read(FSNameSize, 2);

      //读取section.name
      SetLength(wstrTemp, FSNameSize div 2);
      fstream.Read(wstrTemp[1], FSNameSize);
      FSectionName := PWideChar(wstrTemp);

      //读取flag
      fstream.Read(FFlag, 2);

      //读取section.value的size
      fstream.Read(FValueSize, 2);

      //读取section.value
      SetLength(wstrTemp, FValueSize div 2);
      fstream.Read(wstrTemp[1], FValueSize);
      FSectionValue := PWideChar(wstrTemp);
   end;
end;


//将扩展tag的单元合成为内存流
function TExtendTagSection.saveToStream(mstream: TMemoryStream): Integer;
begin
   Result := 0;

   if (Assigned(mstream)) then
      try
         mstream.Position := 0;

         mstream.Write(SNameSize, 2);
         mstream.Write(PWideChar(WideString(SectionName))^, SNameSize);
         mstream.Write(Flag, 2);
         mstream.Write(ValueSize, 2);
         mstream.Write(PWideChar(WideString(SectionValue))^, ValueSize);

         Result := mstream.Size;
      except
      end;
end;






end.

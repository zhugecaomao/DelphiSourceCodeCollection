unit JpegSave2DataBaseUnit1;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, ExtCtrls, Grids, Variants, DBGrids, DBTables, StdCtrls, DBCtrls, Mask;

type
   TForm1 = class(TForm)
      Table1: TTable;
      DataSource1: TDataSource;
      Table1Description: TMemoField;
      Table1Picture: TGraphicField;
      OpenDialog1: TOpenDialog;
      Panel2: TPanel;
      LoadJPEG_b: TButton;
      DBGrid1: TDBGrid;
      Panel3: TPanel;
      Image1: TImage;
      DBMemo1: TDBMemo;
      Panel4: TPanel;
      Splitter1: TSplitter;
      Table1Filename: TStringField;
      Table1Folder: TStringField;
      Edit1: TEdit;
      procedure Table1AfterScroll(DataSet: TDataSet);
      procedure LoadJPEG_bClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
   private
      procedure LoadFileToDB(const FilePath: string);
      { Private declarations }
   public
      { Public declarations }
   end;

var
   Form1: TForm1;

implementation

uses JPEG;

{$R *.DFM}

procedure TForm1.Table1AfterScroll(DataSet: TDataSet);
var
   MS: TMemoryStream;
   J1: TJPEGImage;
begin
   Screen.Cursor := crHourglass;
   try {Finall}
      Edit1.Text := Table1Folder.AsString + '\' + Table1Filename.AsString;
      if Table1Picture.IsNull then
         Image1.Picture.Assign(nil)
      else
         begin
            J1 := TJPEGImage.Create;
            MS := TMemoryStream.Create;
            try
               Table1Picture.SaveToStream(MS);
               MS.Seek(0, soFromBeginning);
               with J1 do
                  begin
                     PixelFormat := jf24Bit;
                     Scale := jsFullSize;
                     Grayscale := False;
                     Performance := jpBestQuality;
                     ProgressiveDisplay := True;
                     ProgressiveEncoding := True;
                     LoadFromStream(MS);
                  end;
               Image1.Picture.Assign(J1);
            finally
               J1.Free;
               MS.Free;
            end;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TForm1.LoadFileToDB(const FilePath: string);
//存取到数据库中
var
   FileName, Folder: string;
   MS: TMemoryStream;
   J1: TJPEGImage;
begin
   MS := TMemoryStream.Create;
   J1 := TJPEGImage.Create;
   try {Finally}
      Filename := ExtractFilename(FilePath);
      //获取文件名
      Folder := ExtractFileDir(FilePath);
      //文件路径
      if Table1.Locate('Filename;Folder', VarArrayOf([Filename, Folder]), [])
         then
         Table1.Edit
            //开始进行插入操作
      else
         begin
            Table1.Append;
            //插入到末尾
            Table1Filename.AsString := Filename;
            //插入到FileName字段
            Table1Folder.AsString := Folder;
            //插入到Folder字段
         end;
      try {Except}

         Image1.Picture.LoadFromFile(FilePath);
         J1.Assign(Image1.Picture);
         //加载jpg图片
         J1.SaveToStream(MS);
         //存取到流中
         Table1Picture.LoadFromStream(MS);
         //存取到图片字段
         Table1.Post;
         //提交
      except
         on e: Exception do
            begin
               //异常捕获
               ShowMessage
                  (e.Message + ^M + 'while trying to load ' + FilePath);
               with Table1 do
                  if not (State in [dsInactive, dsBrowse]) then
                     Cancel;
            end;
      end {Except}
   finally
      MS.Free; //释放资源
      J1.Free;
   end {Finally};
end;

procedure TForm1.LoadJPEG_bClick(Sender: TObject);
var
   i: integer;
begin
   with OpenDialog1 do
      if Execute then
         for i := 0 to Files.Count - 1 do
            begin
               LoadFileToDB
                  (Files[i]);
            end;
   //允许选择多个图片//加载全部选择的图片
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   Table1.Open;
   //打开数据库
   Table1.FieldByName('filename').DisplayLabel := '文件名';
   //显示字段的中文名字
   Table1.FieldByName('folder').DisplayLabel := '图片路径';
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
   DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   i: integer;
begin
   if gdSelected in State then
      Exit;

   //定义表头的字体和背景颜色：
   for i := 0 to (Sender as TDBGrid).Columns.Count - 1 do
      begin
         (Sender as TDBGrid).Columns[i].Title.Font.Name := '宋体';
         //字体
         (Sender as TDBGrid).Columns[i].Title.Font.Size := 9;
         //字体大小
         (Sender as TDBGrid).Columns[i].Title.Font.Color := $000000FF;
         //字体颜色(红色)
         (Sender as TDBGrid).Columns[i].Title.Color := $0000FF00;
         //背景色(绿色)
      end;

   //隔行改变网格背景色：
   if Self.table1.RecordCount mod 2 = 0 then
      (Sender as TDBGrid).Canvas.Brush.Color := clInfoBk
         //定义背景颜色
   else
      (Sender as TDBGrid).Canvas.Brush.Color := RGB(191, 255, 223);
   //定义背景颜色

//定义网格线的颜色：
   DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   with (Sender as TDBGrid).Canvas do
      //画 cell 的边框
      begin
         Pen.Color := $00FF0000;
         //定义画笔颜色(蓝色)
         MoveTo(Rect.Left, Rect.Bottom);
         //画笔定位
         LineTo(Rect.Right, Rect.Bottom);
         //画蓝色的横线
         Pen.Color := $0000FF00;
         //定义画笔颜色(绿色)
         MoveTo(Rect.Right, Rect.Top);
         //画笔定位
         LineTo(Rect.Right, Rect.Bottom);
         //画绿色的竖线
      end;
end;

end.


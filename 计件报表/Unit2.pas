unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, OleServer, Excel2000, DB,
  ADODB, Grids, DBGrids, ImgList, Mask, ExtCtrls,DateUtils, Gauges;

type
  TForm2 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    ADOQuery1: TADOQuery;
    ExcelApplication1: TExcelApplication;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button2: TButton;
    Gauge1: TGauge;
    procedure Printanjuan(tiaojiao:string);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  q1:TADOQuery;
implementation

uses Unit1;

{$R *.dfm}
procedure   TForm2.Printanjuan(tiaojiao:string);
  var
      GetCurpath:string;
      nowhangi,i,jilushu,LCID:integer;               //nowhangi当前   execl的所在行，jilushu当前的记录位置
      ssql,PathName:string;
      oldcur:tcursor;
      ExcelApplication1:TExcelApplication;
      ExcelWorkbook1:TExcelWorkbook;
      ExcelWorkSheet1:TExcelWorksheet;
      xl,Cell1:olevariant;
  begin

     //列出现在记录
      q1:=form1.Doadosql(q1,tiaojiao);

      GetCurpath:='c:\';
      LCID   :=   LOCALE_USER_DEFAULT;   
      if   FileExists(GetCurpath   +   'temp.xls')   then                       //删除动态生成的临时temp.xls文件
      try
          DeleteFile(GetCurpath   +   'temp.xls');
      except
      end;
    
      begin
          try
             
              ExcelApplication1   :=   TExcelApplication.Create(Self);
              ExcelWorkbook1   :=   TExcelWorkbook.Create(Self);
              ExcelWorkSheet1   :=   TExcelWorksheet.Create(Self);
         except
              showmessage('对不起，您没有安装Excel   2000!');
              abort;   
          end;   
      end;
      ExcelApplication1.Connect;   
      ExcelApplication1.Workbooks.Add(null,   0);   
      //如果调用一个模板   ，实现套打，改动该句如：   
      //ExcelApplication1.Workbooks.Add('c:\zichang.xls',   0);   
      ExcelWorkBook1.ConnectTo(ExcelApplication1.Workbooks[1]);   
      ExcelWorkSheet1.ConnectTo(ExcelWorkBook1.Sheets[1]   as   _WorkSheet);   
        //写入execl     
          nowhangi   :=   1;
          ExcelApplication1.Range['A1',   'A1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['B1',   'B1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['C1',   'C1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['D1',   'D1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['E1',   'E1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['F1',   'F1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['G1',   'G1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['H1',   'H1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['I1',   'I1'].ColumnWidth   :=   14;
          ExcelApplication1.Range['J1',   'J1'].ColumnWidth   :=   14;

          //设置每页的记录数目

                      //ProgressBar1   为一个进程条控件
                      ExcelApplication1.Range['A'+inttostr(nowhangi),'F'+inttostr(nowhangi)].Merge(xl);//合并execl单元格

                      ExcelWorkSheet1.cells.Item[nowhangi,   1].font.size   :=   24;
                      ExcelWorkSheet1.cells.Item[nowhangi,   1].RowHeight   :=   64;
                      ExcelWorkSheet1.cells.Item[nowhangi,   1]:='永丰五金制品厂备料生产报表';
                      ExcelWorkSheet1.cells.Item[nowhangi,   1].VerticalAlignment   :=   xlCenter;
                      ExcelWorkSheet1.cells.Item[nowhangi,   1].HorizontalAlignment   :=   xlCenter;


                      ExcelApplication1.Range['A'+inttostr(nowhangi+1),'F'+inttostr(nowhangi+1)].Merge(xl);//合并execl单元格

                      ExcelWorkSheet1.cells.Item[nowhangi+1,   1].font.size   :=   24;
                      ExcelWorkSheet1.cells.Item[nowhangi+1,   1].RowHeight   :=   64;

                      ExcelWorkSheet1.cells.Item[nowhangi+1,   1]   :=   '1111111111111111111';
                      ExcelWorkSheet1.cells.Item[nowhangi+1,   1].VerticalAlignment   :=   xlCenter;
                      ExcelWorkSheet1.cells.Item[nowhangi+1,   1].HorizontalAlignment   :=   xlCenter;




                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   1].VerticalAlignment   :=   xlCenter;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   1].font.size   :=   12;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   1].Font.Bold   :=   True;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   1].VerticalAlignment   :=   xlCenter;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   1].HorizontalAlignment   :=   xlCenter;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   1]   :=   '顺序号';



                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   2].font.size   :=   12;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   2].Font.Bold   :=   True;
                     // ExcelWorkSheet1.cells.Item[nowhangi   +   1,   2].Orientation   :=   xlVertical;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   2].VerticalAlignment   :=   xlCenter;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   2].HorizontalAlignment   :=   xlCenter;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   2]   :=   '全宗号';
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   3].font.size   :=   12;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   3].Font.Bold   :=   True;
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   3].Orientation   :=   xlVertical;   
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   3].VerticalAlignment   :=   xlTop;   
                      ExcelWorkSheet1.cells.Item[nowhangi   +   1,   3]   :=   '目录号';   
                      //加入分页符号   




      ExcelWorkbook1.SaveCopyAs(GetCurpath   +   'temp.xls');
      ExcelApplication1.DisplayAlerts[LCID]   :=   False;
     // ExcelApplication1.Quit;
     // ExcelWorksheet1.Disconnect;
     // ExcelWorkbook1.Disconnect;
     // ExcelApplication1.Disconnect;

  end;

  



procedure TForm2.Button1Click(Sender: TObject);
var
      i, row, column: integer;
      ExcelApplication1:TExcelApplication;
      ExcelWorkbook1:TExcelWorkbook;
      ExcelWorkSheet1:TExcelWorksheet;
      Temp_Worksheet: _WorkSheet;
      n,oldrow:integer;
      xl,Cell1:olevariant;

      pstr:string;
begin

if application.MessageBox('在进行导出之前，请关闭所有Excel表格！','警告',MB_OKCancel)=IDCANCEL  then
   abort;



   Try
     ExcelApplication1:=TExcelApplication.Create(Self);
     ExcelWorkbook1:=TExcelWorkbook.Create(Self);
     ExcelWorkSheet1:=TExcelWorksheet.Create(Self);
     ExcelApplication1.Connect;
   Except
     MessageDlg('请先安装Excel!',mtError, [mbOk], 0);
     Abort;
   End;


   ExcelApplication1.Visible[0]:=false;//隐藏Excel
   ExcelApplication1.Caption := '正导入数据，请稍后...';
   ExcelWorkbook1.ConnectTo(ExcelApplication1.Workbooks.Add(EmptyParam,0));//添加新工作簿

   // q1列出工人姓名
   q1:=form1.Doadosql(q1,'select name,count(name) as recount from 报表 where Date>=#'+datetostr(DateTimePicker1.Date)+'# and date<=#'+datetostr(DateTimePicker2.Date)+'# group by name');
   self.Gauge1.MaxValue:=0;
   self.Gauge1.MinValue:=0;
   while not q1.Eof do
     begin
        self.Gauge1.MaxValue:=self.Gauge1.MaxValue+q1.fieldbyname('recount').AsInteger;
        q1.Next;
     end;
   q1.First;
   self.Gauge1.MaxValue:=self.Gauge1.MaxValue*7;


while not q1.Eof do
  begin
    self.DBGrid1.Enabled:=false;
    self.ADOQuery1.Close;
    self.ADOQuery1.SQL.Clear;
    self.ADOQuery1.SQL.Add('select id,date as 日期,dayn as 日薪,name as 姓名,product as 品名,good_count as 良品数,dj as 单价,je as 金额 from 报表 where Date>=#'+datetostr(DateTimePicker1.Date)+'# and date<=#'+datetostr(DateTimePicker2.Date)+'# and name='''+q1.fieldbyname('name').AsString+''' order by date');
    self.ADOQuery1.Open;

    if self.ADOQuery1.IsEmpty then abort;

    Temp_Worksheet:=ExcelWorkbook1.WorkSheets.Add(EmptyParam,EmptyParam,EmptyParam,EmptyParam,0) as _WorkSheet;
    Temp_Worksheet.Name:=self.ADOQuery1.fieldbyname('姓名').AsString;//设置工作表名
    ExcelWorkSheet1.ConnectTo(Temp_WorkSheet);//添加工作表

    ExcelWorkSheet1.Range['A1','G1'].Merge(xl);//合并execl单元格
    ExcelWorkSheet1.cells.Item[1,1].font.size   :=   24;
    ExcelWorkSheet1.cells.Item[1,1].RowHeight   :=   64;
    ExcelWorkSheet1.cells.Item[1,1]:='永丰五金制品厂生产报表';
    ExcelWorkSheet1.cells.Item[1,1].VerticalAlignment:=xlCenter;
    ExcelWorkSheet1.cells.Item[1,1].HorizontalAlignment:=xlCenter;

    ExcelWorkSheet1.Range['A2','G2'].Merge(xl);//合并execl单元格
    ExcelWorkSheet1.cells.Item[2,1].font.size   :=   12;
    ExcelWorkSheet1.cells.Item[2,1].RowHeight   :=   15;
    
    if self.DateTimePicker1.Date<>self.DateTimePicker2.Date then
       ExcelWorkSheet1.cells.Item[2,1]:='姓名：'+self.ADOQuery1.fieldbyname('姓名').AsString+'     日期：'+datetostr(self.DateTimePicker1.Date)+' 至 '+datetostr(self.DateTimePicker2.Date)
    else
       ExcelWorkSheet1.cells.Item[2,1]:='姓名：'+self.ADOQuery1.fieldbyname('姓名').AsString+'     日期：'+datetostr(self.DateTimePicker1.Date);

    ExcelWorkSheet1.cells.Item[2,1].VerticalAlignment:=xlCenter;
    ExcelWorkSheet1.cells.Item[2,1].HorizontalAlignment:=xlright;

    ExcelWorkSheet1.Range['B3','B3'].ColumnWidth:=8;
    ExcelWorkSheet1.Range['C3','C3'].ColumnWidth:=8;
    ExcelWorkSheet1.Range['D3','D3'].ColumnWidth:=24;

    DBGrid1.DataSource.DataSet.Open;
    for i := 1 to DBGrid1.DataSource.DataSet.FieldCount-1 do
        begin
           ExcelWorksheet1.Cells.Item[3,I] := DBGrid1.DataSource.DataSet.fields[i].FieldName;
           ExcelWorkSheet1.cells.Item[3,I].Font.Name:='华文中宋';
           ExcelWorkSheet1.cells.Item[3,I].Font.Size:=16;
           ExcelWorkSheet1.cells.Item[3,I].VerticalAlignment:=xlCenter;
           ExcelWorkSheet1.cells.Item[3,I].HorizontalAlignment:=xlLeft;
        end;


    row := 4;
    oldrow:=row;
    pstr:='';
    While Not (DBGrid1.DataSource.DataSet.Eof) do
       begin
          column := 1;
          for i := 2 to DBGrid1.DataSource.DataSet.FieldCount do
             begin

                 ExcelWorksheet1.Cells.Item[row, column] := DBGrid1.DataSource.DataSet.fields[i-1].AsString;


                 if column=2 then
                     if (pstr<>'') and (pstr<>DBGrid1.DataSource.DataSet.fields[1].AsString) then
                       begin
                          ExcelWorksheet1.Cells.Item[row-1,2]:='=sum(G'+inttostr(oldrow)+':G'+inttostr(row-1)+')';
                          if   ExcelWorksheet1.Cells.Item[row,2].value=0 then ExcelWorksheet1.Cells.Item[row,2]:=''; 
                          ExcelWorkSheet1.Range['B'+inttostr(oldrow),'B'+inttostr(row-1)].Merge(xl);//合并execl单元格
                          oldrow:=row;
                       end
                     else  ExcelWorksheet1.Cells.Item[row,2]:='';


                 ExcelWorkSheet1.cells.Item[row, column].VerticalAlignment:=xlCenter;
                 ExcelWorkSheet1.cells.Item[row, column].HorizontalAlignment:=xlLeft;
                 ExcelWorkSheet1.cells.Item[row, column].Font.Name:='华文中宋';
                 ExcelWorkSheet1.cells.Item[row, column].Font.Size:=12;
                 column := column + 1;
                 self.Gauge1.Progress:=self.Gauge1.Progress+1;

             end;
          pstr:=DBGrid1.DataSource.DataSet.fields[1].AsString;
          
          DBGrid1.DataSource.DataSet.Next;
          row := row + 1;
        end;


      ExcelWorksheet1.Cells.Item[row-1,2]:='=sum(G'+inttostr(oldrow)+':G'+inttostr(row-1)+')';
      ExcelWorkSheet1.Range['B'+inttostr(oldrow),'B'+inttostr(row-1)].Merge(xl);//合并execl单元格
      
      ExcelWorksheet1.Cells.Item[row, column-2]:='合计：';
      ExcelWorkSheet1.cells.Item[row, column-2].VerticalAlignment:=xlCenter;
      ExcelWorkSheet1.cells.Item[row, column-2].HorizontalAlignment:=xlLeft;


      ExcelWorksheet1.Cells.Item[row, column-1]:='=sum(G4:G'+inttostr(row-1)+')';
      ExcelWorkSheet1.cells.Item[row, column-1].VerticalAlignment:=xlCenter;
      ExcelWorkSheet1.cells.Item[row, column-1].HorizontalAlignment:=xlLeft;

      ExcelWorkSheet1.Range['A3','G'+inttostr(row-1)].Borders[1].Weight := 2;
      ExcelWorkSheet1.Range['A3','G'+inttostr(row-1)].Borders[2].Weight := 2;
      ExcelWorkSheet1.Range['A3','G'+inttostr(row-1)].Borders[3].Weight := 2;
      ExcelWorkSheet1.Range['A3','G'+inttostr(row-1)].Borders[4].Weight := 2;

      q1.Next;
      ExcelWorkSheet1.PageSetup.PrintTitleRows:='$1:$3';
  end;

  showmessage('数据导出完毕!                  ');
  ExcelApplication1.Visible[0]:=true;//显示Excel

end;


procedure TForm2.Button2Click(Sender: TObject);
begin
                                                                                                                                                                                                                             
    self.ADOQuery1.Close;
    self.ADOQuery1.SQL.Clear;
    self.ADOQuery1.SQL.Add('select id,date as 日期,dayn as 日薪,name as 姓名,product as 品名,good_count as 良品数,dj as 单价,je as 金额 from 报表 where Date>=#'+datetostr(DateTimePicker1.Date)+'# and date<=#'+datetostr(DateTimePicker2.Date)+'#  order by date');
    self.ADOQuery1.Open;
    self.DBGrid1.Enabled:=true;

end;

function Thefirstday(D:TDatetime):Tdatetime;
var
  Year,Month,Day:word;
begin
  decodedate(D,year,month,day);
  result:=Encodedate(year,month,1);
end;


procedure TForm2.FormCreate(Sender: TObject);
begin
 self.ADOQuery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+form1.getdir+'data.mdb;Persist Security Info=False';
 self.DateTimePicker1.Date:=Thefirstday(date());
 self.DateTimePicker2.Date:=date();
end;

end.

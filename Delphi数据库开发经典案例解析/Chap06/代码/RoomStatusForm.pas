unit RoomStatusForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ImgList, ExtCtrls, DB, ADODB;

type
  TRoomStatus = class(TForm)
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    GroupBox2: TGroupBox;
    Button1: TButton;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    Image1: TImage;
    Image2: TImage;
    RadioButton2: TRadioButton;
    Image3: TImage;
    RadioButton3: TRadioButton;
    Image4: TImage;
    RadioButton4: TRadioButton;
    Image5: TImage;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOCommand1: TADOCommand;
    Image6: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    preOrder:string;//设置需要显示所有房间或仅一种类型的房间
    procedure SetIcon(index:integer;cellcol:integer;cellrow:integer);//画图标
    procedure SetText(number:integer;cellcol:integer;cellrow:integer);//显示文字
    procedure ShowStatus();//用图标显示数据库中房间状态
   end;

 var
  RoomStatus: TRoomStatus;
  roomnum:integer;//选中的房间的编号
  isChosen:bool;//判断是否选中了一个有效房间
  chosenIndex:integer;//选中的radiobutton的编号
  chosenStatus:string;//选中的radiobutton的状态



implementation

{$R *.dfm}
uses MainForm;

//------窗体显示时设置表中的房间号和楼层号--------------
procedure TRoomStatus.FormCreate(Sender: TObject);
var
  i:integer;
begin
 for i:=1 to 16 do
   begin
    if i>=13 then
      stringgrid1.Cells[i,0]:='#'+inttostr(i+2)
      else
      stringgrid1.Cells[i,0]:='#'+inttostr(i);
   end;
  for i:=1 to 4 do
   stringgrid1.Cells[0,i]:=' '+inttostr(i+2)+'楼';
  //默认情况下显示全部房间号
  preOrder:='no preorder';
end;

//---------------更新房态图----------------
procedure TRoomStatus.Button1Click(Sender: TObject);
begin
showstatus();
end;


//-------------------更改某选中房间的状态--------------------
procedure TRoomStatus.Button2Click(Sender: TObject);
var
 status:string;
begin
if isChosen=false then
 begin
  showmessage('未选择房间');
  exit;
 end;
//更新数据库中的数据
adocommand1.CommandText:='update 客房信息 set 状态='''+chosenStatus+''' where 客房编号=''0'+inttostr(roomnum)+'''';
adocommand1.Execute;
showstatus();
end;



//----在一个stringgrid单元格中画图标-----
procedure TRoomStatus.SetIcon(index, cellcol, cellrow: integer);
var
  bitmap:Tbitmap;
  rt:Trect;
begin
 //输入的参数为imagelist中的图，单元格的列号和行号
 rt:=stringgrid1.CellRect(cellcol,cellrow);
 bitmap:=TBitmap.Create;
 imagelist1.GetBitmap(index,bitmap);
 stringgrid1.Canvas.Draw(rt.Left,rt.Top,bitmap);
 bitmap.Free;
end;

//----在某个stringgrid单元格中显示它的房间编号-----
procedure TRoomStatus.SetText(number, cellcol, cellrow: integer);
var
  rt:Trect;
begin
 //输入的参数为房间编号，单元格的列号和行号
 rt:=stringgrid1.CellRect(cellcol,cellrow);
 stringgrid1.Canvas.Brush.Style:=bsClear;
 stringgrid1.Canvas.TextOut(rt.Left+5,rt.Top+20,inttostr(number));
end;

//---------------根据数据库中的房间状态，在每个单元格中显示房间状态--------------
procedure TRoomStatus.ShowStatus;
var
  i,floor,room,num,index:integer;
  status:string;
begin
  //查询客房状态
  adoquery1.Close;
  adoquery1.SQL.Clear;

  //判断是房态管理状态还是选择房间状态
  if (button2.Enabled=true)or(preOrder='no preorder') then//未预选类型，则显示全部房间
  adoquery1.SQL.Add('select 客房编号,状态 from 客房信息 order by 客房编号');
  if button2.Enabled=false then
  adoquery1.SQL.Add('select 客房编号,状态 from 客房信息 where 类型编号='''+preOrder+''' order by 客房编号');
  adoquery1.Open;

  //将各个房间的状态显示在stringgrid中
  while not adoquery1.Eof do
   begin
    num:=adoquery1.FieldByName('客房编号').AsInteger;
    status:=adoquery1.FieldByName('状态').AsString;
    floor:=round(num/100);//求楼层
    room:=num mod (100*floor);//求房间号
    if room>=13 then room:=room-2;
    if status='空房' then index:=0;
    if status='住房' then index:=1;
    if status='自用' then index:=2;
    if status='维修' then index:=3;
    if status='将到' then index:=4;
    if status='将离' then index:=5;
    SetIcon(index,room,floor-2);
    SetText(num,room,floor-2);
    adoquery1.Next;
   end;
end;

//---------------在StringGrid重画时保持房间状态的更新--------------------------
procedure TRoomStatus.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  showstatus();
end;

//---------------关闭窗体--------------
procedure TRoomStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;
//------------------选中一个单元格，并查询其状态-----------------------
procedure TRoomStatus.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  status:string;
begin
  if (ARow>0)and(ACol>0) then
    begin
    if ACol>=13 then//由于房间号没有13和14，因此这里需要转换一下编号
      roomnum:=100*(2+ARow)+ACol+2
      else
      roomnum:=100*(2+ARow)+ACol;

     adoquery1.Close;
     adoquery1.SQL.Clear;
     adoquery1.SQL.Add('select 状态 from 客房信息 where 客房编号=''0'+inttostr(roomnum)+'''');
     adoquery1.Open;
     status:=trim(adoquery1.fieldbyname('状态').AsString);
     //判断所选择的单元格是否为空格
     if status<>'' then
      isChosen:=true
      else
      isChosen:=false;
     //根据房间的装体来设置单选按钮
     if status='空房' then radiobutton1.Checked:=true;
     if status='住房' then radiobutton2.Checked:=true;
     if status='自用' then radiobutton3.Checked:=true;
     if status='维修' then radiobutton4.Checked:=true;
     if status='将到' then radiobutton5.Checked:=true;
     if status='将离' then radiobutton6.Checked:=true;
    end;
end;

//-----------在单击单选按钮时，保存所选的状态--------------
procedure TRoomStatus.RadioButton1Click(Sender: TObject);
begin
if radiobutton1.Checked then//空房
  begin
    chosenIndex:=0;
    chosenStatus:=radiobutton1.Caption;
  end;
end;

procedure TRoomStatus.RadioButton2Click(Sender: TObject);
begin
if radiobutton2.Checked then//住房
  begin
    chosenIndex:=1;
    chosenStatus:=radiobutton2.Caption;
  end;
end;

procedure TRoomStatus.RadioButton3Click(Sender: TObject);
begin
if radiobutton3.Checked then//自用
  begin
    chosenIndex:=2;
    chosenStatus:=radiobutton3.Caption;
  end;
end;

procedure TRoomStatus.RadioButton4Click(Sender: TObject);
begin
if radiobutton4.Checked then//维修
  begin
    chosenIndex:=3;
    chosenStatus:=radiobutton4.Caption;
  end;
end;

procedure TRoomStatus.RadioButton5Click(Sender: TObject);
begin
if radiobutton5.Checked then//将到
  begin
    chosenIndex:=4;
    chosenStatus:=radiobutton5.Caption;
  end;
end;

procedure TRoomStatus.RadioButton6Click(Sender: TObject);
begin
if radiobutton6.Checked then//将离
  begin
    chosenIndex:=5;
    chosenStatus:=radiobutton6.Caption;
  end;
end;



//----------------供其他程序调用时双击选择房间-----------------
procedure TRoomStatus.StringGrid1DblClick(Sender: TObject);
begin
  if button2.Enabled=false then
    if (isChosen=true)and(radiobutton1.Checked) then
      begin
       adoquery1.Close;
       adoquery1.SQL.Clear;
       adoquery1.SQL.Add('select * from 客房信息 where (客房编号=''0'+inttostr(roomNum)+''')and(类型编号='''+preOrder+''')');
       adoquery1.Open;
       if (adoquery1.FieldByName('客房编号').AsString<>'')or(preOrder='no preorder') then
        begin
        //如果选择的房间是符合要求的空房，则保存房间号并关闭窗体
        main.RoomNum:=roomNum;
        close;
        end
        else
         begin
          showmessage('所选房间并非预定类型');
          exit;
         end;
      end
     else
       begin
        showmessage('所选的房间不是空房');
        exit;
       end;
end;

end.

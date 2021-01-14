unit RoomInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TRoomInfo = class(TParent)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    optype:string;//标识是新增还是修改
  end;

var
  RoomInfo: TRoomInfo;

implementation

{$R *.dfm}

procedure TRoomInfo.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //根据客房的类型编号显示客房类型名称
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 类型名称 from 客房类型 where 类型编号='''+dbedit2.Text+'''');
  adoquery1.Open;
  combobox1.Text:=adoquery1.fieldbyname('类型名称').AsString;
   //根据楼层的编号显示楼层名称
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 楼层名称 from 楼层信息 where 楼层编号='''+dbedit3.Text+'''');
  adoquery1.Open;
  combobox2.Text:=adoquery1.fieldbyname('楼层名称').AsString;



end;
//------------创建窗体时添加类型名称和楼层名称的下拉列表框项-----------------
procedure TRoomInfo.FormCreate(Sender: TObject);
begin
  inherited;
  //添加客房类型名称下拉项
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select distinct 类型名称 from 客房类型');
  adoquery1.Open;
  combobox1.Items.Clear;
  while not adoquery1.Eof do
   begin
    combobox1.Items.Add(adoquery1.fieldbyname('类型名称').AsString);
    adoquery1.Next;
   end;

   //添加楼层名称下拉项
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select distinct 楼层名称 from 楼层信息');
  adoquery1.Open;
  combobox2.Items.Clear;
  while not adoquery1.Eof do
   begin
    combobox2.Items.Add(adoquery1.fieldbyname('楼层名称').AsString);
    adoquery1.Next;
   end;
end;

//----------根据选择的客房类型名称反查并修改客房类型编号---------
procedure TRoomInfo.ComboBox1Select(Sender: TObject);
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 类型编号 from 客房类型 where 类型名称='''+combobox1.Text+'''');
  adoquery1.Open;
  dbedit2.Text:=adoquery1.fieldbyname('类型编号').AsString;

end;
//----------根据选择的楼层名称反查并修改楼层编号---------
procedure TRoomInfo.ComboBox2Select(Sender: TObject);
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 楼层编号 from 楼层信息 where 楼层名称='''+combobox2.Text+'''');
  adoquery1.Open;
  dbedit3.Text:=adoquery1.fieldbyname('楼层编号').AsString;

end;

//----------保存对数据所做的修改，并检查字段---------
procedure TRoomInfo.ToolButton10Click(Sender: TObject);
var
code:integer;
begin
if optype='insert' then
 begin
  if dbedit2.Text='' then
   begin
    showmessage('必须输入客房的类型编号');
    exit;
   end;
  if dbedit3.Text='' then
    begin
     showmessage('必须输入客房所处的楼层');
     exit;
    end;
   //根据输入的楼层，查询该楼层的最大房间编号，并自动生成新的房间编号
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add('select max(客房编号) 本层最大房间号 from 客房信息 where 楼层编号='''+dbedit3.Text+'''');
   adoquery1.Open;
   code:=adoquery1.FieldByName('本层最大房间号').AsInteger;
   code:=code+1;
   if code mod 100>18 then//控制一层最多的房数不能大于16
    begin
     showmessage('一层最多只能有16间房');
     toolbutton11.Click;
     exit;
    end;

   //避开人们忌讳的数字13，14
   if code mod 100=13 then code:=code+2;
   if code mod 100=14 then code:=code+2;

   //客房编号的合成
   if code<999 then
     dbedit1.Text:='0'+inttostr(code)
   else
     dbedit1.Text:=inttostr(code);
 end;

  //注意函数中继承的parent窗体代码的位置，在这里才调用post方法
  inherited;
  //清除标志
  optype:='';

end;

//------------新增客房信息------------------
procedure TRoomInfo.ToolButton6Click(Sender: TObject);
begin
  inherited;
  optype:='insert';//表示这是新增操作调用的保存按钮
  dbedit7.Text:='空房';

end;

//------------修改客房信息------------------
procedure TRoomInfo.ToolButton7Click(Sender: TObject);
begin
  inherited;
  optype:='edit';//表示这是新增操作调用的保存按钮

end;

//----------------取消操作-----------------------
procedure TRoomInfo.ToolButton11Click(Sender: TObject);
begin
  inherited;
  //清除标志
  optype:='';
end;

end.

unit DBCalendar;

interface

uses
  SysUtils, Classes, Controls, Grids, SampleCalendar,DB,DBCtrls,StdCtrls,Windows;

type
  TDBCalendar = class(TSampleCalendar)
  private
    { Private declarations }
    FReadOnly: Boolean;                              {内部存储的域}
    FUpdating: Boolean;                             {内部使用的标志}
    FDataLink: TFieldDataLink;

    procedure UpdateData(Sender: TObject);
    procedure CMExit(var Message: TCMExit ); message CM_EXIT;

    function GetDataSource:TDataSource;
    procedure SetDataSource(value:TDataSource);
    Function GetDataField:String;
    procedure SetDataField(Value:String);

 //   FDataSource : TDataSource ;
 //   FFieldName : TD

    procedure Datachange(Sender:TObject);
  protected
    { Protected declarations }
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X: Integer; Y: Integer);
      override;

    procedure KeyDown(var Key: Word; Shift: TShiftState);
      override;

   procedure Change; override;

   procedure Notification(AComponent:TComponent;Operation:Toperation);override;
      //当某一控件从FORM上移走时DELPHI的IDE调用该方法通知其它控件


  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;     {必须重载以设置默认值}
    procedure UpdateCalendar; override;                {记住override指示}
    destructor Destroy; override;
    function SelectCell(ACol, ARow: Longint): Boolean;override;
  published
    { Published declarations }
    property ReadOnly: Boolean read FReadOnly write FReadOnly default True;

    property DataSource:TDataSource read GetDataSource write SetDataSource;//与数据库连接的数据源属性
    property DataField:String read GetDataField write SetDataField;  //与数据库连接的字段属性
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TDBCalendar]);
end;

constructor TDBCalendar.Create(AOwner: TComponent);
begin

  FDataLink := TFieldDataLink.Create;          {构造DataLink对象}
  inherited Create(AOwner);                           {必须调用继承的构造方法！}
  //FDataLink.Control := self;                   {使DataLink知道日历对象}
  FDataLink.OnDataChange:=DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FReadOnly := False;                                 {设置默认值}
end;

function TDBCalendar.SelectCell(ACol, ARow: Longint): Boolean;
begin
  if (not FUpdating) and FReadOnly then Result := False   {如果更新时允许选择}
  else Result := inherited SelectCell(ACol, ARow);        {否则使用继承的方法}
end;

procedure TDBCalendar.UpdateCalendar;
begin
  FUpdating := True;                                {设置允许更新的标志}
  try
    inherited UpdateCalendar;                         {与平常一样更新}
  finally
    FUpdating := False;                               {一定要清除标志}
  end;
end;

destructor TDBCalendar.Destroy;
begin
  FDataLink.OnUpdateData := nil;
  FDataLink.OnDataChange:=nil;
  FDataLink.Free;                           {必须首先销毁拥有的对象}
  inherited Destroy;                          {然后调用继承的析构方法}
end;

procedure TDBCalendar.DataChange(Sender:TObject);
begin
  if FDataLink.Field = nil then
    CalendarDate := 0
  else
    CalendarDate := FDataLink.Field.AsDateTime ;
end;

procedure TDBCalendar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  MyMouseDown: TMouseEvent;
begin
  if not ReadOnly and FDataLink.Edit then
    inherited MouseDown(Button, Shift, X, Y)
  else
  begin
    MyMouseDown := OnMouseDown;
    if Assigned(MyMouseDown) then MyMouseDown(Self, Button, Shift, X, Y);
  end;
end;

procedure TDBCalendar.KeyDown(var Key: Word; Shift: TShiftState);
var
  MyKeyDown: TKeyEvent;
begin
  if not ReadOnly and (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, VK_END,
    VK_HOME, VK_PRIOR, VK_NEXT]) and FDataLink.Edit then
    inherited KeyDown(Key, Shift)
  else
  begin
    MyKeyDown := OnKeyDown;
    if Assigned(MyKeyDown) then MyKeyDown(Self, Key, Shift);
  end;
end;

procedure TDBCalendar.UpdateData(Sender: TObject);
begin
  FDataLink.Field.AsDateTime := CalendarDate;        {设置字段连接到日历日期}
end;

procedure TDBCalendar.Change;
begin
  FDataLink.Modified;                  {调用Modified方法}
  inherited Change;                    {调用继承的Change方法}
end;

procedure TDBCalendar.CMExit(var Message: TCMExit );
begin
  try
    FDataLink.UpdateRecord;                    {告诉DataLink更新数据库}
  except
    on Exception do SetFocus;                    {如果失败，不允许焦点离开}
 end;
  inherited;
end;

function TDBCalendar.GetdataSource:TdataSource;
begin
  result:=FDataLink.DataSource;
end;

Procedure TDBCalendar.SetDataSource(Value:TDataSource);
begin
  FDataLink.DataSource:=Value;
end;

function TDBCalendar.GetDatafield:String;
begin
  result:=FDataLink.FieldName;
end;

procedure TDBCalendar.SetDataField(value:String);
begin
  FDataLink.FieldName:=value;
end;

procedure TDBCalendar.Notification(AComponent:TComponent;Operation:TOperation);
begin
  inherited Notification(Acomponent,Operation);
  //当与控件相连的TdataSource被删除时将控件的DataSource属性置为空
  if (Operation=opRemove) and (FDataLink = nil)  and (AComponent=Datasource) then
      DataSource:=nil;
end;

end.

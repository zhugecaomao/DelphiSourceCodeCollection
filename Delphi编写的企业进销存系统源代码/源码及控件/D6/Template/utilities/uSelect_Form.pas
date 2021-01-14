//--------------------------------------------------
//Inherited :
//Application :可让使用者在输入时能选择所要的资料
//Successor :
//                            copywite by c.h.c. 1999/5/
//--------------------------------------------------
unit uSelect_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls,
  DBNavPlus, ToolWin, ComCtrls,IMM;

type
  TSelect_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ToolBar1: TToolBar;
    DBNavPlus1: TDBNavPlus;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    SpeedButton3: TSpeedButton;
    EditExtSearchKey: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure EditExtSearchKeyChange(Sender: TObject);
    procedure Query1AfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Query1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_Form: TSelect_Form;
  sFieldname:string;
implementation


{$ifndef NoDataBase}
 Uses  uDM;
{$endif}


{$R *.DFM}
procedure ToChinese(hWindows: THandle; bChinese: boolean);
begin
  if ImmIsIME(GetKeyboardLayOut(0)) <> bChinese then
    ImmSimulateHotKey(hWindows, IME_THotKey_IME_NonIME_Toggle);
end;

procedure TSelect_Form.BitBtn1Click(Sender: TObject);
begin
  if Query1.RecordCount <> 0 then    //bobi 2003.1.6 当不存在搜寻资料时,点选选取无效
  ModalResult := mrOK;
end;

procedure TSelect_Form.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

//--------------  Procedure ----------------
//当combobox变动时,将其新的搜寻栏位值指定给栏位变数
//------------------------------------------
procedure TSelect_Form.ComboBox1Change(Sender: TObject);
begin
  sFieldName:=ComboBox1.Text;
end;

//--------------  Procedure ----------------
//当栏位值变动时,立即寻找
//------------------------------------------
procedure TSelect_Form.EditExtSearchKeyChange(Sender: TObject);
begin
  if EditExtSearchKey.Text = '' then begin
    Query1.Filter:='';
    exit;
  end;
  
  Case Query1.Fields[Combobox1.ItemIndex].DataType of
    ftString,ftMemo:
      Query1.Filter:=sFieldName+'='''+EditExtSearchKey.Text+'*''';
    ftDate,ftDateTime:
      begin
        Try
          Query1.Filter:=sFieldName+'='''+FormatDateTime('MM/DD/YYYY',StrtoDate(EditExtSearchKey.Text))+'''';
        Except
          Raise Exception.Create('请输入正确格式的日期!');
        end;
      end;
    ftFloat,ftCurrency:
      Query1.Filter:=sFieldName+'='+EditExtSearchKey.Text+'';
  end;
end;

//--------------  Procedure ----------------
//在资料库打开之後将各栏位的值填入combobox中,以让使用者选取要搜寻的栏位值
//------------------------------------------
procedure TSelect_Form.Query1AfterOpen(DataSet: TDataSet);
var
  iCount:integer;
begin
  for iCount:=0 to Query1.FieldCount-1 do
    begin
      ComboBox1.Items.Add(Query1.Fields[iCount].FieldName);
      DBGrid1.Columns[iCount].Title.Alignment:=taCenter;
    end;
  ComboBox1.ItemIndex:=0;
  sFieldName:=ComboBox1.Text;
end;

procedure TSelect_Form.FormShow(Sender: TObject);
begin
  EditExtSearchKey.SetFocus;
end;

procedure TSelect_Form.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
{
  With DBGrid1.Canvas do
  if not (gdSelected in state) then // not in focus
   begin
      Brush.Color:=clwindow;
      Rectangle(Rect.Left,Rect.Top,Rect.Right,Rect.Bottom);
      DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State)  // 将字重写回
   end
   else
   begin
      Brush.Color:=$00408000;
      Rectangle(Rect.Left,Rect.Top,Rect.Right,Rect.Bottom);
      DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
   end;
   }
end;

procedure TSelect_Form.SpeedButton3Click(Sender: TObject);
begin
  Query1.Filter:='';
end;

procedure TSelect_Form.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = chr(vk_return))then
    if (NOT (Query1.State in [dsEdit,dsInsert])) then
       ModalResult := mrOK
    else
      begin
        PostMessage(DBGrid1.Handle,WM_KEYDOWN,VK_TAB,0);
        key := #0;
      end;
end;

procedure TSelect_Form.Query1PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].ErrorCode = 9733 then //Master Record missing
      begin
       Application.MessageBox('因为有关联资料存在, 无法在此完成新增操作, 请至基本资料处新增.','错误',MB_OK+MB_ICONSTOP);
       Abort;
      end;
end;

procedure TSelect_Form.DBGrid1ColEnter(Sender: TObject);
begin
  Case DBGrid1.SelectedField.DataType of
    ftString,ftMemo :  ToChinese(Handle,True);
  else
    ToChinese(Handle,False);
  end;
end;

procedure TSelect_Form.Query1AfterPost(DataSet: TDataSet);
Var
  i: integer;
begin
  for i:=0 to DM.ComponentCount-1 do
    if DM.Components[i] is TDataSet then
       (DM.Components[i] as TDataSet).Close;
  for i:=0 to DM.ComponentCount-1 do
    if DM.Components[i] is TDataSet then
       (DM.Components[i] as TDataSet).Open;     
end;

procedure TSelect_Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case key of
    vk_Return :         // 选取 - Enter
      ModalResult := mrOK;

    vk_Escape :         // [取消]
      ModalResult := mrCancel;

    vk_Home :            // 首笔 - Ctrl + Home  ;  上一笔 - Ctrl + Home
    begin
      if (ssCtrl in Shift) then Query1.First
        else if (ssAlt in Shift) then Query1.Prior;
    end;

    vk_End :            // 未笔 - Alt + Home  ;  下一笔 - Alt + End
    begin
      if (ssCtrl in Shift) then begin Query1.Last;  Key:=0; end
        else if (ssAlt in Shift) then Query1.Next;
    end;

    vk_F12 :
      if EditExtSearchKey.Focused then DBGrid1.SetFocus else EditExtSearchKey.SetFocus;
  End;
end;

end.

//--------------------------------------------------
//Inherited :
//Application :可让使用者在输入时能选择所要的资料
//Successor :
//                            copywite by c.h.c. 1999/5/
//--------------------------------------------------
unit uSelSinleData_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ExtCtrls,
  DBNavPlus, ToolWin, ComCtrls,IMM;

type
  TSelSinleData_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label2: TLabel;
    ToolBar1: TToolBar;
    DBNavPlus1: TDBNavPlus;
    SBSel: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SBRefresh: TSpeedButton;
    EText: TEdit;
    Query1: TQuery;
    Qry1: TQuery;
    procedure RequiredValue(Sender: TField);    
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ETextChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Query1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure Query1AfterPost(DataSet: TDataSet);
    procedure Query1AfterOpen(DataSet: TDataSet);
    procedure Query1BeforePost(DataSet: TDataSet);
    procedure SBRefreshClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelSinleData_Form: TSelSinleData_Form;
  sTableName, sKeyFieldName, sLocFieldName: String;
  lShowKeyField: Boolean;
  iAutoKeyType: Integer;
  asFieldLabel: Array of String;

implementation

 Uses utilities, uDataBaseEValue
{$ifndef NoDataBase}
  ,uDM
{$endif}
 ;

{$R *.DFM}


procedure TSelSinleData_Form.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSelSinleData_Form.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;



//--------------  Procedure ----------------
//当栏位值变动时,立即寻找
//------------------------------------------
procedure TSelSinleData_Form.ETextChange(Sender: TObject);
begin
  if (EText.Text <> '') Then
    Query1.Locate(sLocFieldName, EText.Text, [loPartialKey]);
end;

//--------------  Procedure ----------------
//在资料库打开之後将各栏位的值填入combobox中,以让使用者选取要搜寻的栏位值
//------------------------------------------
procedure TSelSinleData_Form.FormShow(Sender: TObject);
begin
  EText.SetFocus;
end;



procedure TSelSinleData_Form.Query1PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if (E is EDBEngineError) then
    if (E as EDBEngineError).Errors[0].ErrorCode = 9733 then //Master Record missing
    begin
      Application.MessageBox('因为有关联资料存在, 无法在此完成新增操作, 请至基本资料处新增.','错误',MB_OK+MB_ICONSTOP);
      Abort;
    end;
end;


procedure TSelSinleData_Form.DBGrid1ColEnter(Sender: TObject);
begin
  Case DBGrid1.SelectedField.DataType of
    ftString,ftMemo : ToChinese(Handle,True);
  else
    ToChinese(Handle,False);
  end;
end;


procedure TSelSinleData_Form.Query1AfterPost(DataSet: TDataSet);
Var
  sDMQryNm: String;
  xDataSet : TComponent;
begin
  QryRefresh(Query1,[sKeyFieldName]);
  sDMQryNm := 'Q' + Copy(sTableName, 2, Length(sTableName));
  xDataSet := DM.FindComponent(sDMQryNm);
  if Assigned(xDataSet) then
  begin
    TDataSet(xDataSet).Close;
    TDataSet(xDataSet).Open;
  end;
end;

procedure TSelSinleData_Form.Query1AfterOpen(DataSet: TDataSet);
var
  i : Integer;
begin
  Query1.Fields[0].Visible := lShowKeyField;
  for i := 0 to High(asFieldLabel) do
  begin
    Query1.Fields[i].DisplayLabel := asFieldLabel[i];
    Query1.Fields[i].Required := False;
    Query1.Fields[i].OnValidate := RequiredValue;
  end;
end;

procedure TSelSinleData_Form.Query1BeforePost(DataSet: TDataSet);
begin
  if (iAutoKeyType = 1) then Query1.FieldByName(sKeyFieldName).AsInteger := AutoSingleIntNo(Qry1,sTableName,sKeyFieldName);
  CheckFieldVal(DataSet);  
end;

procedure TSelSinleData_Form.SBRefreshClick(Sender: TObject);
begin
  Query1.Close;
  Query1.Open;
end;


procedure TSelSinleData_Form.RequiredValue(Sender: TField);
begin
  EValue_IsNotNull(Sender);
end;


procedure TSelSinleData_Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case key of
    vk_Return :         // 选取 - Enter
      if Query1.State in [dsInsert,dsEdit] then
      begin
        if DBGrid1.SelectedIndex = DBGrid1.FieldCount-1 then
          Query1.Post
        else
          Key := vk_TAB
      end
      else ModalResult := mrOK;

    vk_Insert :         // 新增 - Ins
      Query1.Insert;
    vk_Escape :         // 取消 - ESC ; [取消]
      if Query1.State in [dsInsert,dsEdit] then Query1.Cancel
        else ModalResult := mrCancel;
    Ord('S'), Ord('s'):
      if (ssCtrl in Shift) then DataSetPost(DBNavPlus1.DataSource.DataSet);
    vk_F5 :
      SBRefresh.Click;
    vk_Delete :         // 删除 - Ctrl + Del
    begin
      if (ssCtrl in Shift) then
      begin
        if R_YesNoMessage(['您确定要删除该笔资料吗?']) then
          Query1.Delete;
        Key := 0;
      end;
    end;
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
      if EText.Focused then DBGrid1.SetFocus else EText.SetFocus;
  End;

end;

end.

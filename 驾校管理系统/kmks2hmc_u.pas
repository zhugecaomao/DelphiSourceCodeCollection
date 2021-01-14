unit kmks2hmc_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls,
  ActnList, Grids, DBGridEh, PrnDbgeh, Mask, DB, DBTables, Menus,TypInfo;

type
  Tkmks2hmc = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    aSave: TAction;
    aCancel: TAction;
    aPreview: TAction;
    aPrint: TAction;
    aExit: TAction;
    aNew: TAction;
    aDel: TAction;
    aInsert: TAction;
    aDelete: TAction;
    aSetColumn: TAction;
    aFirst: TAction;
    aPrior: TAction;
    aNext: TAction;
    aLast: TAction;
    aCalendar: TAction;
    aCalculator: TAction;
    aXzdd: TAction;
    aSkgc: TAction;
    aKhXx: TAction;
    Label1: TLabel;
    ilsSub: TImageList;
    Panel2: TPanel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGridEh1: TDBGridEh;
    DBEdit7: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Panel3: TPanel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    btnPreview: TToolButton;
    btnPrint: TToolButton;
    ToolButton9: TToolButton;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    ToolButton3: TToolButton;
    btnNew: TToolButton;
    btnDel: TToolButton;
    ToolButton13: TToolButton;
    btnInsert: TToolButton;
    btnDelete: TToolButton;
    ToolBar2: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolBar3: TToolBar;
    btnExit: TToolButton;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Database1: TDatabase;
    DataSource2: TDataSource;
    Query1: TQuery;
    UpdateSQL1: TUpdateSQL;
    PopupMenu1: TPopupMenu;
    pmnSave: TMenuItem;
    pmnCancel: TMenuItem;
    N11: TMenuItem;
    pmnNew: TMenuItem;
    pmnDel: TMenuItem;
    N6: TMenuItem;
    pmnInsert: TMenuItem;
    pmnDelete: TMenuItem;
    N5: TMenuItem;
    O2: TMenuItem;
    N10: TMenuItem;
    pmnFirst: TMenuItem;
    pmnPrior: TMenuItem;
    pmnNext: TMenuItem;
    pmnLast: TMenuItem;
    MainMenu1: TMainMenu;
    smnFile: TMenuItem;
    smnSave: TMenuItem;
    smnCancel: TMenuItem;
    N3: TMenuItem;
    smnPreview: TMenuItem;
    smnPrint: TMenuItem;
    N1: TMenuItem;
    smnExit: TMenuItem;
    smnEdit: TMenuItem;
    smnNew: TMenuItem;
    smnDel: TMenuItem;
    N9: TMenuItem;
    smnInsert: TMenuItem;
    smnDelete: TMenuItem;
    N4: TMenuItem;
    O1: TMenuItem;
    N2: TMenuItem;
    smnFirst: TMenuItem;
    smnPrior: TMenuItem;
    smnNext: TMenuItem;
    smnLast: TMenuItem;
    Stool: TMenuItem;
    smmCalendar: TMenuItem;
    smmCalculator: TMenuItem;
    Query2: TQuery;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    DBMemo1: TDBMemo;
    Query3: TQuery;
    Query1BDEDesigner: TStringField;
    Query1BDEDesigner2: TStringField;
    Query1BDEDesigner3: TStringField;
    Query1BDEDesigner4: TStringField;
    Query1BDEDesigner5: TStringField;
    Query1BDEDesigner6: TIntegerField;
    Query1BDEDesigner7: TStringField;
    Query1BDEDesigner8: TStringField;
    Query1BDEDesigner9: TStringField;
    Query1BDEDesigner10: TDateTimeField;
    Query1BDEDesigner11: TStringField;
    Query1BDEDesigner12: TStringField;
    Query2BDEDesigner: TStringField;
    Query2BDEDesigner2: TDateTimeField;
    Query2B: TIntegerField;
    Query2C: TIntegerField;
    Query2BDEDesigner3: TIntegerField;
    Query2BDEDesigner4: TIntegerField;
    Query2BDEDesigner5: TStringField;
    Query2BDEDesigner6: TDateTimeField;
    Query2BDEDesigner7: TMemoField;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure Query1UpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure Query2AfterInsert(DataSet: TDataSet);
    procedure Query2BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kmks2hmc: Tkmks2hmc;
  myUpdateKind:TUpdateKind;
resourcestring
  NotImplemented= '%s not implemented!';

  ModifySQL='update 科目二考试_mx set '+
            '学号=:学号,承训车号=:承训车号,指导教练=:指导教练,'+
            '拟赴常德日期=:拟赴常德日期,单号=:单号 '+
            'where (学号=:OLD_学号) and (单号=:单号)';

  InsertSQL='insert into 科目二考试_mx (学号,承训车号,指导教练,拟赴常德日期,单号)'+
            'values(:学号,:承训车号,:指导教练,:拟赴常德日期,:单号)';

  DeleteSQL='delete from 科目二考试_mx where (学号=:OLD_学号) and (单号=:OLD_单号)';

implementation

uses pub_search_u, public_var;

{$R *.dfm}

procedure Tkmks2hmc.FormCreate(Sender: TObject);
begin
  self.Caption:='科目二考试花名册';
  label1.Caption:='科目二考试花名册';
  Updatesql1.InsertSQL.Text:=InsertSQL;
  UpdateSQL1.ModifySQL.Text:= ModifySQL;
  UpdateSQL1.DeleteSQL.Text:=DeleteSQL;
  Query1.Open;
  Query1.Database.TransIsolation := tiDirtyRead;
  query2.Open;
end;

procedure Tkmks2hmc.Query1UpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  if( UpdateKind = ukModify ) then
  begin
    showmessage(Updatesql1.SQL[UpdateKind].Text);
    UpdateSQL1.Apply(UpdateKind);
    UpdateAction := uaApplied;
    exit;
  end;
  if ( UpdateKind = ukInsert ) then
  begin
    showmessage(Updatesql1.SQL[UpdateKind].text);
    UpdateSQL1.Apply(UpdateKind);
    UpdateAction := uaApplied;
    exit;
  end;
  if ( UpdateKind = ukDelete ) then
  begin
    showmessage(Updatesql1.SQL[UpdateKind].text);
    UpdateSQL1.Apply(UpdateKind);
    UpdateAction := uaApplied;
    exit;
  end;
  //错误提示
  UpdateAction := uaSkip;
  ShowMessage( Format( NotImplemented, [GetEnumName(
  TypeInfo(TUpdateKind), Ord(UpdateKind))]));
end;

procedure Tkmks2hmc.DateTimePicker1Change(Sender: TObject);
begin
  dbedit1.Text:=datetostr(datetimepicker1.Date);
end;

procedure Tkmks2hmc.DBGridEh1EditButtonClick(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  if DBGridEh1.SelectedField.FieldName ='姓名' then
  begin
    search_tmpstr:=dbgrideh1.SelectedField.AsString;
    pub_search:=Tpub_search.Create(self);
    mysqlstr:='select 学号,姓名,学习车型 as 证类,身份证号,手机,电话,学费状态 as 交费情况,科目二成绩 as 考试成绩 from student';
    pub_search.myselect(mysqlstr,'学员档案');
    pub_search.ShowModal;
    if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
    begin
      query1.Edit;
      query1.FieldByName('学号').AsString:=myarr[0];
      query1.FieldByName('姓名').AsString:=myarr[1];
      query1.FieldByName('证类').AsString:=myarr[2];
      query1.FieldByName('身份证号').AsString:=myarr[3];
      query1.FieldByName('手机').AsString:=myarr[4];
      query1.FieldByName('电话').AsString:=myarr[5];
      query1.FieldByName('交费情况').AsString:=myarr[6];
      query1.FieldByName('考试成绩').AsInteger:=myarr[7];
      query1.FieldByName('单号').AsString:=dbedit5.Text;
    end;
    //设置自身为有焦点
    //if not edit5.Focused then edit5.SetFocus;
      //dbradiogroup1.SetFocus;  //设置下一控件焦点
  end;
end;

//保存
procedure Tkmks2hmc.btnSaveClick(Sender: TObject);
var
  mybookmark:TBookMark;
begin
  Query1.Database.ApplyUpdates( [Query1] );
  //if mxds_state=1 then query2.Edit;
  if query2.State in [dsEdit, dsInsert] then
  begin
    query2.FieldByName('建档人').AsString:='';
    query2.FieldByName('建档日期').AsDateTime:=date;
    query2.Post;
    //刷新数据
    mybookmark:=query2.GetBookmark;
    query2.Close;
    query2.Open;
    try
      query2.GotoBookmark(mybookmark);
    finally
      query2.FreeBookmark(mybookmark);
    end;
  end;
end;

//取消
procedure Tkmks2hmc.btnCancelClick(Sender: TObject);
begin
  query1.CancelUpdates;
  query2.Cancel;
end;

//增加
procedure Tkmks2hmc.btnInsertClick(Sender: TObject);
begin
  query1.Append;;
end;

//删除
procedure Tkmks2hmc.btnDeleteClick(Sender: TObject);
begin
  if Application.MessageBox( '确定要删除此条记录吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
    query1.Delete;
end;

//新单
procedure Tkmks2hmc.btnNewClick(Sender: TObject);
begin
  if query1.State in [dsEdit,dsInsert] then
    if Application.MessageBox( '确定要保存此单吗?',
      '资料保存', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
       kmks2hmc.btnSaveClick(Sender)
    else
      query1.Cancel;
  query2.Insert
end;

//删单
procedure Tkmks2hmc.btnDelClick(Sender: TObject);
begin
  if Application.MessageBox( '确定要删除此张单吗?',
      '资料删除', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
    query2.Delete;
end;

//返回
procedure Tkmks2hmc.aExitExecute(Sender: TObject);
begin
  close;
end;

procedure Tkmks2hmc.Query2AfterInsert(DataSet: TDataSet);
var
  dhbmstr_l,sqlstr:string; //单号左边值
  xdxs:integer;
  xdxs_str:string;  //新单序数
begin
  //取新单编号
  query3.Close;
  query3.SQL.Clear;
  dhbmstr_l:='KM2DH'+formatdatetime('yyyymmdd',date); //取单号左边字符
  sqlstr:='select * from 科目二考试_zb where 单号 like '+''''+dhbmstr_l+'%''';
  showmessage(sqlstr);
  query3.SQL.Add(sqlstr);
  query3.Open;
  if query3.RecordCount<>0 then
  begin
    query3.Last;
    xdxs:=strtoint(copy(query3.fieldbyname('单号').AsString,14,5))+1;
    xdxs_str:=formatfloat('00000',xdxs);
    dbedit5.Text:=dhbmstr_l+xdxs_str;
  end
  else
  begin
    dbedit5.Text:=dhbmstr_l+'00001';
  end;
  query3.Close;
end;

procedure Tkmks2hmc.Query2BeforeDelete(DataSet: TDataSet);
var
  myquery:tquery;
begin
  //在删除主表之前删除明细记录
  myquery:=tquery.Create(self);
  with myquery do
  begin
    DatabaseName:='jx';
    DataSource:=DataSource2;
    Close;
    sql.Clear;
    SQL.Add('delete from 科目二考试_mx where 单号=:单号');
    ExecSQL;
    close;
    free;
  end;
end;

end.

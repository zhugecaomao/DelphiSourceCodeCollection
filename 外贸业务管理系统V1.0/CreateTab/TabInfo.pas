unit TabInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB,
  ComCtrls, Buttons, Menus, ImgList, ToolWin;

type
  TTabInfo_frm = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Create1: TMenuItem;
    Alter1: TMenuItem;
    ADOCommand1: TADOCommand;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Add1: TMenuItem;
    ADOQuery3: TADOQuery;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    PopupMenu2: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    SQL1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    Panel2: TPanel;
    tablistPanel: TPanel;
    TreeTabInfo: TTreeView;
    Panel4: TPanel;
    btnTabInfoadd: TBitBtn;
    btnTabInfosave: TBitBtn;
    Panel1: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tabid: TEdit;
    tabname: TEdit;
    indexkey: TEdit;
    moduleID: TComboBox;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnTabInfoFieldadd: TBitBtn;
    btnTabInfoFieldedit: TBitBtn;
    btnTabInfoFielddel: TBitBtn;
    btnClose: TBitBtn;
    btnStyleSet: TBitBtn;
    Panel7: TPanel;
    btnmoveup: TSpeedButton;
    btnmovedown: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ToolButton6: TToolButton;
    N18: TMenuItem;
    N19: TMenuItem;
    Splitter1: TSplitter;
    procedure btnTabInfosaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeTabInfoChange(Sender: TObject; Node: TTreeNode);
    procedure btnTabInfoFieldaddClick(Sender: TObject);
    procedure btnTabInfoFieldeditClick(Sender: TObject);
    procedure btnTabInfoFielddelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure tabidChange(Sender: TObject);
    procedure Create1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnStyleSetClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure btnTabInfoaddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure btnmoveupClick(Sender: TObject);
    procedure btnmovedownClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure SQL1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
  private
    { Private declarations }
    Action, TableID:string; //如果是增加时，此值为空，否则为tabid
    procedure setTree();
    procedure initialize();
    procedure  ReadTreeParent(id:string);
    procedure  ReadTree(id:string);
  public
    procedure Query_Ini(id:string);
  end;

var
  TabInfo_frm: TTabInfo_frm;

implementation

uses DataModule, BasePage, TabInfoField, TabInfoStyle, TabInfoEdit,
  BuildSQL, ExportRecord, TableEdit;

{$R *.dfm}

procedure TTabInfo_frm.setTree();
var sqlstr, ModuleID :string;
    i, j:integer;
    node:TTreeNode;
    selnode:TTreeNode;
    nodechd:TTreeNode;
begin
   if TreeTabInfo.Selected <> nil then
     selnode :=TreeTabInfo.Selected;

   TreeTabInfo.Items.Clear;
   sqlstr :='select * from ModuleInfo order by OrderBy';
   with ADOQuery1 do
   begin
     close;
     SQL.Clear;
     SQL.Add(sqlstr);
     try
       Open;
       for i:=0 to RecordCount -1 do
       begin
          node :=TreeTabInfo.Items.Add(nil, FieldByName('ModuleID').AsString);
          node.Expanded :=true;
          node.StateIndex :=1;
          sqlstr :='select * from TabInfo where ModuleID=''' + FieldByName('ModuleID').AsString+''' order by OrderBy' ;
          ADOQuery3.close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add(sqlstr);
          try
             ADOQuery3.Open;
             for j:=0 to ADOQuery3.RecordCount -1 do
             begin
               nodechd :=TreeTabInfo.Items.AddChild(node,ADOQuery3.FieldByName('TabID').AsString) ;
               nodechd.StateIndex :=2;
               ADOQuery3.Next;
             end;
          except
            continue;
          end;
          Next;
       end;
     except
     end;
   end;
   if selnode <> nil then
     selnode.Selected :=true;

end;
procedure  TTabInfo_frm.ReadTreeParent(id:string);
var sqlstr :string;
    i:integer;
begin
   sqlstr :='select * from ModuleInfo where ModuleID=''' + id + ''' order by Orderby' ;
   with ADOQuery1 do
   begin
     close;
     SQL.Clear;
     SQL.Add(sqlstr);
     try
       Open;
       if RecordCount>0 then
       begin
         tabid.Text:= FieldByName('ModuleID').AsString ;
         tabname.Text:= FieldByName('Modulename').AsString ;
       end;
     except
     end;
   end;
end;

procedure  TTabInfo_frm.ReadTree(id:string);
var sqlstr :string;
    i:integer;
begin
   sqlstr :='select * from TabInfo where tabid=''' + id + '''' ;
   with ADOQuery1 do
   begin
     close;
     SQL.Clear;
     SQL.Add(sqlstr);
     try
       Open;
       if RecordCount>0 then
       begin
         tabid.Text:= FieldByName('TabID').AsString ;
         tabname.Text:= FieldByName('tabname').AsString ;
         Moduleid.Text:= FieldByName('Moduleid').AsString ;
         FindFullName(Moduleid);
         indexkey.Text:= FieldByName('indexkey').AsString ;
         action :=tabid.Text;
         Query_Ini(tabid.Text);
       end;
     except
     end;
   end;
end;

procedure TTabInfo_frm.initialize();
begin
  FillItems1(moduleID, 'ModuleInfo', 'moduleID, moduleName', '', ' order by OrderBy', 3);
  setTree();
end;
procedure TTabInfo_frm.Query_Ini(id:string);
var sqlstr:string;
begin            //FieldID, FieldName, Fieldtype, FieldLength, IfNull, DefaultValue, DisFlag
  sqlstr :='select * from TabInfoField where TabID =''' + id + ''' order by Orderby';
  with ADOQuery2 do
  begin
       close;
       SQL.Clear;
       SQL.Add(sqlstr);
       try
          Open;
       except

       end;
  end; 
end;

procedure TTabInfo_frm.btnTabInfosaveClick(Sender: TObject);
var sqlstr:string;
    OrderBy:integer;
    node:TTreeNode;
begin
  node :=TreeTabInfo.Selected;
  with ADOQuery1 do
  begin
    if TreeTabInfo.Selected.StateIndex =1 then //保存模块
    begin
      if action ='' then //增加模块
      begin
        sqlstr :='select * from ModuleInfo where ModuleID=''' + TabID.Text + '''' ;
        if (DoSql_Select(sqlstr) >0) then
        begin
           //if application.MessageBox(pchar('确定要删除"案件名称"为〖' +casename + '〗吗'),'提示信息',mb_yesno+mb_iconinformation)=idno then
           showmessage('此表名已存在');
           exit;
        end;
        sqlstr :='select max(OrderBy) from ModuleInfo' ;
        OrderBy :=GetMaxValue(sqlstr) + 1;
        sqlstr :='insert into ModuleInfo(ModuleID, ModuleName, Orderby) values('''+
                TabID.Text + ''', '''+ TabName.Text + ''', ' + inttostr(OrderBy) + ')' ;
        if (DoSql(sqlstr) >0) then
        begin
          showmessage('操作成功');
          action :='';
          initialize();
        end
        else
        begin
          showmessage('操作失败');
        end;
      end
      else      //修改模块
      begin
        if action <> trim(TabID.Text) then
        begin
           sqlstr :='select * from ModuleInfo where ModuleID=''' + TabID.Text + '''' ;
           if (DoSql_Select(sqlstr) >0) then
           begin
             showmessage('此表名已存在');
             exit;
           end;
        end;
        sqlstr :='Update ModuleInfo set ModuleID=''' + TabID.Text + ''', ModuleName='''+ TabName.Text + ''' where ModuleID=''' + action + '''' ;
        if (DoSql(sqlstr) >0) then
        begin
          sqlstr :='Update TabInfo set ModuleID=''' + TabID.Text + ''' where ModuleID=''' + action + '''' ;
          DoSql(sqlstr);
          showmessage('操作成功');
          action :='';
          initialize();
        end
        else
        begin
          showmessage('操作失败');
        end;
      end;
    end
    else        //保存表名
    begin
      if moduleID.Text ='' then
      begin
        showmessage('模块名称不能为空');
        exit;
      end;
      if action ='' then
      begin
        sqlstr :='select * from TabInfo where TabID=''' + TabID.Text + '''' ;
        if (DoSql_Select(sqlstr) >0) then
        begin
           //if application.MessageBox(pchar('确定要删除"案件名称"为〖' +casename + '〗吗'),'提示信息',mb_yesno+mb_iconinformation)=idno then
           showmessage('此表名已存在');
           exit;
        end;
        sqlstr :='insert into TabInfo(TabID, TabName, ModuleID, Indexkey) values('''+
                TabID.Text + ''', '''+ TabName.Text + ''', ''' + Get_DM(ModuleID.Text) + ''', ''' + Indexkey.Text + ''')' ;
      end
      else
      begin
        if action <> trim(TabID.Text) then
        begin
           sqlstr :='select * from TabInfo where TabID=''' + TabID.Text + '''' ;
           if (DoSql_Select(sqlstr) >0) then
           begin
             showmessage('此表名已存在');
             exit;
           end;
        end;
         sqlstr :='Update TabInfo set TabID=''' + TabID.Text + ''', TabName='''+ TabName.Text + ''', ModuleID=''' + Get_DM(ModuleID.Text) + ''', Indexkey=''' + Indexkey.Text + ''' where TabID=''' + action + '''' ;
      end;
      if (DoSql(sqlstr) >0) then
      begin
        showmessage('操作成功');
        action :='';
        initialize();
      end
      else
      begin
        showmessage('操作失败');
      end;
    end;
    btnTabInfoadd.Enabled :=true;
    node.Selected :=true;
  end;
end;

procedure TTabInfo_frm.FormShow(Sender: TObject);
begin
  initialize();
end;

procedure TTabInfo_frm.TreeTabInfoChange(Sender: TObject; Node: TTreeNode);
begin
  if (Node.StateIndex =1) then
  begin
     action := node.Text;
     ReadTreeParent(node.Text);
     moduleID.Text :='';
     indexkey.Text :='';
    if btnTabInfoadd.Enabled =false then
       btnTabInfoadd.Enabled :=true;
  end
  else
  begin
     action := node.Text;
     ReadTree(Node.Text);
     if btnTabInfoadd.Enabled =false then
       btnTabInfoadd.Enabled :=true;
  end;
end;

procedure TTabInfo_frm.btnTabInfoFieldaddClick(Sender: TObject);
begin
  application.CreateForm(TTabInfoField_frm, TabInfoField_frm);
  TabInfoField_frm.TabID :=tabid.Text;
  TabInfoField_frm.ShowModal;
  TabInfoField_frm.Free;
end;

procedure TTabInfo_frm.btnTabInfoFieldeditClick(Sender: TObject);
begin
  application.CreateForm(TTabInfoField_frm, TabInfoField_frm);
  TabInfoField_frm.TabID :=tabid.Text;
  TabInfoField_frm.action :=ADOQuery2.Fieldbyname('FieldID').AsString;
  {TabInfoField_frm.FieldID :=ADOQuery2.Fieldbyname('FieldID').AsString;
  TabInfoField_frm.FieldName :=ADOQuery2.Fieldbyname('FieldName').AsString;
  TabInfoField_frm.Fieldtype :=ADOQuery2.Fieldbyname('Fieldtype').AsString;
  TabInfoField_frm.FieldLength :=ADOQuery2.Fieldbyname('FieldLength').AsString;
  if ADOQuery2.Fieldbyname('IfNull').AsString ='1' then
    TabInfoField_frm.IfNull.Checked :=true;
  if ADOQuery2.Fieldbyname('PrimaryKEY').AsString ='1' then
    TabInfoField_frm.boxPrimaryKEY.Checked :=true; }
  TabInfoField_frm.ShowModal;
  TabInfoField_frm.Free;

end;

procedure TTabInfo_frm.btnTabInfoFielddelClick(Sender: TObject);
var sqlstr, fieldidstr:string;
begin
    fieldidstr :=ADOQuery2.Fieldbyname('FieldID').AsString;
    sqlstr :=' delete from TabInfoField where TabID =''' + TabID.Text + ''' and FieldID=''' + fieldidstr + '''';
    if (DoSql(sqlstr) >0) then
    begin
      showmessage('操作成功');
      Query_Ini(TabID.Text);
    end
    else
    begin
      showmessage('操作失败');
    end;
end;

procedure TTabInfo_frm.N1Click(Sender: TObject);
var  node:ttreenode;
begin
  //setTree();
  node:=TreeTabInfo.Items.add(nil, '');
  node.Selected :=true;
  node.StateIndex :=1;
  tabid.Clear;
  tabname.Clear;
  moduleid.Text :='' ;
  indexkey.Clear ;
  tabid.SetFocus;
  //moduleid.Enabled:=false;
  //indexkey.Enabled:=false;
  btnTabInfoadd.Enabled :=false;
end;

procedure TTabInfo_frm.N2Click(Sender: TObject);
var sqlstr, id:string;
begin
    if TreeTabInfo.Selected.StateIndex =2 then
    begin
       showmessage('请选择模块');
       exit;
    end;
    id := TreeTabInfo.Selected.Text ;
    if application.MessageBox(pchar('确定要删除"模块编号"为〖' +id + '〗吗,且模块下所有的表将被删除??'),'提示信息',mb_yesno+mb_iconinformation)=idno then exit;
    sqlstr :='delete from ModuleInfo where ModuleID =''' + id + '''';
    if (DoSql(sqlstr) >0) then
    begin
      sqlstr :='delete from TabInfo where ModuleID =''' + id + '''';
      DoSql(sqlstr);
      showmessage('操作成功');
      setTree();
    end
    else
    begin
      showmessage('操作失败');
    end;

end;

procedure TTabInfo_frm.tabidChange(Sender: TObject);
begin
  if TreeTabInfo.Selected <>nil then 
  TreeTabInfo.Selected.Text :=TabID.Text;
end;

procedure TTabInfo_frm.Create1Click(Sender: TObject);
var sqlstr, createsql,resultsql, id:string;
   i:integer;
   node:TTreeNode;
begin
   node :=TreeTabInfo.Selected;
   id :=TreeTabInfo.Selected.Text;
   with ADOQuery1 do
   begin
     sqlstr :='select * from TabInfoField where TabID=''' + id + ''' order by Orderby';
     close;
     sql.Clear;
     sql.Add(sqlstr);
     open();
     for i :=0 to RecordCount -1 do
     begin
       resultsql :=resultsql +'['+ fieldbyname('fieldid').AsString + '] ' + fieldbyname('FieldType').AsString;

       if (fieldbyname('FieldLength').AsString <>'') and (fieldbyname('FieldLength').AsInteger >0) then  //
           resultsql :=resultsql + '('+ fieldbyname('FieldLength').AsString+')';

       if fieldbyname('Ifnull').AsString ='1' then
           resultsql :=resultsql + ' null ' ;
       if fieldbyname('defaultvalue').AsString <>'' then
       begin
           if pos(fieldbyname('FieldType').AsString, 'int,integer,decimal,money,real,numeric, date,datetime') >0 then
               resultsql :=resultsql + ' default ' + fieldbyname('defaultvalue').AsString + ' '
           else
               resultsql :=resultsql + ' default ''' + fieldbyname('defaultvalue').AsString + ''' ';
       end;
       if i <  RecordCount -1  then
           resultsql :=resultsql + ',';
       next;
     end;

     application.CreateForm(TBuildSQL_frm, BuildSQL_frm);
     BuildSQL_frm.MemoSQL.Clear;
     createsql :='drop  Table %s';
     createsql:=Format(CreateSQL,[id]);
     BuildSQL_frm.MemoSQL.Lines.Add(createsql);
     BuildSQL_frm.MemoSQL.Lines.Add('GO');

     createsql :='Create Table %s(%s)';
     createsql:=Format(CreateSQL,[id,resultsql]);
     BuildSQL_frm.MemoSQL.Lines.Add(createsql);

     BuildSQL_frm.ShowModal;
     BuildSQL_frm.Free;

   end;
end;

procedure TTabInfo_frm.N4Click(Sender: TObject);
begin
  setTree();
end;

procedure TTabInfo_frm.DBGrid1DblClick(Sender: TObject);
begin
  btnTabInfoFieldeditClick(nil);
end;

procedure TTabInfo_frm.FormCreate(Sender: TObject);
begin
  self.Caption :='表信息管理';
  tabid.ImeName :='';
  tabname.ImeName :='';
end;

procedure TTabInfo_frm.btnCloseClick(Sender: TObject);
begin
  close();
end;

procedure TTabInfo_frm.btnStyleSetClick(Sender: TObject);
begin
  application.CreateForm(TTabInfoStyle_frm, TabInfoStyle_frm);
  TabInfoStyle_frm.TabID :=TabID.Text;
  TabInfoStyle_frm.ShowModal;
  TabInfoStyle_frm.Free;

end;

procedure TTabInfo_frm.N7Click(Sender: TObject);
begin
  btnStyleSet.Click;
end;

procedure TTabInfo_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_F9  : if btnTabInfoFieldadd.Enabled then  btnTabInfoFieldadd.Click;
    VK_F4 : if btnTabInfoFieldedit.Enabled then  btnTabInfoFieldedit.Click;
    VK_ESCAPE : if btnClose.Enabled then  btnClose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TTabInfo_frm.N8Click(Sender: TObject);
begin
  application.CreateForm(TTabInfoEdit_frm, TabInfoEdit_frm);
  TabInfoEdit_frm.TabID :=tabid.Text;
  TabInfoEdit_frm.Action :='add';
  SetLength(TabInfoEdit_frm.KeyValue, 1);
  TabInfoEdit_frm.KeyValue[0, 0] :='UserID';
  TabInfoEdit_frm.KeyValue[0, 1] :='';
  TabInfoEdit_frm.KeyValue[0, 2] :='1';    //数据类型(0没有''是否有'号)
  TabInfoEdit_frm.ShowModal;
  TabInfoEdit_frm.Free;

end;

procedure TTabInfo_frm.Add1Click(Sender: TObject);
begin
  application.CreateForm(TTabInfoEdit_frm, TabInfoEdit_frm);
  TabInfoEdit_frm.TabID :=tabid.Text;
  TabInfoEdit_frm.Action :='update';
  SetLength(TabInfoEdit_frm.KeyID, 1);
  SetLength(TabInfoEdit_frm.KeyValue, 1);
  TabInfoEdit_frm.KeyValue[0, 0] :='UserID';
  TabInfoEdit_frm.KeyValue[0, 1] :='';
  TabInfoEdit_frm.KeyValue[0, 2] :='1';    //如果是1 时为字符型,是0时数据类型.  
  TabInfoEdit_frm.ShowModal;
  TabInfoEdit_frm.Free;

end;

procedure TTabInfo_frm.N10Click(Sender: TObject);
var node :TTreeNode; moduleidstr:string;
begin
  if TreeTabInfo.Selected <> nil then
  begin
    moduleidstr := TreeTabInfo.Selected.Text;
    node:=TreeTabInfo.Items.AddChild(TreeTabInfo.Selected, '');
    node.Selected :=true;
    node.StateIndex :=2;
    tabid.Clear;
    tabname.Clear;
    moduleid.Text :='' ;
    indexkey.Clear ;
    moduleID.Text :=moduleidstr;
    FindFullName(moduleID);
    tabid.SetFocus;
    action :=tabid.Text;
    //btnTabInfoadd.Enabled :=false;
  end;

end;

procedure TTabInfo_frm.btnTabInfoaddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if button=mbLeft then
  begin
    PopupMenu2.Popup (self.Left + btnTabInfoadd.Left + tablistPanel.Left + x,self.Top + btnTabInfoadd.Top + + tablistPanel.Top +y);//a,b 为显示的位置
  end;

end;

procedure TTabInfo_frm.N11Click(Sender: TObject);
var sqlstr, id:string;
begin
    id := TreeTabInfo.Selected.Text ;
    if application.MessageBox(pchar('确定要删除"表名"为〖' +id + '〗吗'),'提示信息',mb_yesno+mb_iconinformation)=idno then exit;
    
    sqlstr :='delete from TabInfo where TabID =''' + id + '''';
    if (DoSql(sqlstr) >0) then
    begin
      showmessage('操作成功');
      setTree();
    end
    else
    begin
      showmessage('操作失败或是表不存在');
    end;

end;

procedure TTabInfo_frm.N12Click(Sender: TObject);
begin
  N1.Click;
end;

procedure TTabInfo_frm.N13Click(Sender: TObject);
begin
    N2.Click;

end;

procedure TTabInfo_frm.N15Click(Sender: TObject);
begin
  N10.Click;

end;

procedure TTabInfo_frm.N16Click(Sender: TObject);
begin
  N11.Click;

end;

procedure TTabInfo_frm.btnmoveupClick(Sender: TObject);
var id, sqlstr:string;
    i, orderby_s, orderby_d :integer;
begin
   TableID :=TABID.Text;
   id :=ADOQuery2.fieldbyname('FieldID').AsString;
   orderby_s :=ADOQuery2.fieldbyname('OrderBy').AsInteger;
   if orderby_s <=1 then
   begin
     exit;
   end;
   sqlstr :='update TabInfoField set OrderBy ='+inttostr(orderby_s) +' where tabID=''' +TableID+ ''' AND OrderBy=' +inttostr(orderby_s-1);
   //showmessage(sqlstr);
   dosql(sqlstr);
   sqlstr :='update TabInfoField set OrderBy ='+inttostr(orderby_s-1) +' where tabID=''' +TableID+ ''' AND FieldID=''' +id+ '''';
   //showmessage(sqlstr);
   dosql(sqlstr);
   Query_Ini(tabid.Text);
   for i:=1 to ADOQuery2.RecordCount  do
   begin
     if (i < orderby_s -1) then
       ADOQuery2.Next;
   end;
end;

procedure TTabInfo_frm.btnmovedownClick(Sender: TObject);
var id, sqlstr:string;
    i, orderby_s, orderby_d :integer;
begin
   TableID :=TABID.Text;
   id :=ADOQuery2.fieldbyname('FieldID').AsString;
   orderby_s :=ADOQuery2.fieldbyname('OrderBy').AsInteger;
   if orderby_s >=ADOQuery2.RecordCount then
   begin
     exit;
   end;
   sqlstr :='update TabInfoField set OrderBy ='+inttostr(orderby_s) +' where tabID=''' +TableID+ ''' AND OrderBy=' +inttostr(orderby_s+1);
   //showmessage(sqlstr);
   dosql(sqlstr);
   sqlstr :='update TabInfoField set OrderBy ='+inttostr(orderby_s+1) +' where tabID=''' +TableID+ ''' AND FieldID=''' +id+ '''';
   //showmessage(sqlstr);
   dosql(sqlstr);
   Query_Ini(tabid.Text);
   for i:=1 to ADOQuery2.RecordCount  do
   begin
     if (i < orderby_s +1) then
       ADOQuery2.Next;
   end;

end;

procedure TTabInfo_frm.SpeedButton1Click(Sender: TObject);
var id, sqlstr:string;
    i:integer;
begin
   TableID :=TABID.Text;
   with ADOQuery1 do
   begin
     close();
     sql.Clear;
     sql.Add('select * from TabInfoField where TabID =''' + TableID + ''' order by Orderby');
     open;
     for i:=1 to RecordCount  do
     begin
        id :=fieldbyname('FieldID').AsString;
        sqlstr :='update TabInfoField set OrderBy ='+inttostr(i) +' where tabID=''' +TableID+ ''' AND FieldID=''' +id+ '''';
        dosql(sqlstr);
        next;
     end;
      Query_Ini(TableID);
   end;
end;

procedure TTabInfo_frm.N17Click(Sender: TObject);
begin
  application.CreateForm(TExportRecord_frm, ExportRecord_frm);
  ExportRecord_frm.TabID :=tabid.Text;
  ExportRecord_frm.ShowModal;
  ExportRecord_frm.Free;

end;

procedure TTabInfo_frm.SQL1Click(Sender: TObject);
begin
  application.CreateForm(TBuildSQL_frm, BuildSQL_frm);
  BuildSQL_frm.ShowModal;
  BuildSQL_frm.Free;

end;

procedure TTabInfo_frm.ToolButton4Click(Sender: TObject);
begin
  SQL1.OnClick(nil);
end;

procedure TTabInfo_frm.ToolButton3Click(Sender: TObject);
begin
   N17.OnClick(nil);
end;

procedure TTabInfo_frm.ToolButton2Click(Sender: TObject);
begin
  Create1.Click;
end;

procedure TTabInfo_frm.ToolButton1Click(Sender: TObject);
begin
  N10.Click;
end;

procedure TTabInfo_frm.ToolButton6Click(Sender: TObject);
begin
  N11.Click;
end;

procedure TTabInfo_frm.ToolButton5Click(Sender: TObject);
begin
  n7.Click;
end;

procedure TTabInfo_frm.N18Click(Sender: TObject);
begin
  application.CreateForm(TTableEdit_frm, TableEdit_frm);
  TableEdit_frm.TabID :=tabid.Text;
  TableEdit_frm.Action :='add';
  SetLength(TableEdit_frm.KeyValue, 1);
  TableEdit_frm.KeyValue[0, 0] :='UserID';
  TableEdit_frm.KeyValue[0, 1] :='';
  TableEdit_frm.KeyValue[0, 2] :='1';    //数据类型(0没有''是否有'号)
  TableEdit_frm.ShowModal;
  TableEdit_frm.Free;

end;

procedure TTabInfo_frm.N19Click(Sender: TObject);
var sqlstr, field, id:string;
   maxid:integer;
begin
  try
     id :=TreeTabInfo.Selected.Text;
     sqlstr :='select FieldID from tabinfofield where TabID=''' + id + ''' and PrimaryKey=''1''';
     field :=GetOneValue(SQLSTR);
     showmessage(sqlstr);
     sqlstr :='select MAX('+field+') from ' + id + '';
     maxid :=GetMaxValue(SQLSTR) + 1;
     try
        sqlstr :='update TabInfo set MaxRecID=' + inttostr(maxid) + ' where TabID=''' + id + '''';
        if dosql(sqlstr) >1 then
        begin
          showmessage('设置成功');
        end;
     except
        on E: Exception do showmessage('设置失败.' +E.Message);
     end;
  except
        on E: Exception do showmessage('设置失败.' +E.Message);
  end;
end;

end.

unit DictInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, GridsEh, DBGridEh, ComCtrls,
  SUITreeView, SUIImagePanel, DB, ADODB, ImgList, fcTreeView, SUIButton,
  StdCtrls, Grids, DBGrids, SUIDBCtrls;

type
  TDictInfo_frm = class(TBaseFrm)
    suiImagePanel1: TsuiImagePanel;
    suiImagePanel2: TsuiImagePanel;
    Query: TADOQuery;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ImageList1: TImageList;
    TreeDictInfo: TfcTreeView;
    btnSelect: TsuiButton;
    btnadd: TsuiButton;
    btndelete: TsuiButton;
    btnupdate: TsuiButton;
    btnclose: TsuiButton;
    ADOQuery3: TADOQuery;
    Splitter1: TSplitter;
    DBGrid: TsuiDBGrid;
    procedure FormShow(Sender: TObject);
    procedure TreeDictInfoClick(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure btndeleteClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
    procedure btnupdateClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
  private
        procedure initialize();
        procedure Query_ini(wheresql:string);
        procedure Set_DBGrid();
        procedure setTree();
  public
    TabID:string;
    KeyID: array of array[0..2] of string;
  end;

var
  DictInfo_frm: TDictInfo_frm;

implementation

uses DataModule, BasePage, TableEdit;

{$R *.dfm}
procedure TDictInfo_frm.Set_DBGrid();
begin
end;
procedure TDictInfo_frm.initialize();
begin
  TabID :='UserInfo';
  //Set_DBGrid(DBGrid1, TabID);
  setTree();
  TabID :='UserInfo';
  //Query_ini('');
end;
procedure TDictInfo_frm.Query_ini(wheresql:string);
var
    sqlstr:string;
    i, j:integer;
    Column:tColumn;
begin
  try
  j:=0;
  wheresql:=' where 1=1 ' + wheresql;
  sqlstr:='select * from '+ tabID + wheresql;
  Get_Query(Query, sqlstr);

  DBGrid.Columns.Clear;
  sqlstr:='select * from TabInfoField where tabID=''' + tabID + ''' and ListFlag=''1'' order by OrderBy';
  Get_Query(ADOQuery1, sqlstr);
  for i:=0 to ADOQuery1.RecordCount-1 do
  begin
     Column :=DBGrid.Columns.Add;
     Column.Title.Alignment :=taCenter;
          
     Column.FieldName :=ADOQuery1.fieldbyname('FieldID').AsString;
     Column.Title.Caption :=ADOQuery1.fieldbyname('FieldName').AsString;
     if  ADOQuery1.Fieldbyname('PrimaryKey').AsString ='1' then   //获取主键
     begin
       try
         KeyID[j, 0] :=ADOQuery1.fieldbyname('FieldID').AsString;
         KeyID[j, 1] :=Query.fieldbyname(ADOQuery1.fieldbyname('FieldID').AsString).AsString;
         if pos(ADOQuery1.fieldbyname('FieldType').AsString, 'int,integer,decimal,money,real,numeric') >0 then
         begin
            KeyID[j, 2] :='0';
         end;
         inc(j);
       except
        on e:exception do
        begin
           writelog('设置字据字典时出错:'+e.Message);
           showmessage('设置字据字典时出错:'+e.Message);
           exit;
        end;
       end;
     end;
     if ADOQuery1.Fieldbyname('FieldLength').AsInteger >200 then
     begin
          column.Width :=150;
     end
     else if ADOQuery1.Fieldbyname('FieldLength').AsInteger >100 then
     begin
          column.Width :=120;
     end
     else if ADOQuery1.Fieldbyname('FieldLength').AsInteger >=50 then
     begin
          column.Width :=100;
     end
     else
          column.Width :=80;


     ADOQuery1.Next;
  end;
  ADOQuery1.Close();
  except
     on e:exception do
     begin
       writelog('读取记录时出错:'+e.Message);
       showmessage('读取记录时出错:'+e.Message);
     end;
  end;
end;

procedure TDictInfo_frm.setTree();
var sqlstr, ModuleID, tab :string;
    i, j, k:integer;
    node:TfcTreeNode;
    selnode:TfcTreeNode;
    nodechd,nodechd1:TfcTreeNode;
begin
 try
   if TreeDictInfo.Selected <> nil then
     selnode :=TreeDictInfo.Selected;

   TreeDictInfo.Items.Clear;
   sqlstr :='select * from ModuleInfo where Flag =''00'' order by OrderBy';
   with ADOQuery1 do
   begin
     close;
     SQL.Clear;
     SQL.Add(sqlstr);
     try
       Open;
       for i:=0 to RecordCount -1 do
       begin
          node :=TreeDictInfo.Items.Add(nil, FieldByName('ModuleName').AsString);
          node.Expanded :=true;
          node.StringData :=ADOQuery1.FieldByName('ModuleID').AsString;
          node.StateIndex :=1;
          node.ImageIndex :=0;
          sqlstr :='select * from TabInfo where ModuleID=''' + ADOQuery1.FieldByName('ModuleID').AsString+ ''' order by OrderBy' ;
          ADOQuery2.close;
          ADOQuery2.SQL.Clear;
          ADOQuery2.SQL.Add(sqlstr);
          try
             ADOQuery2.Open;
             for j:=0 to ADOQuery2.RecordCount -1 do
             begin
               nodechd :=TreeDictInfo.Items.AddChild(node,ADOQuery2.FieldByName('TabName').AsString) ;
               nodechd.StringData :=ADOQuery2.FieldByName('TabID').AsString;
               nodechd.StateIndex :=2;
               nodechd.ImageIndex :=1;
               if (ADOQuery2.FieldByName('TabID').AsString ='DictAreaPost')or(ADOQuery2.FieldByName('TabID').AsString ='DictPort') then
               begin
                 nodechd.StateIndex :=1;
                 if  ADOQuery2.FieldByName('TabID').AsString = 'DictAreaPost' then
                 begin
                    sqlstr :='select * from DictProvince order by DictID ';
                 end
                 else 
                    sqlstr :='select * from DictCountry order by DictID ';
                  ADOQuery3.close;
                  ADOQuery3.SQL.Clear;
                  ADOQuery3.SQL.Add(sqlstr);
                  try
                     ADOQuery3.Open;
                     for k:=0 to ADOQuery3.RecordCount -1 do
                     begin
                        nodechd1 :=TreeDictInfo.Items.AddChild(nodechd,ADOQuery3.FieldByName('DictName').AsString) ;
                        nodechd1.StringData :=ADOQuery2.FieldByName('TabID').AsString;
                        nodechd1.StringData2 :=ADOQuery3.FieldByName('DictID').AsString;
                        nodechd1.StateIndex :=3;
                        nodechd1.ImageIndex :=2;
                        ADOQuery3.Next;
                     end;
                  except
                    on ex:exception do
                    begin
                       writelog('读取国家字典时出错:'+ex.Message);
                       continue;
                    end;
                  end;
               end;
               ADOQuery2.Next;
             end;
          except
            on ex:exception do
            begin
               writelog('读取记录时出错:'+ex.Message);
               continue;
            end;
          end;
          Next;
       end;
     except
         on ex:exception do
         begin
             writelog('读取字典信息时出错:'+ex.Message);
         end;
     end;
   end;
   if selnode <> nil then
     selnode.Selected :=true;
  except
         on ex:exception do
         begin
             writelog('读取树形列表时出错:'+ex.Message);
         end;

  end;
end;

procedure TDictInfo_frm.FormShow(Sender: TObject);
begin
  inherited;
  SetLength(KeyID, 1);
  KeyID[0, 2] :='0';
  initialize();

end;

procedure TDictInfo_frm.TreeDictInfoClick(Sender: TObject);
var node:TfcTreeNode;
   str:string;
begin
  inherited;
  try
   node :=TreeDictInfo.Selected;
   if node.StateIndex =2 then
   begin
     tabID :=TreeDictInfo.Selected.StringData;
     Query_ini('');
   end
   else if node.StateIndex =3 then
   begin
     tabID :=TreeDictInfo.Selected.StringData;
     str :=TreeDictInfo.Selected.StringData2;
     if  tabID='DictPort' then 
        Query_ini(' and CountryID =''' +str+ '''')
     else if  tabID='DictAreaPost' then 
        Query_ini(' and ProvinceID =''' +str+ '''');
   end;
  except
     on e:exception do
        showmessage(e.Message);
  end;
end;

procedure TDictInfo_frm.btnaddClick(Sender: TObject);
begin
  inherited;
  application.CreateForm(TTableEdit_frm, TableEdit_frm);
  TableEdit_frm.TabID := TabID;
  TableEdit_frm.Action :='add';
  SetLength(TableEdit_frm.KeyValue, 1);
  TableEdit_frm.Query := Query;
  TableEdit_frm.DataSource1.DataSet :=Query;
  TableEdit_frm.KeyValue[0, 0] :=KeyID[0,0];
  TableEdit_frm.KeyValue[0, 1] :=KeyID[0,1];
  TableEdit_frm.KeyValue[0, 2] :=KeyID[0,2];    //数据类型(0没有''是否有'号)
  TableEdit_frm.ShowModal;
  TableEdit_frm.Free;

end;
procedure TDictInfo_frm.btnupdateClick(Sender: TObject);
begin
  inherited;
  //
  application.CreateForm(TTableEdit_frm, TableEdit_frm);
  TableEdit_frm.TabID := TabID;
  TableEdit_frm.Action :='update';
  SetLength(TableEdit_frm.KeyValue, 1);
  TableEdit_frm.Query := Query;
  TableEdit_frm.DataSource1.DataSet :=Query;
  TableEdit_frm.KeyValue[0, 0] :=KeyID[0,0];
  TableEdit_frm.KeyValue[0, 1] :=KeyID[0,1];
  TableEdit_frm.KeyValue[0, 2] :=KeyID[0,2];    //数据类型(0没有''是否有'号)
  TableEdit_frm.ShowModal;
  TableEdit_frm.Free;
end;

procedure TDictInfo_frm.btndeleteClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TDictInfo_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  close();
end;

procedure TDictInfo_frm.btnSelectClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TDictInfo_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    //VK_RETURN  : SelectNext(ActiveControl,True,True);

  end;

end;

procedure TDictInfo_frm.DBGridDblClick(Sender: TObject);
begin
  inherited;
  btnupdate.Click;
end;


procedure TDictInfo_frm.DBGridCellClick(Column: TColumn);
begin
  inherited;
    KeyID[0, 1] :=Query.fieldbyname(KeyID[0, 0]).AsString;

end;

end.

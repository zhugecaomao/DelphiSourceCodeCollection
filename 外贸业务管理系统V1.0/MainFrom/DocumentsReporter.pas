{***************************************
  Copyright (C) 阳光工作室 版权所有。
  文 件 名：DicumentsReporter.pas
  版	  本：ver 1.00.00
  创建标识：2006-12-28   林毅祥   创建
  功能说明：单证打印列表
  注意事项：
  更新记录：
****************************************}

unit DocumentsReporter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIImagePanel, StdCtrls, SUIButton,
  Mask, DBCtrlsEh, ComCtrls, fcTreeView, DB, ADODB, ImgList, Menus,
  SUIPopupMenu, ShellCtrls;

type
  TDocumentsReporter_Frm = class(TBaseFrm)
    suiImagePanel1: TsuiImagePanel;
    suiImagePanel2: TsuiImagePanel;
    Label1: TLabel;
    txt_CID: TEdit;
    btnSelect: TsuiButton;
    Label2: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    txt_FilePath: TEdit;
    Label3: TLabel;
    suiButton2: TsuiButton;
    suiImagePanel3: TsuiImagePanel;
    lv_Report: TListView;
    fctv_ReportType: TfcTreeView;
    q_Client: TADOQuery;
    ds_Client: TDataSource;
    btnDelete: TsuiButton;
    suiButton3: TsuiButton;
    btnBrower: TsuiButton;
    ImageList1: TImageList;
    txt_InvoiceID: TEdit;
    ComboBox1: TComboBox;
    Splitter1: TSplitter;
    btnReportType: TsuiButton;
    btnStyleSet: TsuiButton;
    MenuReport: TsuiPopupMenu;
    MenuReportType: TsuiPopupMenu;
    slv_Report: TShellListView;
    suiButton1: TsuiButton;
    q_DocumentsFacture: TADOQuery;
    ds_DocumentsFacture: TDataSource;
    ADOQuery1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure suiButton3Click(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure suiButton5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnReportTypeClick(Sender: TObject);
    procedure btnBrowerClick(Sender: TObject);
    procedure btnEditStyleClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnStyleSetClick(Sender: TObject);
  private
        procedure initialize();
        procedure Set_TreeView(id:string; flag:boolean=false);
        procedure Get_TreeList(id:string);
        procedure Set_TreeCheck(id:string);
        function Get_ListViewSelect():string;

    { Private declarations }
  public
     procedure Query_ini(id:string);
     procedure Search_Ini(id:string);
    { Public declarations }
  end;

var
  DocumentsReporter_Frm: TDocumentsReporter_Frm;

implementation

uses DataModule, BasePage, PubSelModule, ReportStyleSet;

{$R *.dfm}

procedure TDocumentsReporter_Frm.FormShow(Sender: TObject);
begin
  inherited;
//
  Query_ini('');
 
end;

procedure TDocumentsReporter_Frm.initialize();
var   sqlstr, whsql, id:string;
begin
end;

procedure TDocumentsReporter_Frm.Set_TreeView(id:string; flag:boolean=false);
var i, j :integer;
  Node :TfcTreeNode;
  Nodelist :TfcTreeNode;
begin
  fctv_ReportType.Items.BeginUpdate;
  fctv_ReportType.Items.Clear();
  if flag =false then
  begin
    try
       Node:= fctv_ReportType.Items.Add(nil, '所有单证');
       Node.StringData :='000';
       Node.ImageIndex :=1;
       Node.CheckboxType :=tvctNone;

       //Node.Checked :=true;
       with DataModule_frm.Query do
       begin
          Close();
          SQL.Clear;
          SQL.Add('Select * from DictDocumentsReporter order by TypeID');
          try
             Open;
             for j:=0 to RecordCount -1 do
             begin
               Nodelist :=fctv_ReportType.Items.AddChild(node, FieldByName('DictName').AsString);
               Nodelist.StringData := fieldbyname('DictID').AsString;
               Nodelist.StringData2 := fieldbyname('FilePath').AsString;
               Nodelist.ImageIndex :=2;
               Nodelist.CheckboxType :=tvctCheckbox;
               Nodelist.Checked :=false;
               Next;
             end;
          except
            ON E:Exception do
              begin
                  writelog(Title +'-读取主节点(所有单证)时出错'+E.Message);
              end;
            end;
       end;
       Node.Expanded :=true;
    except
      ON E:Exception do
        begin
         writelog(Title +'-读取主节点(所有单证)时出错'+E.Message);
       end;
    end;
  end
  else
  begin
    q_Client.Close();
    q_Client.SQL.Clear();
    q_Client.SQL.Add('select * from DictDocumentsType');
    try
      q_Client.Open;
      for i:=0 to q_Client.RecordCount -1 do
      begin
        Node:= fctv_ReportType.Items.Add(nil, q_Client.FieldByName('DictName').AsString);
        Node.StringData := q_Client.fieldbyname('DictID').AsString;
        Node.ImageIndex :=1;
        Node.CheckboxType :=tvctNone;
        //Node.Checked :=true;

        DataModule_frm.Query.Close();
        DataModule_frm.Query.SQL.Clear;
        DataModule_frm.Query.SQL.Add('Select * from DictDocumentsReporter where TypeID =''' +q_Client.FieldByName('DictID').AsString+ '''');
        try
          DataModule_frm.Query.Open;
          for j:=0 to DataModule_frm.Query.RecordCount -1 do
          begin
            Nodelist :=fctv_ReportType.Items.AddChild(node, DataModule_frm.Query.FieldByName('DictName').AsString);
            Nodelist.StringData := DataModule_frm.Query.fieldbyname('DictID').AsString;
            Nodelist.StringData2 := DataModule_frm.Query.fieldbyname('FilePath').AsString;
            Nodelist.ImageIndex :=2;
            Nodelist.CheckboxType :=tvctCheckbox;
            Nodelist.Checked :=false;
            DataModule_frm.Query.Next;
          end;
        except
          ON E:Exception do
            begin
             writelog(Title +'-读取子节点时出错'+E.Message);
            end;
        end;
        if i=0 then
            Node.Expanded :=true;
        q_Client.Next;
      end;
    except
      ON E:Exception do
       begin
         writelog(Title +'-读取主节点时出错'+E.Message);
       end;
    end;
  end;
    fctv_ReportType.Items.EndUpdate;
end;

procedure TDocumentsReporter_Frm.Set_TreeCheck(id:string);
var i, j :integer;
  Node :TfcTreeNode;
  Nodelist :TfcTreeNode;
  sqlstr:string;
begin
//生成单证
  sqlstr:='select * from DocumentsReporter where CID='+ id;
  try
    for j:=0 to fctv_ReportType.Items.Count -1 do
    begin
       fctv_ReportType.Items[j].Checked :=false;
       fctv_ReportType.Items[j].Grayed :=false;
    end;
    
    Get_Query(q_Client, sqlstr);
    for i:=0 to q_Client.RecordCount -1 do
    begin
       for j:=0 to fctv_ReportType.Items.Count -1 do
       begin
          Node :=fctv_ReportType.Items[j];
          if (q_Client.FieldByName('ReportID').AsString =Node.StringData) then
          begin
             Node.Checked :=true;
             Node.Grayed :=true;
          end;
       end;
       q_Client.Next;
    end;
  except
    ON E:Exception do
    begin
       writelog(Title +'-设置节点时出错'+E.Message);
    end;
  end;
end;
procedure TDocumentsReporter_Frm.Get_TreeList(id:string);
var i:integer;
   listitem:TListItem;
   item2:TListItem;
   filepath :string;
begin
  filepath :=SystemFilePath+'Documents\'+txt_InvoiceID.Text;
  if (DirectoryExists(filepath)) then
    slv_Report.Root:=filepath;
  //生成单证
  q_Client.Close();
  q_Client.SQL.Clear();
  q_Client.SQL.Add('select * from DocumentsReporter where CID='+ id);
  //try
    q_Client.Open;
    lv_Report.Items.BeginUpdate;

    lv_Report.Items.Clear();
    for i:=0 to q_Client.RecordCount -1 do
    begin
       listitem :=lv_Report.Items.Add;

       listitem.ImageIndex :=2;
       listitem.Checked :=true;
       listitem.Caption :=q_Client.FieldByName('ReportName').AsString;
       listitem.SubItems.Add(q_Client.FieldByName('CreateDate').AsString);
       listitem.SubItems.Add(q_Client.FieldByName('Creator').AsString);
       listitem.SubItems.Add(q_Client.FieldByName('FilePath').AsString);
       listitem.SubItems.Add(q_Client.FieldByName('ReportID').AsString);

       {item2 :=lv_Report.Items.AddItem(listitem);
       item2.Caption :=q_Client.FieldByName('CreateDate').AsString;
       item2 :=lv_Report.Items.AddItem(listitem);
       item2.Caption :=q_Client.FieldByName('Creator').AsString ;  }
       q_Client.Next;
    end;
    lv_Report.Items.EndUpdate;
  {except
    ON E:Exception do
    begin
       writelog(Title +'-读取主节点时出错'+E.Message);
    end;
  end; }
end;

function TDocumentsReporter_Frm.Get_ListViewSelect():string;
var
   subitem:TStrings;
   i, j:integer;
begin
  inherited;
  //
  for i:=0 to lv_Report.Items.Count -1 do
  begin
    if lv_Report.Items[i].Selected then
    begin
      result :='';
      result:=lv_Report.Items[i].SubItems.Strings[3];
    end;
  end;
end;


procedure TDocumentsReporter_Frm.Query_ini(id:string);
begin
  Set_TreeView(id, true);

end;


procedure TDocumentsReporter_Frm.Search_Ini(id:string);
begin
end;

procedure TDocumentsReporter_Frm.suiButton3Click(Sender: TObject);
var i:integer;
    Recnum:integer;
    Node :TfcTreeNode;
begin
  inherited;
//生成单证
  q_Client.Close();
  q_Client.SQL.Clear();
  q_Client.SQL.Add('select * from DocumentsReporter where CID='+ txt_CID.Text);
  try
    q_Client.Open;
    for i:=0 to fctv_ReportType.Items.Count -1 do
    begin
      Node :=fctv_ReportType.Items[i];
      if Node.Checked =true then
      begin
        if Node.Grayed =true then continue;
        try
          Recnum :=DoSql_Select('select * from DocumentsReporter where CID='+txt_CID.Text + ' AND ReportID=''' + Node.StringData + '''');
          if Recnum >0 then continue;

          q_Client.Append;
          q_Client.FieldByName('CID').AsString :=txt_CID.Text;
          q_Client.FieldByName('ReportID').AsString :=Node.StringData;
          q_Client.FieldByName('ReportName').AsString :=Node.Text;
          q_Client.FieldByName('Creator').AsString :=User_ID;
          q_Client.FieldByName('FilePath').AsString :=txt_FilePath.Text;
          q_Client.FieldByName('FilePwd').AsString :='0';
          q_Client.Post
        except
          ON E:Exception do
          begin
            writelog(Title +'-保存DocumentsReporter表时出错'+E.Message);
            continue;
          end;
        end;
      end;
    end;
    SHOWMESSAGE('单证生成功');
  except
    ON E:Exception do
    begin
       writelog(Title +'-读取主节点时出错'+E.Message);
    end;
  end;

end;

procedure TDocumentsReporter_Frm.btnSelectClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TPubSelModule_frm, PubSelModule_frm) ;
   PubSelModule_frm.SelectStr :='select CID as CID, InvoiceID as 发票号, InvoiceDate as 发票日期, ClientContractID as 客户合同号 from DocumentsFacture';
   PubSelModule_frm.WheField[0] :='CID';
   PubSelModule_frm.WheField[1] :=txt_CID.Text;
   PubSelModule_frm.WheField[2] :='InvoiceID';
   PubSelModule_frm.WheField[3] :=txt_InvoiceID.Text;
   
   PubSelModule_frm.ShowModal;
   if PubSelModule_frm.Flag then
   begin
      txt_CID.Text :=PubSelModule_frm.Query.Fields[0].AsString ;
      txt_InvoiceID.Text :=PubSelModule_frm.Query.Fields[1].AsString ;
   end;
   PubSelModule_frm.Free;
   Set_TreeCheck(txt_CID.Text);
   Get_TreeList(txt_CID.Text);
end;

procedure TDocumentsReporter_Frm.suiButton5Click(Sender: TObject);
begin
  inherited;
//
end;

procedure TDocumentsReporter_Frm.ComboBox1Change(Sender: TObject);
begin
  inherited;
  if  ComboBox1.ItemIndex =0 then
      lv_Report.ViewStyle :=vsIcon
  else  if  ComboBox1.ItemIndex =1 then
      lv_Report.ViewStyle :=vsList
  else  if  ComboBox1.ItemIndex =2 then
      lv_Report.ViewStyle :=vsReport
  else  if  ComboBox1.ItemIndex =3 then
      lv_Report.ViewStyle :=vsSmallIcon;
end;

procedure TDocumentsReporter_Frm.btnReportTypeClick(Sender: TObject);
begin
  inherited;
  //
  if btnReportType.Caption ='分类' then
  begin 
    Set_TreeView(txt_CID.Text, true);
    btnReportType.Caption :='所有';
    if (txt_CID.Text ='') then exit;
       Set_TreeCheck(txt_CID.Text);
  end
  else
  begin
    Set_TreeView(txt_CID.Text, false);
    btnReportType.Caption :='分类';
    if (txt_CID.Text ='') then exit;
      Set_TreeCheck(txt_CID.Text);
  end;
end;

procedure TDocumentsReporter_Frm.btnBrowerClick(Sender: TObject);
var
   i, j:integer;
   ReportID:string;
begin
  inherited;
  //
  for i:=0 to lv_Report.Items.Count -1 do
  begin
    if lv_Report.Items[i].Selected then
    begin
       {ReportID :=lv_Report.Items[i].SubItems[3];
       frxReport1.LoadFromFile('Documents/'+txt_CID.Text+'/'+ ReportID + '.fr3');
        //frxReport1.DesignPreviewPage:=true;
       frxReport1.ShowReport;
       frxReport1.Free; }
    end;
  end;
end;

procedure TDocumentsReporter_Frm.btnEditStyleClick(Sender: TObject);
var    i, j:integer;
  fr3path, fr3name:string;
begin
  inherited;
// 编辑模板
  for i:=0 to fctv_ReportType.Items.Count -1 do
  begin
    if (fctv_ReportType.Items[i].Checked=true) and (fctv_ReportType.Items[i].Grayed =false)  then
    begin

     { fr3name :=fctv_ReportType.Items[i].StringData2;
      fr3path :=SystemFilePath +'Report/'+fr3name;
      if fileexists(fr3path) then
      begin
        frxReport1.LoadFromFile(fr3path);
      end;
      frxReport1.FileName :=fr3path;
      frxReport1.DesignReport; }
    end;
  end;
end;

procedure TDocumentsReporter_Frm.btnDeleteClick(Sender: TObject);
var sqlstr:string;
    ReportID:string;
    i:integer;
begin
  inherited;
// 获取报表名
  ReportID :=Get_ListViewSelect();
  if ReportID ='' then
  begin
    showmessage('请选择报表');
    exit;
  end;
  sqlstr:='delete from DocumentsReporter where CID='+txt_CID.Text + ' AND ReportID=''' + ReportID + '''';
  if DoSql(sqlstr) >0 then
  begin
    for i:=lv_Report.Items.Count -1 downto 0 do
    begin
      if lv_Report.Items[i].Selected then
      begin
        lv_Report.Items[i].Delete;
      end;
    end;
    Set_TreeCheck(txt_CID.Text);

  end;
end;

procedure TDocumentsReporter_Frm.btnStyleSetClick(Sender: TObject);
begin
  inherited;
//
   Application.CreateForm(TReportStyleSet_frm, ReportStyleSet_frm) ;
   ReportStyleSet_frm.ShowModal;
   ReportStyleSet_frm.Free ;
end;

end.

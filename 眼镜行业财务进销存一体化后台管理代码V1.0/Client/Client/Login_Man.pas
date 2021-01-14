unit Login_Man;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, XPMenu, Grids,  StdCtrls,
  DBGrids, ComCtrls;

type
  Tfrm_Login_Man = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Cmd_Select: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TreeBase: TTreeView;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cmd_SelectClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeBaseClick(Sender: TObject);
  private
    { Private declarations }
    pz:boolean;
    procedure setGridTitel;
    procedure treeexed(treebm:ttreeview);//加载tree;
    procedure ReadTree(NO:string);
    function CheckDw(p_no:string):boolean;
  public
    { Public declarations }

  end;

var
  frm_Login_Man: Tfrm_Login_Man;

implementation

uses  func, Stock_Contract, Data, untdatadm;

{$R *.dfm}
///////////////////////
procedure tfrm_login_man.setGridTitel;
begin
   DBGrid1.Columns[0].Title.caption:='员工编号';
   DBGrid1.Columns[0].Width:=80;
   DBGrid1.Columns[1].Title.caption:='员工姓名';
   DBGrid1.Columns[1].Width:=80;
   DBGrid1.Columns[2].Title.caption:='所属部门';
   DBGrid1.Columns[2].Width:=120;
   dbgrid1.Columns[3].Visible:=false;
end;

procedure Tfrm_login_man.treeexed(treebm:ttreeview);//加载tree;
var
  sql:widestring;
  node1:ttreenode;
begin
  treebm.Items.Clear;
  ///////////////////////////////////////////
  if pz then
  begin
    sql:='select part_no,part_name from part where (one_partno is null) or (one_partno='+''''+''+''''+')';
  end else
  begin
    sql:='select part_no,part_name from part where storageid='+''''+trim(shopid)+'''';
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  dmmain.CDSquery.Data:=adisp.GetRecord(sql);
  dmmain.CDSquery.Open;
  if not dmmain.CDSquery.IsEmpty then
  begin
    partname:=tstringlist.Create;
    while not dmmain.CDSquery.Eof do
    begin
      node1:=treebm.Items.Add(nil,trim(dmmain.CDSquery.fieldbyname('part_no').AsString)+'_'+trim(dmmain.CDSquery.fieldbyname('part_name').AsString));
      dmmain.CDSquery.Next;
    end;
    dmmain.CDSquery.Close;
    dmmain.CDSquery.Data:=null;
  end;
end;

procedure Tfrm_Login_Man.ReadTree(NO:string);
begin
  frm_data.DataSource1.Enabled:=False;
  with frm_data.ClientDataSet3 do
  begin
      Close;
      CommandText:='';
      CommandText:='Select p_no,p_name,p_workname,p_icno from [dp_person] where p_iswork=1 and p_workid='+''''+trim(no)+'''';
      Open;
      frm_data.DataSource1.DataSet:=frm_data.ClientDataSet3;
      DBgrid1.DataSource:=frm_data.DataSource1;
      if frm_data.ClientDataSet3.RecordCount<>0 then
      begin
        frm_data.DataSource1.Enabled:=True;
        First;
        setgridtitel;
        LabeledEdit1.Text:=frm_data.ClientDataSet3.FieldValues['p_workname'];
        LabeledEdit2.Text:=frm_data.ClientDataSet3.FieldValues['p_NO'];
        LabeledEdit3.Text:=frm_data.ClientDataSet3.FieldValues['p_name'];
      end;
  end;
end;

function Tfrm_Login_Man.CheckDw(p_no:string):boolean;
var
  sql:widestring;
  datas:olevariant;
begin
  result:=true;
  sql:='select managerid from stock_manager where storageid='+''''+trim(p_no)+'''';
  datas:=null;
  try
    ipubtemp.ty_query(sql,datas);
    if not varisnull(datas) then
    begin
      result:=false;
      datas:=null;
    end;
  except
  end;
end;
/////////////////////////
procedure Tfrm_Login_Man.SpeedButton3Click(Sender: TObject);
begin
    frm_data.ClientDataSet2.Active:=false;
    frm_data.ClientDataSet2.Close;
    Close;
end;

procedure Tfrm_Login_Man.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_data.ClientDataSet2.Active:=false;
    frm_data.ClientDataSet2.Close;
    frm_data.ClientDataSet3.Close;
    frm_data.ClientDataSet3.Data:=null;
    Action:=Cafree;
end;

procedure Tfrm_Login_Man.Cmd_SelectClick(Sender: TObject);
begin
    if (Employe_Check='JSR-0001') or (Employe_Check='Stock_Fad_str') then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Close;
    end;
    if (Employe_Check='Stock_Pay_Str') or (Employe_Check='Goods_Requirement_str') then //采购付款
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Close;
    end;
    if Employe_Check='systemset-001' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        Close;
    end;
    if Employe_Check='Demand_Enter_Str' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        Close;
    end;
    if Employe_Check='Demand_Fad_Str' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        Close;
    end;
    if Employe_Check='CGRK_0001' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        Close;
    end;
    if Employe_Check='Goods_Write_Str' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        Close; 
    end;
    if Employe_Check='Quality_Checkstr' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        Close;
    end;
    if Employe_Check='Storage_Umanage_Fad' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        Close;
    end;
    if Employe_Check='Storage_price_attemper' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【员工姓名】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Employe_Check_Result:=Trim(LabeledEdit3.Text);
        Employe_type:=Trim(LabeledEdit1.Text);
        cmd_select.Click;
        Close;
    end;
end;

procedure Tfrm_Login_Man.DBGrid1CellClick(Column: TColumn);
begin
   LabeledEdit1.Text:=frm_data.ClientDataSet3.FieldValues['p_workname'];
  LabeledEdit2.Text:=frm_data.ClientDataSet3.FieldValues['p_NO'];
  LabeledEdit3.Text:=frm_data.ClientDataSet3.FieldValues['p_name'];
end;

procedure Tfrm_Login_Man.SpeedButton4Click(Sender: TObject);
var
  sql:widestring;
  datas:olevariant;
begin
  sql:='Select p_no,p_name,p_workname,p_icno from [dp_person] where p_iswork=1 and p_workname='+''''+trim(LabeledEdit1.Text)+'''';
  frm_data.ClientDataSet3.Close;
  frm_data.ClientDataSet3.Data:=null;
  datas:=null;
  try
    Datas:=adisp.execSql(sql);
    if not varisnull(datas) then
    begin
      frm_data.ClientDataSet3.Data:=datas;
      frm_data.ClientDataSet3.Open;
      frm_data.DataSource1.Enabled:=True;
      setgridtitel;
      datas:=null;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure Tfrm_Login_Man.SpeedButton1Click(Sender: TObject);
var
  sql:widestring;
  datas:olevariant;
begin
  sql:='Select p_no,p_name,p_workname,p_icno from [dp_person] where p_iswork=1 and p_no='+''''+trim(LabeledEdit2.Text)+'''';
  frm_data.ClientDataSet3.Close;
  frm_data.ClientDataSet3.Data:=null;
  datas:=null;
  try
    Datas:=adisp.execSql(sql);
    if not varisnull(datas) then
    begin
      frm_data.ClientDataSet3.Data:=datas;
      frm_data.ClientDataSet3.Open;
      frm_data.DataSource1.Enabled:=True;
      setgridtitel;
      datas:=null;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;

end;
procedure Tfrm_Login_Man.SpeedButton2Click(Sender: TObject);
  var
  sql:widestring;
  datas:olevariant;
begin
  sql:='Select p_no,p_name,p_workname,p_icno from [dp_person] where p_iswork=1 and p_name='+''''+trim(LabeledEdit3.Text)+'''';
  frm_data.ClientDataSet3.Close;
  frm_data.ClientDataSet3.Data:=null;
  datas:=null;
  try
    Datas:=adisp.execSql(sql);
    if not varisnull(datas) then
    begin
      frm_data.ClientDataSet3.Data:=datas;
      frm_data.ClientDataSet3.Open;
      frm_data.DataSource1.Enabled:=True;
      setgridtitel;
      datas:=null;
    end;
  except
    application.MessageBox('服务器发生故障！',pchar(application.Title),mb_iconwarning);
    exit;
  end;
end;

procedure Tfrm_Login_Man.FormShow(Sender: TObject);
begin
  pz:=checkdw(shopid);
  treeexed(treebase);
end;

procedure Tfrm_Login_Man.TreeBaseClick(Sender: TObject);
begin
  if treebase.Selected<>nil then
  begin
    ReadTree(copy(trim(treebase.Selected.Text),1,pos('_',trim(treebase.Selected.Text))-1));
  end;
end;

end.

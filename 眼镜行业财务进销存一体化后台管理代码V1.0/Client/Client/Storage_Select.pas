unit Storage_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMenu, StdCtrls, Grids, Buttons, DBGrids, DB;

type
  Tfrm_Storage_Select = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Cmd_Exit: TSpeedButton;
    Cmd_Select: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGrid1: TDBGrid;
    Edit_Name: TLabeledEdit;
    Edit_NO: TLabeledEdit;
    DSDATA: TDataSource;
    edtstorageid: TLabeledEdit;
    edtname: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Cmd_SelectClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Cmd_ExitClick(Sender: TObject);
  private
    { Private declarations }
    tj:string;
    procedure settitle;
  public
    { Public declarations }
  end;

var
  frm_Storage_Select: Tfrm_Storage_Select;

implementation

uses main,  Data, func, untdatadm;

{$R *.dfm}

procedure Tfrm_Storage_Select.settitle;
begin
   DBGrid1.Columns[0].Title.caption:='仓库编号';
    DBGrid1.Columns[1].Title.caption:='仓库名称';
    DBGrid1.Columns[2].Title.caption:='仓库类型';
    DBGrid1.Columns[3].Title.caption:='所属区域';
    DBGrid1.Columns[4].Title.caption:='仓库地址';
    DBGrid1.Columns[5].Title.caption:='联系电话';
    DBGrid1.Columns[6].Title.caption:='传真号码';
    DBGrid1.Columns[7].Title.caption:='仓库大小';
    DBGrid1.Columns[8].Title.caption:='仓库管理员';
    DBGrid1.Columns[9].Title.caption:='说明';
    DBGrid1.Columns[0].Width:=80;
    DBGrid1.Columns[1].Width:=100;
    DBGrid1.Columns[2].Width:=70;
    DBGrid1.Columns[3].Width:=100;
    DBGrid1.Columns[4].Width:=150;
    DBGrid1.Columns[5].Width:=80;
    DBGrid1.Columns[6].Width:=80;
    DBGrid1.Columns[7].Width:=80;
    DBGrid1.Columns[8].Width:=60;
    DBGrid1.Columns[9].Width:=80;
end;

procedure Tfrm_Storage_Select.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMMAIN.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
    Action:=Cafree;
end;

procedure Tfrm_Storage_Select.FormShow(Sender: TObject);
var
  sql:widestring;
begin
  tj:='';
  if localb then
  begin
    sql:='Select Storage_NO,Storage_Name,Storage_Type,area_NO,Address,Telphone,Fax,volume,Manager,remark from [Storage] where type_flag=1';
  end else
  begin
    tj:=' or storage_no='+''''+trim(shopid)+'''';
    sql:='Select Storage_NO,Storage_Name,Storage_Type,area_NO,Address,Telphone,Fax,volume,Manager,remark from [Storage] where type_flag=1 and storage_no in (select storageid from stock_manager where managerid='+''''+trim(shopid)+''''+')'+tj;
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  try
  dmmain.CDSquery.Data:=adisp.GetRecord(sql);
  dmmain.CDSquery.Open;
  except
  end;
  settitle;
end;

procedure Tfrm_Storage_Select.Cmd_SelectClick(Sender: TObject);
begin
    if Check_Storage='begin_build_goods' then
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);
        Check_Storage_Result_NO:=Trim(edtstorageid.Text);
        Close;
    end;
    if (Check_Storage='Stock_Ente') or (Check_Storage='Goods_Requirement_str') then
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);
        Check_Storage_Result_NO:=Trim(edtstorageid.Text);
        Close;
    end;
    if (Check_Storage='Goods_Write') or (Check_Storage='Quality_Checkstr') then
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close;
    end;
    if Check_Storage='damage_0001' then  //库存报损
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close;
    end;
    if Check_Storage='Demand_Enter_Str' then  //库存报损
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close; 
    end;
    if Check_Storage='Demand_Fad_Str' then  //库存报损
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close;
    end;
    if Check_Storage='Stock_Guide_Str' then  //库存预警向导
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close;//Check_Storage:='Stock_Guide_Str';
    end;
    if (Check_Storage='Storage_Umanage_Fad') or (Check_Storage='Stock_Fad_Str') then  //库存报损
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close;//Storage_warn_Str_all
    end;
    if Check_Storage='Storage_warn_Str_all' then  //库存报预警上下限管理
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close;
    end;

    if (Check_Storage='Storage_price_attemperS') or (Check_Storage='Storage_price_attemperF') then  //同价调拨
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Check_Storage_Result:=Trim(Edit_Name.Text);  //仓库名称
        Check_Storage_Result_NO:=Trim(edtstorageid.Text); //仓库编号
        Close; //
    end;
    if Check_Storage='Stock_State_Str' then //选择的是单一仓库查询
    begin
        if Trim(Edit_Name.Text)='' then
        begin
            Application.MessageBox('操作失败，【仓库名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        Stock_States_Detail_str:='';
        Check_Storage_Result:='';
        Stock_States_Detail_str:='Select_One';
        Check_Storage_Result:=Trim(Edit_Name.Text);
        Check_Storage_Result_NO:=Trim(Edit_NO.Text);
        Close;
    end;
end;

procedure Tfrm_Storage_Select.DBGrid1CellClick(Column: TColumn);
begin
    edtstorageid.Text:=dmmain.CDSquery.FieldByName('storage_No').AsString;
    edtname.Text:=dmmain.CDSquery.FieldByName('storage_Name').AsString;
    Edit_Name.Text:=dmmain.CDSquery.FieldByName('storage_Name').AsString;
    Edit_NO.Text:=dmmain.CDSquery.FieldByName('storage_NO').AsString;
end;

procedure Tfrm_Storage_Select.SpeedButton5Click(Sender: TObject);
var
  sql:widestring;
begin
  tj:='';
  if  trim(edtstorageid.Text)<>'' then
    tj:=' and storage_no= '+''''+trim(edtstorageid.Text)+'''';
  if trim(edtname.Text)<>'' then
    tj:= ' and storage_name= '+''''+trim(edtname.Text)+'''';
  if localb then
  begin
    sql:='Select Storage_NO,Storage_Name,Storage_Type,area_NO,Address,Telphone,Fax,volume,Manager,remark from [Storage] where type_flag=1'+tj;
  end else
  begin
    sql:='Select Storage_NO,Storage_Name,Storage_Type,area_NO,Address,Telphone,Fax,volume,Manager,remark from [Storage] where type_flag=1 and storage_no in (select storageid from stock_manager where managerid='+''''+trim(shopid)+''''+')'+tj;
  end;
  dmmain.CDSquery.Close;
  dmmain.CDSquery.Data:=null;
  try
  dmmain.CDSquery.Data:=adisp.GetRecord(sql);
  dmmain.CDSquery.Open;
  except
  end;
  settitle;
end;

procedure Tfrm_Storage_Select.Cmd_ExitClick(Sender: TObject);
begin
  close;
end;

end.

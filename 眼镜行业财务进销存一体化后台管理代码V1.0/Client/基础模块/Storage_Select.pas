unit Storage_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMenu, StdCtrls, Grids, Buttons, DBGrids;

type
  Tfrm_Storage_Select = class(TForm)
    Panel1: TPanel;
    XPMenu1: TXPMenu;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Cmd_Exit: TSpeedButton;
    Cmd_Select: TSpeedButton;
    Cmd_Add: TSpeedButton;
    Cmd_All: TSpeedButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Edit_Name: TLabeledEdit;
    Edit_NO: TLabeledEdit;
    procedure Cmd_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cmd_AddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cmd_SelectClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Cmd_AllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Storage_Select: Tfrm_Storage_Select;

implementation

uses main, Thing_Base, Data, func, Stock_State_Detail;

{$R *.dfm}

procedure Tfrm_Storage_Select.Cmd_ExitClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Storage_Select.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_data.ClientDataSet_Select.Active:=False;
    frm_data.ClientDataSet_Select.Close;
    Action:=Cafree;
end;

procedure Tfrm_Storage_Select.Cmd_AddClick(Sender: TObject);
begin
    frm_Thing_Base:=Tfrm_Thing_Base.Create(self);
    frm_Thing_Base.TabSh1.TabVisible:=False;
    frm_Thing_Base.TabSh2.TabVisible:=False;
    frm_Thing_Base.TabSh3.TabVisible:=False;
    frm_Thing_Base.TabSh4.TabVisible:=False;
    frm_Thing_Base.TabSh5.TabVisible:=False;
    frm_Thing_Base.TabSh6.TabVisible:=True;
    frm_Thing_Base.TabSh7.TabVisible:=False;
    frm_Thing_Base.TabSh8.TabVisible:=False;
    frm_Thing_Base.TabSh9.TabVisible:=False;
    frm_Thing_Base.TabSh10.TabVisible:=False;
    frm_Thing_Base.ShowModal;
    frm_Thing_Base.Free;
end;

procedure Tfrm_Storage_Select.FormShow(Sender: TObject);
begin
    ComboBox1.Clear;
    ComboBox1.Text:='';
    ComboBox2.Clear;
    ComboBox2.Text:='';
    with frm_data.ClientDataSet_Select do
    begin
        Close;
        CommandText:='';
        CommandText:='Select Storage_NO,Storage_Name,Storage_Type,area_NO,Address,Telphone,Fax,volume,Manager,remark from [Storage]';
        Open;
        while not eof do
        begin
            ComboBox1.Items.Add(frm_data.ClientDataSet_Select.FieldValues['storage_No']);
            ComboBox2.Items.Add(frm_data.ClientDataSet_Select.FieldValues['storage_Name']);
            Next;
        end;
        if frm_data.ClientDataSet_Select.RecordCount>0 then
        begin
            frm_data.DataSource_Search.DataSet:=frm_data.ClientDataSet_Select;
            frm_data.DataSource_Search.Enabled:=False;
            frm_data.DataSource_Search.Enabled:=True;
            DBGrid1.DataSource:=frm_data.DataSource_Search;
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
    end;
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text);
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text);
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
        Check_Storage_Result_NO:=Trim(ComboBox1.Text); //仓库编号
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
    ComboBox1.Text:=frm_data.ClientDataSet_Select.FieldByName('storage_No').AsString;
    ComboBox2.Text:=frm_data.ClientDataSet_Select.FieldByName('storage_Name').AsString;
    Edit_Name.Text:=frm_data.ClientDataSet_Select.FieldByName('storage_Name').AsString;
    Edit_NO.Text:=frm_data.ClientDataSet_Select.FieldByName('storage_NO').AsString;
end;

procedure Tfrm_Storage_Select.Cmd_AllClick(Sender: TObject);
begin
    if Check_Storage='Stock_State_Str' then //选择的是全部仓库
    begin
        Stock_States_Detail_str:='';
        Stock_States_Detail_str:='Select_all';
        Check_Storage_Result:=Trim(Edit_Name.Text);
        Check_Storage_Result_NO:=Trim(ComboBox1.Text);
        Close;
    end;
end;

end.

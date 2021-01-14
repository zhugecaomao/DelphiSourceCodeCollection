unit ChildShop_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, XPMenu, Grids, DBGrids;

type
  Tfrm_ChildShop_Select = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    XPMenu1: TXPMenu;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ChildShop_Select: Tfrm_ChildShop_Select;

implementation

uses Data, func;

{$R *.dfm}

procedure Tfrm_ChildShop_Select.SpeedButton4Click(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_ChildShop_Select.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=Cafree;
end;

procedure Tfrm_ChildShop_Select.FormShow(Sender: TObject);
begin
    with frm_data.ClientDataSet_Add do
    begin
        Close;
        CommandText:='';
        Commandtext:='Select Shop_NO,shop_name,area_no,area_name,Telphone,Fax,address,Zip,merchant,remark from [ChildShop]';
        Open;
        while not eof do
        begin
            ComboBox1.Items.Add(frm_data.ClientDataSet_Add.FieldByName('Shop_NO').AsString);
            ComboBox2.Items.Add(frm_data.ClientDataSet_Add.FieldByName('shop_name').AsString);
            Next;
        end;
        if frm_data.ClientDataSet_Add.RecordCount>0 then
        begin
            frm_data.DataSource1.DataSet:=frm_data.ClientDataSet_Add;
            frm_data.DataSource1.Enabled:=True;
            DBGrid1.DataSource:=frm_data.DataSource1;
            DBGrid1.Columns[0].Title.caption:='店面编号';
            DBGrid1.Columns[1].Title.caption:='店面名称';
            DBGrid1.Columns[2].Title.caption:='区域代码';
            DBGrid1.Columns[3].Title.caption:='区域名称';
            DBGrid1.Columns[4].Title.caption:='联系电话';
            DBGrid1.Columns[5].Title.caption:='传真号码';
            DBGrid1.Columns[6].Title.caption:='详细地址';
            DBGrid1.Columns[7].Title.caption:='邮政编码';
            DBGrid1.Columns[8].Title.caption:='店长';
            DBGrid1.Columns[9].Title.caption:='备注说明';
            first;
            ComboBox1.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('Shop_NO').AsString);
            ComboBox2.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('shop_name').AsString);
            LabeledEdit1.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('Shop_NO').AsString);
            LabeledEdit2.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('shop_name').AsString);
        end;
    end;
end;

procedure Tfrm_ChildShop_Select.DBGrid1CellClick(Column: TColumn);
begin
    ComboBox1.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('Shop_NO').AsString);
    ComboBox2.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('shop_name').AsString);
    LabeledEdit1.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('Shop_NO').AsString);
    LabeledEdit2.Text:=Trim(frm_data.ClientDataSet_Add.FieldByName('shop_name').AsString);
end;

procedure Tfrm_ChildShop_Select.SpeedButton1Click(Sender: TObject);
begin
    if (ChildShop_Str='damage_0001') or (ChildShop_Str='Quality_Check_str') or (ChildShop_Str='Goods_Requirement_str')then//仓库报损
    begin
        if Trim(LabeledEdit1.Text)='' then
        begin
            Application.MessageBox('操作失败，【店面名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        ChildShop_Result_NO:=Trim(LabeledEdit1.Text);
        ChildShop_Result_Name:=Trim(LabeledEdit2.Text);
        Close;
    end;
    if ChildShop_Str='Storage_Umanage_Fad' then//出库
    begin
        if Trim(LabeledEdit1.Text)='' then
        begin
            Application.MessageBox('操作失败，【店面名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        ChildShop_Result_NO:=Trim(LabeledEdit1.Text);
        ChildShop_Result_Name:=Trim(LabeledEdit2.Text);
        Close; 
    end;
    if ChildShop_Str='Demand_Enter_Str' then//出库
    begin
        if Trim(LabeledEdit1.Text)='' then
        begin
            Application.MessageBox('操作失败，【店面名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        ChildShop_Result_NO:=Trim(LabeledEdit1.Text);
        ChildShop_Result_Name:=Trim(LabeledEdit2.Text);
        Close; 
    end;
    if ChildShop_Str='Demand_Fad_Str' then//出库
    begin
        if Trim(LabeledEdit1.Text)='' then
        begin
            Application.MessageBox('操作失败，【店面名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        ChildShop_Result_NO:=Trim(LabeledEdit1.Text);
        ChildShop_Result_Name:=Trim(LabeledEdit2.Text);
        Close;
    end;
    if ChildShop_Str='Goods_Write_Str' then//来货登记
    begin
        if Trim(LabeledEdit1.Text)='' then
        begin
            Application.MessageBox('操作失败，【店面名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        ChildShop_Result_NO:=Trim(LabeledEdit1.Text);
        ChildShop_Result_Name:=Trim(LabeledEdit2.Text);
        Close; // Goods_Write_Str
    end;
    if (ChildShop_Str='Stock_Fad_str') or (ChildShop_Str='Stock_Enter_str')then//采购退货
    begin
        if Trim(LabeledEdit1.Text)='' then
        begin
            Application.MessageBox('操作失败，【店面名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        ChildShop_Result_NO:=Trim(LabeledEdit1.Text);
        ChildShop_Result_Name:=Trim(LabeledEdit2.Text);
        Close; //Stock_Fad_str
    end;
    if (ChildShop_Str='Storage_price_attemperF') or (ChildShop_Str='Storage_price_attemperS') then//出库
    begin
        if Trim(LabeledEdit1.Text)='' then
        begin
            Application.MessageBox('操作失败，【店面名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        ChildShop_Result_NO:=Trim(LabeledEdit1.Text);
        ChildShop_Result_Name:=Trim(LabeledEdit2.Text);
        Close;
    end;
end;

end.

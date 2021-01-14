unit Supply_Monad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Buttons, XPMenu,
  DBGrids;

type
  Tfrm_Supply_Monad = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Cmd_Select: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    XPMenu1: TXPMenu;
    DBGrid1: TDBGrid;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cmd_SelectClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Supply_Monad: Tfrm_Supply_Monad;

implementation

uses Thing_Base, Data, Stock_Contract, func;

{$R *.dfm}

procedure Tfrm_Supply_Monad.SpeedButton3Click(Sender: TObject);
begin
    frm_data.ClientDataSet2.Active:=false;
    frm_data.ClientDataSet2.Close;
    Close;
end;

procedure Tfrm_Supply_Monad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_data.ClientDataSet2.Active:=false;
    frm_data.ClientDataSet2.Close;
    Action:=Cafree;
end;

procedure Tfrm_Supply_Monad.SpeedButton2Click(Sender: TObject);
begin
    frm_Thing_Base:=Tfrm_Thing_Base.Create(self);
    frm_Thing_Base.TabSh1.TabVisible:=False;
    frm_Thing_Base.TabSh2.TabVisible:=False;
    frm_Thing_Base.TabSh3.TabVisible:=True;
    frm_Thing_Base.TabSh4.TabVisible:=False;
    frm_Thing_Base.TabSh5.TabVisible:=False;
    frm_Thing_Base.TabSh6.TabVisible:=False;
    frm_Thing_Base.TabSh7.TabVisible:=False;
    frm_Thing_Base.TabSh8.TabVisible:=False;
    frm_Thing_Base.TabSh9.TabVisible:=False;
    frm_Thing_Base.TabSh10.TabVisible:=False;
    frm_Thing_Base.ShowModal;
    frm_Thing_Base.Free;
end;

procedure Tfrm_Supply_Monad.FormShow(Sender: TObject);
begin
    with frm_data.ClientDataSet2 do
    begin
        try
            Close;
            CommandText:='';
            CommandText:='select ID,supply_name,abbreviation,supply_NO,address,Zip,Link_person,Telphone,Fax,Email,tax_No,bank,bill,Must_gather,Pay_gather,legal_person,contact,remark from [Supply_Company]order by ID';
            Open;

            frm_data.DataSource1.DataSet:=frm_data.ClientDataSet2;
            frm_data.DataSource1.Enabled:=True;
            DBGrid1.DataSource:=frm_data.DataSource1;

            DBGrid1.Columns[0].Title.caption:='序号';
            DBGrid1.Columns[1].Title.caption:='单位名称';
            DBGrid1.Columns[2].Title.caption:='单位简称';
            DBGrid1.Columns[3].Title.caption:='单位编号';
            DBGrid1.Columns[4].Title.caption:='详细地址';
            DBGrid1.Columns[5].Title.caption:='邮政编码';
            DBGrid1.Columns[6].Title.caption:='联系人员';
            DBGrid1.Columns[7].Title.caption:='联系电话';
            DBGrid1.Columns[8].Title.caption:='传真号码';
            DBGrid1.Columns[9].Title.caption:='电子邮件';
            DBGrid1.Columns[10].Title.caption:='税号';
            DBGrid1.Columns[11].Title.caption:='开户银行';
            DBGrid1.Columns[12].Title.caption:='银行帐号';
            DBGrid1.Columns[13].Title.caption:='应收款余额';
            DBGrid1.Columns[14].Title.caption:='应付款余额';
            DBGrid1.Columns[15].Title.caption:='法人代表';
            DBGrid1.Columns[16].Title.caption:='信用额度';
            DBGrid1.Columns[17].Title.caption:='备注说明';
            if frm_data.ClientDataSet2.RecordCount>0 then
            begin
                Last;
                LabeledEdit2.Text:=frm_data.ClientDataSet2.FieldValues['supply_NO'];
                LabeledEdit3.Text:=frm_data.ClientDataSet2.FieldValues['supply_name'];
            end
            else
            begin
                 LabeledEdit2.Text:='';  LabeledEdit3.Text:='';
            end;
        except
            Application.MessageBox('操作失败请检查连接网络是否正常，请确认！',pchar(application.Title),mb_iconwarning);
        end;
    end;
end;

procedure Tfrm_Supply_Monad.Cmd_SelectClick(Sender: TObject);
begin
    if Check_Mond='DW-0001' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【单位名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        check_Mond_Result:=Trim(LabeledEdit3.Text);
        Close; //
    end;
    if Check_Mond='Demand_Enter_Str' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【单位名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        check_Mond_Result:=Trim(LabeledEdit3.Text);
        Close; 
    end;
    if Check_Mond='Demand_Fad_Str' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【单位名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        check_Mond_Result:=Trim(LabeledEdit3.Text);
        Close; 
    end;
    if Check_Mond='DW-0002' then
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【单位名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        check_Mond_Result:=Trim(LabeledEdit3.Text);
        Close;
    end;
    if Check_Mond='Quality_Check' then  //质量验收
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【单位名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        check_Mond_Result:=Trim(LabeledEdit3.Text);
        Close;
    end;
    if Check_Mond='Goods_Write' then //来货登记
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【单位名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        check_Mond_Result:=Trim(LabeledEdit3.Text);
        Close;//
    end;
    if Check_Mond='Stock_pay_Str' then //采购退货
    begin
        if Trim(LabeledEdit3.Text)='' then
        begin
            Application.MessageBox('操作失败，【单位名称】不能为空，请确认！',pchar(application.Title),mb_iconwarning);
            Exit;
        end;
        check_Mond_Result:=Trim(LabeledEdit3.Text);
        Close;
    end;
end;

procedure Tfrm_Supply_Monad.DBGrid1CellClick(Column: TColumn);
begin
    LabeledEdit2.Text:=frm_data.ClientDataSet2.FieldValues['supply_NO'];
    LabeledEdit3.Text:=frm_data.ClientDataSet2.FieldValues['supply_name'];
end;

end.

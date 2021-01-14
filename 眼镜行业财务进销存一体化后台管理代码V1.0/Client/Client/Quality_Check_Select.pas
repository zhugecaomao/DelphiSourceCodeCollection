unit Quality_Check_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  Tfrm_Quality_Check_Select = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    ComboBox3: TComboBox;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit2: TLabeledEdit;
    Edit77: TLabeledEdit;
    Edit4: TLabeledEdit;
    Edit5: TLabeledEdit;
    Edit7: TLabeledEdit;
    Edit8: TLabeledEdit;
    Edit9: TLabeledEdit;
    Edit3: TLabeledEdit;
    Edit1: TLabeledEdit;
    Edit6: TLabeledEdit;
    Panel5: TPanel;
    Cmd_Close: TSpeedButton;
    Cmd_Add: TSpeedButton;
    Cmd_Check: TSpeedButton;
    procedure Cmd_CheckClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Quality_Check_Select: Tfrm_Quality_Check_Select;

implementation

uses func, Data;

{$R *.dfm}

procedure Tfrm_Quality_Check_Select.Cmd_CheckClick(Sender: TObject);
begin
    if Trim(Edit2.Text)=''then
    begin
        Application.MessageBox('操作失败，请选则【单据编号】请确认！',pchar(application.Title),mb_iconwarning);
        Exit;
    end
    else
    begin
        if ZLXZ_Str='Stock_Enter_001' then
        begin
            ZLXZ_Str_Result:='Stock_Enter_001';
            ZLXZ_Str_List_NO:=Trim(Edit2.Text);
            Close;
        end;
    end;
end;

procedure Tfrm_Quality_Check_Select.FormShow(Sender: TObject);
begin
    with frm_data.ClientDataSet3 do
    begin
        Close;
        CommandText:='';
        CommandText:='SELECT Distinct Copy_Date,Stock_NO,Contract_NO FROM [Quality_Check]';
        Open;
        while not eof do
        begin
            ComboBox1.Items.Add(frm_data.ClientDataSet3.FieldByName('Copy_Date').AsString);
            ComboBox2.Items.Add(frm_data.ClientDataSet3.FieldByName('Stock_NO').AsString);
            ComboBox3.Items.Add(frm_data.ClientDataSet3.FieldByName('Contract_NO').AsString);
            Next;
        end;
    end;
    ComboBox1.ItemIndex:=0;ComboBox2.ItemIndex:=0;ComboBox3.ItemIndex:=0;
    with frm_data.ClientDataSet4 do
    begin
        Close;
        CommandText:='';
        CommandText:='SELECT ID,Copy_Date,Stock_NO,Contract_NO,Gather_Name,Storage_NO,Transactor,Proposer,Condense,Quality_Remark FROM [Quality_Check]';
        Open;
        if frm_data.ClientDataSet4.RecordCount>0 then
        begin
            frm_data.DataSource1.DataSet:=frm_data.ClientDataSet4;
            frm_data.DataSource1.Enabled:=True;
            DBGRid1.DataSource:=frm_data.DataSource1;
            DBGRid1.Columns[0].Title.Caption:='序号';
            DBGRid1.Columns[1].Title.Caption:='录单日期';
            DBGRid1.Columns[2].Title.Caption:='单据编号';
            DBGRid1.Columns[3].Title.Caption:='合同编号';
            DBGRid1.Columns[4].Title.Caption:='供货单位';
            DBGRid1.Columns[5].Title.Caption:='收货仓库';
            DBGRid1.Columns[6].Title.Caption:='经手人';
            DBGRid1.Columns[7].Title.Caption:='制单人';
            DBGRid1.Columns[8].Title.Caption:='摘要';
            DBGRid1.Columns[9].Title.Caption:='说明';
            first;
            Edit1.Text:=ForMatDateTime('yyyy''-''mm''-''dd',frm_data.ClientDataSet4.FieldByName('Copy_Date').AsDateTime);
            Edit2.Text:=frm_data.ClientDataSet4.FieldByName('Stock_NO').AsString;
            Edit3.Text:=frm_data.ClientDataSet4.FieldByName('Contract_NO').AsString;
            Edit4.Text:=frm_data.ClientDataSet4.FieldByName('Gather_Name').AsString;
            Edit5.Text:=frm_data.ClientDataSet4.FieldByName('Storage_NO').AsString;
            Edit6.Text:=frm_data.ClientDataSet4.FieldByName('Transactor').AsString;
            Edit7.Text:=frm_data.ClientDataSet4.FieldByName('Proposer').AsString;
            Edit8.Text:=frm_data.ClientDataSet4.FieldByName('Condense').AsString;
            Edit9.Text:=frm_data.ClientDataSet4.FieldByName('Quality_Remark').AsString;
        end
        else
        begin
            frm_data.DataSource1.Enabled:=False;
        end;
    end;
end;

procedure Tfrm_Quality_Check_Select.DBGrid1CellClick(Column: TColumn);
begin
    Edit1.Text:=ForMatDateTime('yyyy''-''mm''-''dd',frm_data.ClientDataSet4.FieldByName('Copy_Date').AsDateTime);
    Edit2.Text:=frm_data.ClientDataSet4.FieldByName('Stock_NO').AsString;
    Edit3.Text:=frm_data.ClientDataSet4.FieldByName('Contract_NO').AsString;
    Edit4.Text:=frm_data.ClientDataSet4.FieldByName('Gather_Name').AsString;
    Edit5.Text:=frm_data.ClientDataSet4.FieldByName('Storage_NO').AsString;
    Edit6.Text:=frm_data.ClientDataSet4.FieldByName('Transactor').AsString;
    Edit7.Text:=frm_data.ClientDataSet4.FieldByName('Proposer').AsString;
    Edit8.Text:=frm_data.ClientDataSet4.FieldByName('Condense').AsString;
    Edit9.Text:=frm_data.ClientDataSet4.FieldByName('Quality_Remark').AsString;
end;

procedure Tfrm_Quality_Check_Select.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_data.ClientDataSet3.Active:=False;
    frm_data.ClientDataSet3.Close;
    frm_data.ClientDataSet4.Active:=False;
    frm_data.ClientDataSet4.Close;
    Close;
    Action:=Cafree;
end;

end.

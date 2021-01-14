unit Goods_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMenu, ComCtrls, Buttons, StdCtrls, Grids, DBGrids,
  ToolWin;

type
  Tfrm_Goods_Select = class(TForm)
    Panel1: TPanel;
    XPMenu1: TXPMenu;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Edit1: TLabeledEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    Edit2: TLabeledEdit;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    DBGrid3: TDBGrid;
    Edit3: TLabeledEdit;
    TabSheet4: TTabSheet;
    GroupBox5: TGroupBox;
    DBGrid4: TDBGrid;
    Edit4: TLabeledEdit;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    Cmd_Insert: TSpeedButton;
    GroupBox8: TGroupBox;
    Cmd_Cancel: TSpeedButton;
    Cmd_Select: TSpeedButton;
    Edit5: TLabeledEdit;
    Edit6: TLabeledEdit;
    Edit7: TLabeledEdit;
    Edit8: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    procedure Cmd_CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cmd_SelectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Goods_Select: Tfrm_Goods_Select;

implementation

uses func, Data, Thing_Base;

{$R *.dfm}

procedure Tfrm_Goods_Select.Cmd_CancelClick(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_Goods_Select.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_data.ClientDataSet_Add.Active:=False;
    frm_data.ClientDataSet_Add.Close;
    Action:=cafree;
end;

procedure Tfrm_Goods_Select.Cmd_SelectClick(Sender: TObject);
begin
    Subject_No:=''; Subject_Name:='';Subject_Back:='';
    if ((TabSheet1.TabVisible=true) and (Subject_Str='0001')) then
    begin
        Subject_Back:='0001';
        if (Trim(Edit1.Text)='') and (Trim(Edit5.Text)='') then
        begin
            Application.MessageBox('操作失败，没有选择需要的项目，请确认！'+#13#10+'',pchar(application.Title),mb_iconwarning);
            Subject_No:=''; Subject_Name:='';Subject_Back:='';
            Exit;
        end
        else
        begin
            Subject_No:=Trim(Edit5.Text);
            Subject_Name:=Trim(Edit1.Text);
            Subject_Back:='0001';
            Close;
        end;
    end;
    if ((TabSheet2.TabVisible=true) and (Subject_Str='0002')) then
    begin
        Subject_Facility:='';
        Subject_Back:='0002';
        if Trim(Edit6.Text)='' then
        begin
            Application.MessageBox('操作失败，没有选择需要的项目，请确认！'+#13#10+'',pchar(application.Title),mb_iconwarning);
            Subject_No:=''; Subject_Name:='';Subject_Back:='';Subject_Facility:='';
            Exit;
        end
        else
        begin
            Subject_Name:=Trim(Edit2.Text);
            Subject_No:=Trim(Edit6.Text);
            Subject_Facility:=Trim(LabeledEdit1.Text);
            Close;
        end;
    end;
    if ((TabSheet3.TabVisible=true) and (Subject_Str='0003')) then
    begin
        Subject_Back:='0003';
        if Trim(Edit7.Text)='' then
        begin
            Application.MessageBox('操作失败，没有选择需要的项目，请确认！'+#13#10+'',pchar(application.Title),mb_iconwarning);
            Subject_No:=''; Subject_Name:='';Subject_Back:='';Subject_Facility:='';
            Exit;
        end
        else
        begin
            Subject_Name:=Trim(Edit3.Text);
            Subject_No:=Trim(Edit7.Text);
            Close;
        end;
    end;
    if ((TabSheet4.TabVisible=true) and (Subject_Str='0004')) then
    begin
        Subject_Back:='0004';
        if Trim(Edit8.Text)='' then
        begin
            Application.MessageBox('操作失败，没有选择需要的项目，请确认！'+#13#10+'',pchar(application.Title),mb_iconwarning);
            Subject_No:=''; Subject_Name:='';Subject_Back:='';Subject_Facility:='';
            Exit;
        end
        else
        begin
            Subject_Name:=Trim(Edit4.Text);
            Subject_No:=Trim(Edit8.Text);
            Close;
        end;
    end;
end;

procedure Tfrm_Goods_Select.FormShow(Sender: TObject);
begin
    if Subject_Str='0001' then
    begin
        with frm_data.ClientDataSet_Add do
        begin
            Close;
            frm_data.ClientDataSet_Add.CommandText:='';
            frm_data.ClientDataSet_Add.CommandText:='Select * from [Goods_Modal]order by ID';
            Open;
            frm_data.DataSource1.DataSet:=frm_data.ClientDataSet_Add;
            frm_data.DataSource1.Enabled:=False;
            if frm_data.ClientDataSet_Add.RecordCount>0 then
            begin
                frm_data.DataSource1.Enabled:=True;
                DBGRid1.DataSource:=frm_data.DataSource1;
                DBGRid1.Columns[0].Width:=50;
                DBGRid1.Columns[1].Width:=80;
                DBGRid1.Columns[2].Width:=170;
                DBGRid1.Columns[0].Title.caption:='序号';
                DBGRid1.Columns[1].Title.caption:='类别编号';
                DBGRid1.Columns[2].Title.caption:='类别名称';
                first;
                Edit1.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Modal'];
                Edit5.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Modal_NO'];
            end
            else
            begin
                Edit1.Text:='';Edit5.Text:='';
            end;
        end;
    end;
    if Subject_Str='0002' then
    begin
        with frm_data.ClientDataSet_Add do
        begin
            Close;
            frm_data.ClientDataSet_Add.CommandText:='';
            frm_data.ClientDataSet_Add.CommandText:='Select ID,Goods_Cards_NO,Goods_Cards,Factory from [Goods_Cards] where Goods_Modal='''+G_Modal+''' order by ID';
            Open;
            frm_data.DataSource1.DataSet:=frm_data.ClientDataSet_Add;
            frm_data.DataSource1.Enabled:=False;
            if frm_data.ClientDataSet_Add.RecordCount>0 then
            begin
                frm_data.DataSource1.Enabled:=True;
                DBGRid2.DataSource:=frm_data.DataSource1;
                DBGRid2.Columns[0].Width:=50;
                DBGRid2.Columns[1].Width:=60;
                DBGRid2.Columns[2].Width:=100;
                DBGRid2.Columns[3].Width:=110;
                DBGRid2.Columns[0].Title.caption:='序号';
                DBGRid2.Columns[1].Title.caption:='品牌编号';
                DBGRid2.Columns[2].Title.caption:='品牌名称';
                DBGRid2.Columns[3].Title.caption:='生产厂家';
                first;
                Edit2.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Cards'];
                Edit6.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Cards_NO'];
                LabeledEdit1.Text:=frm_data.ClientDataSet_Add.FieldValues['Factory'];
            end
            else
            begin
                Edit2.Text:='';
                Edit6.Text:='';
                LabeledEdit1.Text:='';
            end;
        end;
    end;
    if Subject_Str='0003' then
    begin
        with frm_data.ClientDataSet_Add do
        begin
            Close;
            frm_data.ClientDataSet_Add.CommandText:='';   //G_Modal,G_Cards
            frm_data.ClientDataSet_Add.CommandText:='Select Goods_Modal,Goods_Cards,Goods_brand_NO,Goods_brand from [Goods_Brand]where Goods_Modal='''+G_Modal+''' and Goods_Cards='''+G_Cards+'''';
            Open;
            frm_data.DataSource1.DataSet:=frm_data.ClientDataSet_Add;
            frm_data.DataSource1.Enabled:=False;
            if frm_data.ClientDataSet_Add.RecordCount>0 then
            begin
                frm_data.DataSource1.Enabled:=True;
                DBGRid3.DataSource:=frm_data.DataSource1;
                DBGRid3.Columns[0].Width:=80;
                DBGRid3.Columns[1].Width:=80;
                DBGRid3.Columns[2].Width:=80;
                DBGRid3.Columns[3].Width:=80;
                DBGRid3.DataSource:=frm_data.DataSource1;
                DBGRid3.Columns[0].Title.caption:='商品类别';
                DBGRid3.Columns[1].Title.caption:='商品品牌';
                DBGRid3.Columns[2].Title.caption:='品种编号';
                DBGRid3.Columns[3].Title.caption:='品种名称';
                first;
                LabeledEdit2.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Modal'];
                LabeledEdit3.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Cards'];
                Edit3.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Brand'];
                Edit7.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Brand_NO'];
            end
            else
            begin
                LabeledEdit2.Text:='';LabeledEdit3.Text:='';Edit3.Text:='';Edit7.Text:='';
            end;
        end;
    end;
    if Subject_Str='0004' then
    begin
        with frm_data.ClientDataSet_Add do
        begin
            Close;
            CommandText:='';
            CommandText:='Select ID,Goods_Color_NO,Goods_Color from [Goods_Color]order by ID';
            Open;
            frm_data.DataSource1.DataSet:=frm_data.ClientDataSet_Add;
            frm_data.DataSource1.Enabled:=False;
            if frm_data.ClientDataSet_Add.RecordCount>0 then
            begin
                frm_data.DataSource1.Enabled:=True;
                DBGRid4.DataSource:=frm_data.DataSource1;
                DBGRid4.Columns[0].Width:=50;
                DBGRid4.Columns[1].Width:=80;
                DBGRid4.Columns[2].Width:=170;
                DBGRid4.Columns[0].Title.caption:='序号';
                DBGRid4.Columns[1].Title.caption:='颜色编号';
                DBGRid4.Columns[2].Title.caption:='颜色名称';
                first;
                Edit4.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Color'];
                Edit8.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Color_NO'];
            end
            else
            begin
                Edit4.Text:='';Edit8.Text:='';
            end;
        end;
    end;
end;

procedure Tfrm_Goods_Select.DBGrid1CellClick(Column: TColumn);
begin
    Edit1.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Modal'];
    Edit5.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Modal_NO'];
end;

procedure Tfrm_Goods_Select.DBGrid2CellClick(Column: TColumn);
begin
    Edit2.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Cards'];
    Edit6.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Cards_NO'];
    LabeledEdit1.Text:=frm_data.ClientDataSet_Add.FieldValues['Factory'];
end;

procedure Tfrm_Goods_Select.DBGrid3CellClick(Column: TColumn);
begin
    LabeledEdit2.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Modal'];
    LabeledEdit3.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Cards'];
    Edit3.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Brand'];
    Edit7.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Brand_NO'];
end;

procedure Tfrm_Goods_Select.DBGrid4CellClick(Column: TColumn);
begin
    Edit4.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Color'];
    Edit8.Text:=frm_data.ClientDataSet_Add.FieldValues['Goods_Color_NO'];
end;

procedure Tfrm_Goods_Select.DBGrid1DblClick(Sender: TObject);
begin
    Subject_No:=''; Subject_Name:='';Subject_Back:='';
    if ((TabSheet1.TabVisible=true) and (Subject_Str='0001')) then
    begin
        Subject_Back:='0001';
        if (Trim(Edit1.Text)='') and (Trim(Edit5.Text)='') then
        begin
            Application.MessageBox('操作失败，没有选择需要的项目，请确认！'+#13#10+'',pchar(application.Title),mb_iconwarning);
            Subject_No:=''; Subject_Name:='';Subject_Back:='';
            Exit;
        end
        else
        begin
            Subject_No:=Trim(Edit5.Text);
            Subject_Name:=Trim(Edit1.Text);
            Subject_Back:='0001';
            Close;
        end;
    end;
end;

procedure Tfrm_Goods_Select.DBGrid2DblClick(Sender: TObject);
begin
    Subject_No:=''; Subject_Name:='';Subject_Back:='';
    if ((TabSheet2.TabVisible=true) and (Subject_Str='0002')) then
    begin
        Subject_Facility:='';
        Subject_Back:='0002';
        if Trim(Edit6.Text)='' then
        begin
            Application.MessageBox('操作失败，没有选择需要的项目，请确认！'+#13#10+'',pchar(application.Title),mb_iconwarning);
            Subject_No:=''; Subject_Name:='';Subject_Back:='';Subject_Facility:='';
            Exit;
        end
        else
        begin
            Subject_Name:=Trim(Edit2.Text);
            Subject_No:=Trim(Edit6.Text);
            Subject_Facility:=Trim(LabeledEdit1.Text);
            Close;
        end;
    end;
end;

procedure Tfrm_Goods_Select.DBGrid3DblClick(Sender: TObject);
begin
    Subject_No:=''; Subject_Name:='';Subject_Back:='';
    if ((TabSheet3.TabVisible=true) and (Subject_Str='0003')) then
    begin
        Subject_Back:='0003';
        if Trim(Edit7.Text)='' then
        begin
            Application.MessageBox('操作失败，没有选择需要的项目，请确认！'+#13#10+'',pchar(application.Title),mb_iconwarning);
            Subject_No:=''; Subject_Name:='';Subject_Back:='';Subject_Facility:='';
            Exit;
        end
        else
        begin
            Subject_Name:=Trim(Edit3.Text);
            Subject_No:=Trim(Edit7.Text);
            Close;
        end;
    end;
end;

end.

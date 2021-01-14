unit Company;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ToolWin;

type
  Tfrm_Company = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Edit_Name: TLabeledEdit;
    Edit_NO: TLabeledEdit;
    Edit_address: TLabeledEdit;
    Edit_ZIP: TLabeledEdit;
    Edit_TEL: TLabeledEdit;
    Edit_WWW: TLabeledEdit;
    Edit_Email: TLabeledEdit;
    Edit_Fax: TLabeledEdit;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    TreeView1: TTreeView;
    ToolBar1: TToolBar;
    Cmd_Add: TSpeedButton;
    Cmd_Delete: TSpeedButton;
    Cmd_Edit: TSpeedButton;
    Cmd_Save: TSpeedButton;
    Cmd_Exit: TSpeedButton;
    Cmd_Part: TSpeedButton;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    Edit2: TEdit;
    procedure Cmd_AddClick(Sender: TObject);
    procedure Cmd_ExitClick(Sender: TObject);
    procedure Cmd_SaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Cmd_EditClick(Sender: TObject);
    procedure Cmd_DeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit_NOChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Company: Tfrm_Company;
  ZD:String; //总店定义
implementation

uses Data, func;

{$R *.dfm}

procedure Tfrm_Company.Cmd_AddClick(Sender: TObject);
begin
    Cmd_Add.Enabled:=False;
    Cmd_Edit.Enabled:=False;
    Cmd_Delete.Enabled:=False;
    Cmd_Save.Enabled:=True;
end;

procedure Tfrm_Company.Cmd_ExitClick(Sender: TObject);
begin
    Cmd_Add.Enabled:=True;
    Cmd_Edit.Enabled:=True;
    Cmd_Delete.Enabled:=True;
    Cmd_Save.Enabled:=False;
    //调用存储过程
    with frm_data.ClientDataSet_TMP do
    begin
        frm_data.ClientDataSet_TMP.Active:=True;
        DBGrid1.DataSource:=frm_data.DataSource_TMP;
        if frm_data.ClientDataSet_TMP.RecordCount>0 then
        begin
            frm_data.DataSource_TMP.Enabled:=True;
            DBGrid1.Columns[0].Title.caption:='公司名称';
            DBGrid1.Columns[1].Title.caption:='公司代码';
            DBGrid1.Columns[2].Title.caption:='公司地址';
            DBGrid1.Columns[3].Title.caption:='邮政编码';
            DBGrid1.Columns[4].Title.caption:='联系电话';
            DBGrid1.Columns[5].Title.caption:='传真号码';
            DBGrid1.Columns[6].Title.caption:='公司网址';
            DBGrid1.Columns[7].Title.caption:='电子邮箱';
            DBGrid1.Columns[8].Title.caption:='是否为总店';
            DBGrid1.Columns[9].Title.caption:='停用标志';
        end
        else
        begin
            frm_data.DataSource_TMP.Enabled:=False;
        end;
    end;
end;

procedure Tfrm_Company.Cmd_SaveClick(Sender: TObject);
var
    SqlText:String; //插入语句的定义
    SqlFiled:String;//数据表字段
begin
    SqlText:='';//清空
    SqlFiled:='';
    if Trim(Edit_NO.Text)='' then
    begin
        Application.MessageBox('错误操作！为了便于管理【公司代码】不能为空！请确认！',Pchar(Application.Title),MB_ICONWARNing);
        Edit_NO.SetFocus;
        Exit;
    end;
    if Trim(Edit_Name.Text)='' then
    begin
        Application.MessageBox('错误操作！为了便于管理【公司代码】不能为空！请确认！',Pchar(Application.Title),MB_ICONWARNing);
        Edit_Name.SetFocus;
        Exit;
    end;
    if CheckBox1.Checked=True then
    begin
        ZD:='是';
    end;
    if CheckBox1.Checked=False then
    begin
        ZD:='否';
    end;
    SqlText:='Insert INTO [JB_Company] (Company_Name,Company_NO,Company_address,Company_ZIP,Company_TEL,Company_TAX,Company_WWW,Company_Email,Sign_Flag,Use_Flag) values ('''+Trim(Edit_Name.Text)+''','''+Trim(Edit_NO.Text)+''','''+Trim(Edit_address.Text)+''','''+Trim(Edit_ZIP.Text)+''','''+Trim(Edit_TEL.Text)+''','''+Trim(Edit_Fax.Text)+''','''+Trim(Edit_WWW.Text)+''','''+Trim(Edit_Email.Text)+''','''+Trim(Edit1.Text)+''','''+Trim(Edit2.Text)+''')';
    with frm_data.ClientDataSet_Company do
    begin
        Close;
        CommandText:='';
        CommandText:='SeLect * from [JB_Company] where Company_NO='''+Trim(Edit_No.Text)+''' and Company_Name='''+Trim(Edit_Name.Text)+'''';
        try
            Open;
            if frm_data.ClientDataSet_Company.RecordCount>0 then
            begin
                Application.MessageBox('错误操作！该【公司信息】已经存在，不能重复！请确认！',Pchar(Application.Title),MB_ICONWARNing);
                Exit;
            end
            else //加载数据
            begin
                with frm_data.ClientDataSet_Company do
                begin
                    Close;
                    CommandText:='';
                    CommandText:=SqlText;
                    try
                        Execute;
                        with frm_data.ClientDataSet_Company do
                        begin
                            Close;
                            CommandText:='';
                            CommandText:='Select Company_Name,Company_NO,Company_address,Company_ZIP,Company_TEL,Company_TAX,Company_WWW,Company_Email,Sign_Flag,Use_Flag from [JB_Company]';
                            Try
                                Open;
                                frm_data.DataSource_Company.DataSet:=frm_data.ClientDataSet_Company;
                                frm_data.DataSource_Company.Enabled:=True;
                                DBGrid1.DataSource:=frm_data.DataSource_Company;
                            except;
                                Application.MessageBox('系统错误！系统在刷新【公司信息】数据表时出错！'+#13#10313+'请检查远程服务器连接是否正常？请确认！',Pchar(Application.Title),MB_ICONWARNing);
                                Exit;
                            End;
                        end;
                        Application.MessageBox('恭喜你！【公司信息】保存保存成功！'+#13#10313+'请确认！',Pchar(Application.Title),MB_ICONWARNing);
                    except;
                        Application.MessageBox('系统错误！系统在保存【公司信息】数据表时出错！'+#13#10313+'请检查远程服务器连接是否正常？'+#13#10313+'或你输入的数据格式是否正确？请确认！',Pchar(Application.Title),MB_ICONWARNing);
                        Exit;
                    end;
                end;
            end;
        except
            Application.MessageBox('系统错误！系统在打开【公司信息】数据表时出错！'+#13#10313+'请检查远程服务器连接是否正常？请确认！',Pchar(Application.Title),MB_ICONWARNing);
            Exit;
        end;
   end;
end;

procedure Tfrm_Company.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    frm_data.ClientDataSet_Company.Close;
    frm_data.ClientDataSet_Company.Active:=False;
    frm_data.ClientDataSet_TMP.Active:=False;
    frm_data.ClientDataSet_TMP.Close;
    Action:=Cafree;
end;

procedure Tfrm_Company.DBGrid1CellClick(Column: TColumn);

begin
    Edit_Name.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_Name').AsString;
    Edit_NO.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_NO').AsString;
    Edit_address.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_address').AsString;
    Edit_ZIP.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_ZIP').AsString;
    Edit_TEL.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_TEL').AsString;
    Edit_Fax.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_TAX').AsString;
    Edit_WWW.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_WWW').AsString;
    Edit_Email.Text:=frm_data.ClientDataSet_TMP.FieldByName('Company_Email').AsString;
    Edit1.Text:=frm_data.ClientDataSet_TMP.FieldByName('Sign_Flag').AsString;
    Edit2.Text:=frm_data.ClientDataSet_TMP.FieldByName('Use_Flag').AsString;
end;

procedure Tfrm_Company.CheckBox1Click(Sender: TObject);
begin

    if checkbox1.Checked=True then
    begin
        Edit1.Text:='是';
    end;
    if checkbox1.Checked=False then
    begin
        Edit1.Text:='否';
    end;
end;

procedure Tfrm_Company.CheckBox2Click(Sender: TObject);
begin
    if checkbox2.Checked=false then
    begin
       Edit2.Text:='否';
    end;
    if checkbox2.Checked=True then
    begin
        Edit2.Text:='是';
    end;
end;

procedure Tfrm_Company.Edit1Change(Sender: TObject);
begin
    if Trim(Edit1.Text)='是' then
    begin
        CheckBox1.Checked:=True;
    end;
    if Trim(Edit1.Text)='否' then
    begin
        CheckBox1.Checked:=False;
    end;
end;

procedure Tfrm_Company.Edit2Change(Sender: TObject);
begin
    if Trim(Edit2.Text)='是' then
    begin
        CheckBox2.Checked:=True;
    end;
    if Trim(Edit2.Text)='否' then
    begin
        CheckBox2.Checked:=False;
    end;
end;

procedure Tfrm_Company.Cmd_EditClick(Sender: TObject);
var
    SqlText:String; //插入语句的定义
    SqlFiled:String;//数据表字段
begin
    SqlText:='';//清空
    SqlFiled:='';
    if Trim(Edit_NO.Text)='' then
    begin
        Application.MessageBox('错误操作！为了便于管理【公司代码】不能为空！请确认！',Pchar(Application.Title),MB_ICONWARNing);
        Edit_NO.SetFocus;
        Exit;
    end;
    if Trim(Edit_Name.Text)='' then
    begin
        Application.MessageBox('错误操作！为了便于管理【公司代码】不能为空！请确认！',Pchar(Application.Title),MB_ICONWARNing);
        Edit_Name.SetFocus;
        Exit;
    end;
    if CheckBox1.Checked=True then
    begin
        ZD:='是';
    end;
    if CheckBox1.Checked=False then
    begin
        ZD:='否';
    end;
    if Application.MessageBox('确定需要修改该【公司信息】吗？请确认！',Pchar(Application.Title),MB_okcancel)=Idok then
    begin
        with frm_data.ClientDataSet_Company do
        begin
            Close;
            CommandText:='';
            CommandText:='Update [JB_Company]  set Company_Name='''+Trim(Edit_Name.Text)+''',Company_address='''+Trim(Edit_address.Text)+''',Company_ZIP='''+Trim(Edit_ZIP.Text)+''',Company_TEL='''+Trim(Edit_TEL.Text)+''',Company_TAX='''+Trim(Edit_Fax.Text)+''',Company_WWW='''+Trim(Edit_WWW.Text)+''',Company_Email='''+Trim(Edit_Email.Text)+''',Sign_Flag='''+Trim(Edit1.Text)+''',Use_Flag='''+Trim(Edit2.Text)+''' where Company_NO='''+Trim(Edit_No.Text)+'''';
            try
                Execute;
                Application.MessageBox('恭喜你！【公司信息】保存保存成功！'+#13#10313+'请确认！',Pchar(Application.Title),MB_ICONWARNing);
            except;
                Application.MessageBox('系统错误！系统在保存【公司信息】数据表时出错！'+#13#10313+'请检查远程服务器连接是否正常？'+#13#10313+'或你输入的数据格式是否正确？请确认！',Pchar(Application.Title),MB_ICONWARNing);
                Exit;
            end;
        end;
    end;
end;


procedure Tfrm_Company.Cmd_DeleteClick(Sender: TObject);
var
    SqlText:String; //插入语句的定义
    SqlFiled:String;//数据表字段
begin
    SqlText:='';//清空
    SqlFiled:='';
    if Trim(Edit_NO.Text)='' then
    begin
        Application.MessageBox('错误操作！为了便于管理【公司代码】不能为空！请确认！',Pchar(Application.Title),MB_ICONWARNing);
        Edit_NO.SetFocus;
        Exit;
    end;
    if Trim(Edit_Name.Text)='' then
    begin
        Application.MessageBox('错误操作！为了便于管理【公司代码】不能为空！请确认！',Pchar(Application.Title),MB_ICONWARNing);
        Edit_Name.SetFocus;
        Exit;
    end;
    if CheckBox1.Checked=True then
    begin
        ZD:='是';
    end;
    if CheckBox1.Checked=False then
    begin
        ZD:='否';
    end;
    if Application.MessageBox('确定需要删除该【公司信息】吗？请确认！',Pchar(Application.Title),MB_okcancel)=Idok then
    begin
        with frm_data.ClientDataSet_Company do
        begin
            Close;
            CommandText:='';
            CommandText:='delete [JB_Company] where Company_NO='''+Trim(Edit_No.Text)+'''';
            try
                Execute;
                Application.MessageBox('恭喜你！【公司信息】删除成功！'+#13#10313+'请确认！',Pchar(Application.Title),MB_ICONWARNing);
            except;
                Application.MessageBox('系统错误！系统在删除【公司信息】数据表时出错！'+#13#10313+'请检查远程服务器连接是否正常？'+#13#10313+'或你输入的数据格式是否正确？请确认！',Pchar(Application.Title),MB_ICONWARNing);
                Exit;
            end;
        end;
    end;
end;


procedure Tfrm_Company.FormShow(Sender: TObject);
begin
    with frm_data.ClientDataSet_TMP do
    begin
        frm_data.ClientDataSet_TMP.Active:=True;
        DBGrid1.DataSource:=frm_data.DataSource_TMP;
        if frm_data.ClientDataSet_TMP.RecordCount>0 then
        begin
            frm_data.DataSource_TMP.Enabled:=True;
            DBGrid1.Columns[0].Title.caption:='公司名称';
            DBGrid1.Columns[1].Title.caption:='公司代码';
            DBGrid1.Columns[2].Title.caption:='公司地址';
            DBGrid1.Columns[3].Title.caption:='邮政编码';
            DBGrid1.Columns[4].Title.caption:='联系电话';
            DBGrid1.Columns[5].Title.caption:='传真号码';
            DBGrid1.Columns[6].Title.caption:='公司网址';
            DBGrid1.Columns[7].Title.caption:='电子邮箱';
            DBGrid1.Columns[8].Title.caption:='是否为总店';
            DBGrid1.Columns[9].Title.caption:='停用标志';
        end
        else
        begin
            frm_data.DataSource_TMP.Enabled:=False;
        end;
    end;

end;

procedure Tfrm_Company.Edit_NOChange(Sender: TObject);
begin
    if Trim(Edit_NO.Text)<>'' then
    begin
        Cmd_Part.Enabled:=True;
    end;
    if Trim(Edit_NO.Text)='' then
    begin
        Cmd_Part.Enabled:=False;
    end;
end;

end.

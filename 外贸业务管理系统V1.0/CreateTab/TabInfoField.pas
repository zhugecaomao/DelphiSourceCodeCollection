unit TabInfoField;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  TTabInfoField_frm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    bbsave: TBitBtn;
    bbclose: TBitBtn;
    FieldID: TEdit;
    FieldName: TEdit;
    bbclear: TBitBtn;
    ADOQuery1: TADOQuery;
    Label3: TLabel;
    FieldLength: TEdit;
    Fieldtype: TComboBox;
    DefaultValue: TEdit;
    IfNull: TCheckBox;
    Label5: TLabel;
    boxPrimaryKEY: TCheckBox;
    boxFlag: TCheckBox;
    Label6: TLabel;
    DicFieldID: TEdit;
    DicTab: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    DicFieldName: TEdit;
    boxlistflag: TCheckBox;
    procedure bbsaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FieldtypeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbcloseClick(Sender: TObject);
    procedure bbclearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FieldLengthExit(Sender: TObject);
    procedure DicTabChange(Sender: TObject);
  private
        procedure Query_Ini(id:string);
        procedure initialize();
        procedure SetFieldtype(selstr :string);
  public
    { Public declarations }
    action, TabID:string;
  end;

var
  TabInfoField_frm: TTabInfoField_frm;

implementation

uses DataModule, BasePage, TabInfo;

{$R *.dfm}

procedure TTabInfoField_frm.Query_Ini(id:string);
var sqlstr:string;
begin
  //FieldID, FieldName, Fieldtype, FieldLength, IfNull, DefaultValue
  sqlstr :='select * from TabInfoField where TabID =''' + TabID + ''' and FieldID =''' + id + ''' ';
  with ADOQuery1 do
  begin
       close;
       SQL.Clear;
       SQL.Add(sqlstr);
       try
          Open;
          if RecordCount >0 then
          begin
                FieldID.Text :=fieldbyname('FieldID').AsString;
                FieldName.Text :=fieldbyname('FieldName').AsString;
                Fieldtype.Text :=fieldbyname('Fieldtype').AsString;
                FieldLength.Text :=fieldbyname('FieldLength').AsString;
                if fieldbyname('IfNull').AsString ='1' then
                   IfNull.Checked:=true
                else
                   IfNull.Checked:=false;
                if fieldbyname('PrimaryKEY').AsString ='1' then
                   boxPrimaryKEY.Checked:=true
                else
                   boxPrimaryKEY.Checked:=false;
                if fieldbyname('DisFlag').AsString ='1' then
                   boxFlag.Checked:=true
                else
                   boxFlag.Checked:=false;
                DefaultValue.Text :=fieldbyname('DefaultValue').AsString;
                DicTab.Text :=fieldbyname('DicTab').AsString;
                DicFieldID.Text :=fieldbyname('DicFieldID').AsString;
                DicFieldName.Text :=fieldbyname('DicFieldName').AsString;
          end;
       except

       end;
  end; 
end;

procedure TTabInfoField_frm.initialize();
begin
  bbclear.OnClick(nil);
  SetFieldtype('varchar');
  Fieldtype.OnChange(NIL);
  if action <>'' then 
    Query_Ini(action);
  FillItems1(DicTab, 'TabInfo', 'TabID, TabName', '', ' order by ModuleID', 16);

end;
procedure TTabInfoField_frm.bbsaveClick(Sender: TObject);
var sqlstr, ifnullflay, PrimaryKEY,DisFlag, ListFlag, DicTabstr:string;
    optvar, OrderBy:integer;
begin
  if IfNull.Checked then
    ifnullflay :='1'
  else
    ifnullflay :='0';
    
  if boxPrimaryKEY.Checked then
    PrimaryKEY :='1'
  else
    PrimaryKEY :='0';

  if boxFlag.Checked then
    DisFlag :='1'
  else
    DisFlag :='0';
    
  if boxlistflag.Checked then
    ListFlag :='1'
  else
    ListFlag :='0';
    
  DicTabstr :=get_dm(DicTab.Text);
  with ADOQuery1 do
  begin
    if action ='' then
    begin
       sqlstr :='select * from TabInfoField where TabID=''' + TabID + ''' and FieldID=''' +FieldID.Text+ '''' ;
       if (DoSql_Select(sqlstr) >0) then
       begin
         //if application.MessageBox(pchar('确定要删除"案件名称"为〖' +casename + '〗吗'),'提示信息',mb_yesno+mb_iconinformation)=idno then
         showmessage('此表名已存在');
         exit;
       end;
       sqlstr :='select max(OrderBy) from TabInfoField where TabID=''' + TabID + ''' ' ;
       OrderBy :=GetMaxValue(sqlstr) + 1;
       
       sqlstr :='insert into TabInfoField( TabID, FieldID, FieldName, Fieldtype, FieldLength, IfNull, DefaultValue,PrimaryKEY, DisFlag, OrderBy, DicTab, DicFieldID, DicFieldName, ListFlag) values('''+
                TabID + ''', '''+ FieldID.Text + ''', ''' + FieldName.Text + ''', ''' + Fieldtype.Text + ''', ''' +FieldLength.Text + ''', ''' + ifnullflay + ''', ''' + DefaultValue.Text +
                ''', ''' +PrimaryKEY+ ''', ''' +DisFlag+''', '+ inttostr(OrderBy) +', '''+ DicTabstr + ''', '''+ DicFieldID.Text +''', '''+ DicFieldName.Text + ''', ''' + ListFlag + ''')' ;
       optvar :=DoSql(sqlstr);
       if optvar >0 then
       begin
         TabInfo_frm.Query_Ini(TabID);
         if application.MessageBox(pchar('操作成功, 是否继续'),'提示信息',mb_yesno+mb_iconinformation)=IDYES then
         begin
           FieldID.SetFocus;
         end
         else
           close();
       end
       else
       begin
         showmessage('操作失败');
       end;
    end
    else
    begin
       if action <> trim(FieldID.Text) then
       begin
          sqlstr :='select * from TabInfoField where TabID=''' + TabID + ''' and FieldID=''' + FieldID.Text+ '''' ;
          if (DoSql_Select(sqlstr) >0) then
          begin
            showmessage('此表名已存在');
            exit;
          end;
       end;
       sqlstr :='Update TabInfoField set FieldID=''' + FieldID.Text + ''', FieldName='''+ FieldName.Text + ''', Fieldtype=''' + Fieldtype.Text +
                ''', FieldLength='''+ FieldLength.Text +''', IfNull=''' + ifnullflay + ''', DefaultValue=''' + DefaultValue.Text + ''', PrimaryKEY='''+ PrimaryKEY +
                ''', DisFlag=''' + DisFlag + ''', DicTab=''' + DicTabstr + ''', DicFieldID=''' + DicFieldID.Text + ''', DicFieldName=''' + DicFieldName.Text +
                ''', ListFlag =''' + ListFlag + ''' where TabID=''' +TabID+ ''' and FieldID =''' + action + '''' ;
       optvar :=DoSql(sqlstr);
       //showmessage(sqlstr);
       if optvar >0 then
       begin
          TabInfo_frm.Query_Ini(TabID);
          showmessage('操作成功') ;
          self.close();
       end
       else
       begin
         showmessage('操作失败');
       end;
    end;
  end;
end;

procedure TTabInfoField_frm.SetFieldtype(selstr :string);
begin
   Fieldtype.Items.Clear;
   Fieldtype.Items.Add('char');
   Fieldtype.Items.Add('varchar');
   Fieldtype.Items.Add('byte');
   Fieldtype.Items.Add('smallint');
   Fieldtype.Items.Add('integer');
   Fieldtype.Items.Add('numeric');
   Fieldtype.Items.Add('real');
   Fieldtype.Items.Add('float');
   Fieldtype.Items.Add('decimal');
   Fieldtype.Items.Add('currency');
   Fieldtype.Items.Add('money');
   Fieldtype.Items.Add('memo');
   Fieldtype.Items.Add('text');
   Fieldtype.Items.Add('smalldate');
   Fieldtype.Items.Add('date');
   Fieldtype.Items.Add('datetime');
   if selstr <> '' then
   begin
     Fieldtype.Text :=selstr;
   end;
end;
procedure TTabInfoField_frm.FormCreate(Sender: TObject);
begin
  if action ='' then
    self.Caption :='增加字段'
  else
    self.Caption :='修改字段';

end;

procedure TTabInfoField_frm.FieldtypeChange(Sender: TObject);
begin
  if Fieldtype.Text ='char' then
     FieldLength.Text  :='10'
  else if Fieldtype.Text ='varchar' then
     FieldLength.Text :='50'
  else
     FieldLength.Text :='0';
end;

procedure TTabInfoField_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_F9  : if bbsave.Enabled then  bbsave.Click;
    VK_F4 : if bbclear.Enabled then  bbclear.Click;
    VK_ESCAPE : if bbclose.Enabled then  bbclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TTabInfoField_frm.bbcloseClick(Sender: TObject);
begin
  CLOSE();
end;

procedure TTabInfoField_frm.bbclearClick(Sender: TObject);
begin
  FieldID.Clear;
  FieldName.Clear;
  Fieldtype.Clear;
  FieldLength.Clear;
  IfNull.Checked:=false;
  DefaultValue.Clear;
  DicTab.Text :='';
end;

procedure TTabInfoField_frm.FormShow(Sender: TObject);
begin
  initialize();

end;

procedure TTabInfoField_frm.FieldLengthExit(Sender: TObject);
begin
  if  FieldLength.Text='' then 
    FieldLength.Text :='0';  
end;

procedure TTabInfoField_frm.DicTabChange(Sender: TObject);
var sqlstr:string;
   id:string;
     I:integer;
begin
   id:=get_dm(dictab.Text);
   DicFieldID.Clear;
   DicFieldName.Clear;
  sqlstr :='select * from TabInfoField where TabID =''' + id + ''' order by orderby ';
  with ADOQuery1 do
  begin
       close;
       SQL.Clear;
       SQL.Add(sqlstr);
       try
          Open;
          if RecordCount >0  then 
          begin
             DicFieldID.Text :=fieldbyname('FieldID').AsString;
             next;
             DicFieldName.Text :=fieldbyname('FieldID').AsString;
          end;
       except
       end;
  end;

end;

end.

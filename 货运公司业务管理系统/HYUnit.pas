unit HYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, AAFont, AACtrls, Grids, ComCtrls, DBGrids,
  ExtCtrls, TFlatPanelUnit, StdCtrls, TFlatComboBoxUnit,DB;

type
  THYForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    FlatPanel6: TFlatPanel;
    FlatPanel7: TFlatPanel;
    AALabel34: TAALabel;
    AALabel40: TAALabel;
    AALabel35: TAALabel;
    AALabel42: TAALabel;
    AALabel37: TAALabel;
    AALabel39: TAALabel;
    AALabel38: TAALabel;
    AALabel43: TAALabel;
    AALabel44: TAALabel;
    FlatButton10: TFlatButton;
    FlatButton11: TFlatButton;
    FlatButton12: TFlatButton;
    DBGrid2: TDBGrid;
    FlatPanel8: TFlatPanel;
    FlatPanel9: TFlatPanel;
    AALabel21: TAALabel;
    AALabel29: TAALabel;
    AALabel22: TAALabel;
    AALabel31: TAALabel;
    AALabel25: TAALabel;
    AALabel26: TAALabel;
    AALabel32: TAALabel;
    AALabel27: TAALabel;
    AALabel28: TAALabel;
    FlatButton6: TFlatButton;
    FlatButton7: TFlatButton;
    DBGrid4: TDBGrid;
    Edit12: TEdit;
    DateTimePicker4: TDateTimePicker;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    FlatComboBox7: TFlatComboBox;
    FlatButton20: TFlatButton;
    FlatButton21: TFlatButton;
    FlatButton22: TFlatButton;
    AALabel46: TAALabel;
    FlatComboBox8: TFlatComboBox;
    FlatComboBox9: TFlatComboBox;
    FlatComboBox10: TFlatComboBox;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    FlatComboBox12: TFlatComboBox;
    FlatPanel1: TFlatPanel;
    AALabel20: TAALabel;
    Edit21: TEdit;
    AALabel23: TAALabel;
    Edit23: TEdit;
    AALabel24: TAALabel;
    AALabel30: TAALabel;
    Edit25: TEdit;
    FlatButton1: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton9: TFlatButton;
    FlatComboBox3: TFlatComboBox;
    FlatButton14: TFlatButton;
    FlatButton25: TFlatButton;
    FlatComboBox13: TFlatComboBox;
    FlatPanel10: TFlatPanel;
    FlatButton15: TFlatButton;
    FlatButton16: TFlatButton;
    FlatButton23: TFlatButton;
    FlatButton24: TFlatButton;
    FlatPanel11: TFlatPanel;
    AALabel61: TAALabel;
    AALabel62: TAALabel;
    AALabel63: TAALabel;
    AALabel48: TAALabel;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    DBGrid3: TDBGrid;
    FlatPanel5: TFlatPanel;
    FlatButton3: TFlatButton;
    FlatButton17: TFlatButton;
    FlatButton18: TFlatButton;
    FlatPanel3: TFlatPanel;
    AALabel3: TAALabel;
    AALabel2: TAALabel;
    AALabel4: TAALabel;
    AALabel5: TAALabel;
    AALabel9: TAALabel;
    AALabel7: TAALabel;
    AALabel10: TAALabel;
    AALabel11: TAALabel;
    AALabel13: TAALabel;
    AALabel16: TAALabel;
    AALabel14: TAALabel;
    AALabel18: TAALabel;
    AALabel17: TAALabel;
    AALabel19: TAALabel;
    FlatComboBox1: TFlatComboBox;
    FlatComboBox2: TFlatComboBox;
    FlatComboBox4: TFlatComboBox;
    FlatComboBox5: TFlatComboBox;
    FlatComboBox6: TFlatComboBox;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    FlatComboBox11: TFlatComboBox;
    DBGrid1: TDBGrid;
    AALabel12: TAALabel;
    Edit3: TEdit;
    FlatButton4: TFlatButton;
    FlatButton8: TFlatButton;
    FlatButton13: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton19: TFlatButton;
    FlatButton26: TFlatButton;
    FlatButton27: TFlatButton;
    FlatButton28: TFlatButton;
    FlatButton29: TFlatButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit9: TEdit;
    AALabel1: TAALabel;
    Edit10: TEdit;
    AALabel6: TAALabel;
    Edit11: TEdit;
    AALabel8: TAALabel;
    Edit13: TEdit;
    AALabel15: TAALabel;
    AALabel33: TAALabel;
    AALabel36: TAALabel;
    AALabel41: TAALabel;
    AALabel45: TAALabel;
    AALabel47: TAALabel;
    AALabel49: TAALabel;
    FlatComboBox14: TFlatComboBox;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit20: TEdit;
    Edit22: TEdit;
    Edit24: TEdit;
    Edit31: TEdit;
    AALabel50: TAALabel;
    Edit34: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton18Click(Sender: TObject);
    procedure FlatButton12Click(Sender: TObject);
    procedure FlatButton22Click(Sender: TObject);
    procedure FlatButton16Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FlatButton17Click(Sender: TObject);
    procedure FlatButton20Click(Sender: TObject);
    procedure FlatButton21Click(Sender: TObject);
    procedure FlatButton24Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure FlatButton10Click(Sender: TObject);
    procedure FlatButton11Click(Sender: TObject);
    procedure FlatButton6Click(Sender: TObject);
    procedure FlatButton7Click(Sender: TObject);
    procedure FlatButton15Click(Sender: TObject);
    procedure FlatButton23Click(Sender: TObject);
    procedure FlatButton14Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker2KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox11KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox12KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker4KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox13KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox9KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit26KeyPress(Sender: TObject; var Key: Char);
    procedure Edit27KeyPress(Sender: TObject; var Key: Char);
    procedure Edit28KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit33KeyPress(Sender: TObject; var Key: Char);
    procedure Edit37KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit21KeyPress(Sender: TObject; var Key: Char);
    procedure Edit23KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit25KeyPress(Sender: TObject; var Key: Char);
    procedure FlatButton4Click(Sender: TObject);
    procedure FlatButton26Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton28Click(Sender: TObject);
    procedure FlatButton8Click(Sender: TObject);
    procedure FlatButton13Click(Sender: TObject);
    procedure FlatButton27Click(Sender: TObject);
    procedure FlatButton19Click(Sender: TObject);
    procedure FlatButton29Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit34KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  YEAR,YUE,ww:word;
    { Public declarations }
  end;

var
  HYForm: THYForm;
  gEditFlag:Boolean;
implementation

uses DMUnit, PrintUnit, CallPrint, HYFYUnit, MainUnit, HYFYQueryUnit,
  LYFYQueryUnit, DLFYQueryUnit, OTHQueryUnit;

{$R *.dfm}

procedure THYForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure THYForm.FlatButton18Click(Sender: TObject);
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  PrintFile:=1;
  PrintForm:=TPrintForm.Create(application);
   PrintForm.Show;
end;

procedure THYForm.FlatButton12Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  PrintFile:=2;
  PrintForm:=TPrintForm.Create(application);
   PrintForm.Show;
end;

procedure THYForm.FlatButton22Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  PrintFile:=3;
  PrintForm:=TPrintForm.Create(application);
   PrintForm.Show;
end;

procedure THYForm.FlatButton16Click(Sender: TObject);
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
   PrintFile:=4;
  PrintForm:=TPrintForm.Create(application);
   PrintForm.Show;
end;

procedure THYForm.FormCreate(Sender: TObject);
begin
   decodedate(date,YEAR,YUE,ww);
     with DM.HYFYQuery do
       begin
         Close;
         SQL.Clear;
         SQL.Add('select * from HY_FYXX');
         Open;
       end;

     with DM.HY_XXQuery do
       begin
         CLose;
         SQL.Clear;
         SQL.Add('select * from HY_XX');
         Open;
       end;

   while not DM.HY_XXQuery.Eof do
    begin
      if FlatCOmBoBox5.Items.IndexOf(DM.HY_XXQuery.FieldByName('HY_BEGIN').AsString)=-1 then
        begin
          FlatCOmBoBox5.Items.Add(DM.HY_XXQuery.FieldByName('HY_BEGIN').AsString);
        end;
      if FlatCOmBoBox6.Items.IndexOf(DM.HY_XXQuery.FieldByName('HY_END').AsString)=-1 then
        begin
         FlatCOmBoBox6.Items.Add(DM.HY_XXQuery.FieldByName('HY_END').AsString);
        end;
      if FlatCOmBoBox11.Items.IndexOf(DM.HY_XXQuery.FieldByName('HY_GONGSI').AsString)=-1 then
        begin
         FlatCOmBoBox11.Items.Add(DM.HY_XXQuery.FieldByName('HY_GONGSI').AsString);
        end;
     DM.HY_XXQuery.Next;
    end;

    with DM.SHXXQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from SHXX');
        open;
      end;
    while not DM.SHXXQuery.Eof do
        begin
        FlatComBoBox14.Items.Add(DM.SHXXQuery.FieldByName('SH_NAME').AsString);
        DM.SHXXQuery.Next;
        end;
   If DM.CD_XXQuery.Active=false then
     DM.CD_XXQuery.Active:=true;
  IF DM.CDFYQuery.Active=false then
   DM.CDFYQuery.Active:=true;
  If DM.DLFYQuery.Active=false then
   DM.DLFYQuery.Active:=true;
   if DM.OTHERQuery.Active=false then
     DM.OTHERQuery.Active:=true;
  IF DM.DLFYQuery.Active=false then
   DM.DLFYQuery.Active:=true;
  IF DM.OTHERQuery.Active=false then
   DM.OTHERQuery.Active:=true;
  IF DM.FhxxQuery.Active=false then
   DM.FhxxQuery.Active:=true;
   DM.FhxxQuery.Close;
   DM.FhxxQuery.Open;
   while not DM.FhxxQuery.Eof do
   begin
    FlatComBoBox1.Items.Add(DM.FhxxQuery.FieldByName('FH_GONGSI').AsString);
    DM.FhxxQuery.Next;
   end;
    with DM.LY_XXQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from LY_XX');
        open;
      end;

   while not DM.LY_XXQuery.Eof do
   begin
    if  FlatComBoBox12.Items.IndexOf(DM.LY_XXQuery.FieldByName('LY_MUDI').AsString)=-1 then
      begin
        FlatComBoBox12.Items.Add(DM.LY_XXQuery.FieldByName('LY_MUDI').AsString);
      end;
    DM.LY_XXQuery.Next;
   end;
     with DM.DL_XXQuery do
       begin
         Close;
         SQL.Clear;
         SQL.Add('select * from DL_XX');
         Open;
       end;

    while not DM.DL_XXQuery.Eof do
    begin
      if FlatComBoBox13.Items.IndexOf(DM.DL_XXQuery.FieldByName('DL_GONGSI').AsString)=-1 then
        begin
          FlatComBoBox13.Items.Add(DM.DL_XXQuery.FieldByName('DL_GONGSI').AsString);
        end;
      if FlatComBoBox9.Items.IndexOf(DM.DL_XXQuery.FieldByName('DL_END').AsString)=-1 then
        begin
         FlatComBoBox9.Items.Add(DM.DL_XXQuery.FieldByName('DL_END').AsString);
        end;
      if FlatComBoBox10.Items.IndexOf(DM.DL_XXQuery.FieldByName('DL_MUDI').AsString)=-1 then
        begin
         FlatComBoBox10.Items.Add(DM.DL_XXQuery.FieldByName('DL_MUDI').AsString);
        end;
      DM.DL_XXQuery.Next;
    end;
end;

procedure THYForm.FlatButton17Click(Sender: TObject);
begin
  HYFYQueryForm:=THYFYQueryForm.Create(application);
  HYFYQueryForm.ShowModal;
end;

procedure THYForm.FlatButton20Click(Sender: TObject);
begin
  LYFYQueryForm:=TLYFYQueryForm.Create(application);
  LYFYQueryForm.ShowModal;
end;

procedure THYForm.FlatButton21Click(Sender: TObject);
begin
  DLFYQueryForm:=TDLFYQueryForm.Create(application);
  DLFYQueryForm.ShowModal;
end;

procedure THYForm.FlatButton24Click(Sender: TObject);
begin
  OTHQueryForm:=TOTHQueryForm.Create(application);
  OTHQueryForm.ShowModal;
end;

procedure THYForm.FlatButton1Click(Sender: TObject);
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    Edit21.Color:=clMoneyGreen;
    Edit23.Color:=clMoneyGreen;
    FlatComBoBox3.Color:=clMoneyGreen;
    Edit25.Color:=clMoneyGreen;
     Edit21.Text:='';
     Edit23.Text:='';
     Edit25.Text:='';
     Edit33.Text:='';
     Edit32.Text:='';
     Edit37.Text:='';
     Edit26.Text:='';
     Edit27.Text:='';
     Edit28.Text:='';
     Edit12.Text:='';
     Edit16.Text:='';
     Edit17.Text:='';
     Edit3.Text:='';
     Edit4.Text:='';
     Edit5.Text:='';
     Edit6.Text:='';
     DM.OTHERQuery.Append;
     DM.HYFYQuery.Append;
     DM.CDFYQuery.Append;
     DM.DLFYQuery.Append;
end;

procedure THYForm.FlatButton3Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.HYFYQuery.RecordCount=0 then
    begin
     showmessage('表中无数据,删除失败!');
     Exit;
    end;
    if Application.MessageBox('是否删除数据','系统提示',mb_yesno)=mryes then
      try
      DM.HYFYQuery.Delete;
      except
      showmessage('操作有误,删除失败!');
      end; 
end;

procedure THYForm.FlatButton10Click(Sender: TObject);
begin
  if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.CDFYQuery.RecordCount=0 then
      begin
        Showmessage('海运表中无数据,无法修改!');
        Exit;
      end;
    if DM.HYFYQuery.State=dsBrowse then
      try
       DM.CDFYQuery.Edit;
        Flatcombobox7.Color:=clMoneyGreen;
        Edit12.Color:=clMoneyGreen;
        Edit16.Color:=clMoneyGreen;
        Edit17.Color:=clMoneyGreen;
        DateTimePicker4.Color:=clMoneyGreen;
        Flatcombobox12.Color:=clMoneyGreen;
        Edit9.Color:=clMoneyGreen;
      except
        ShowMessage('操作有误,无法修改!');
      end;
end;

procedure THYForm.FlatButton11Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.CDFYQuery.RecordCount=0 then
    begin
     showmessage('表中无数据,无法删除!');
     Exit;
    end;
  if Application.MessageBox('是否删除数据','系统提示',mb_yesno)=mryes then
    try
     DM.CDFYQuery.Delete;
    except
    showmessage('操作有误,删除失败!');
    end;
end;

procedure THYForm.FlatButton6Click(Sender: TObject);
begin
  if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.DLFYQuery.RecordCount=0 then
      begin
        Showmessage('海运表中无数据,无法修改!');
        Exit;
      end;
    if DM.HYFYQuery.State=dsBrowse then
      try
       DM.DLFYQuery.Edit;
        Flatcombobox9.Color:=clMoneyGreen;
        Flatcombobox13.Color:=clMoneyGreen;
        Flatcombobox8.Color:=clMoneyGreen;
        Flatcombobox10.Color:=clMoneyGreen;
        Edit2.Color:=clMoneyGreen;
        Edit26.Color:=clMoneyGreen;
        Edit27.Color:=clMoneyGreen;
        Edit28.Color:=clMoneyGreen;
        Flatcombobox14.Color:=clMoneyGreen;
      except
        ShowMessage('操作有误,无法修改!');
      end;
end;

procedure THYForm.FlatButton7Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.DLFYQuery.RecordCount=0 then
   begin
    showmessage('表中无数据,删除失败!');
    Exit;
   end;
   if Application.MessageBox('是否删除数据','系统提示',mb_yesno)=mryes then
    try
    DM.DLFYQuery.Delete;
    except
     showmessage('操作有误,删除失败!');
    end;
end;

procedure THYForm.FlatButton15Click(Sender: TObject);
begin
     if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.OTHERQuery.RecordCount=0 then
      begin
        Showmessage('海运表中无数据,无法修改!');
        Exit;
      end;
    if DM.OTHERQuery.State=dsBrowse then
      try
       DM.OTHERQuery.Edit;
        Edit32.Color:=clMoneyGreen;
        Edit33.Color:=clMoneyGreen;
        Edit34.Color:=clMoneyGreen;
        Edit37.Color:=clMoneyGreen;
      except
        ShowMessage('操作有误,无法修改!');
      end;
end;

procedure THYForm.FlatButton23Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.OTHERQuery.RecordCount=0 then
   begin
   showmessage('表中无数据,无法删除!');
   Exit;
   end;
   if Application.MessageBox('是否删除数据!','系统提示',mb_yesno)=mryes then
    try
    DM.OTHERQuery.Delete;
    except
     showmessage('操作有误,删除失败!');
    end;
end;

procedure THYForm.FlatButton14Click(Sender: TObject);
var
 TT:Real;
 HEJI:Real;
 TV,Title,M,N:real;
 DANJIA,Title1,M1:Real; //DL_FYXX var
begin
     if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;

       {**************HY_FYXX***********}
       if (DM.HYFYQuery.State=dsinsert) or (DM.HYFYQuery.State=dsEdit) then
    if (Edit21.Text='') or (Edit23.Text='') or (Edit25.Text='') then
      begin
       ShowMessage('请输入完整数据!');
       Exit;
      end;
      Try
      with DM.BoxFYQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select HY_Price from HY_XX where HY_ORDER = '''+FlatComboBox2.Text+
          ''' and HY_END = '''+FlatComboBox6.Text+''' and HY_BEGIN = '''+FlatComboBox5.Text+
          ''' and HY_GONGSI = '''+FlatComboBox11.Text+''' and HY_BOX = '''+FlatcomboBox3.Text+'''');
        Open;
        TT:=FieldByName('Hy_price').AsCurrency;
        if TT=0 then
         begin
           Showmessage('没有相应的数据,请到海运信息表中录入对应数据!');
           Exit;
         end;
      end;
      DM.HYFYQuery.FieldByName('HY_TD').AsString:=Edit21.Text;
      DM.HYFYQuery.FieldByName('HY_CYNA').AsString:=Edit23.Text;
      DM.HYFYQuery.FieldByName('HY_BOX').AsString:=FlatCOmBoBox3.Text;
      DM.HYFYQuery.FieldByName('HY_NUM').AsString:=Edit25.Text;
      DM.HYFYQuery.FieldByName('HY_FHGS').AsString:=FlatCOmBoBox1.Text;
      DM.HYFYQuery.FieldByName('HY_CYGS').AsString:=FlatCOmBoBox11.Text;
      DM.HYFYQuery.FieldByName('HY_BEGIN').AsString:=FlatCOmBoBox5.Text;
      DM.HYFYQuery.FieldByName('HY_END').AsString:=FlatCOmBoBox6.Text;
      DM.HYFYQuery.FieldByName('HY_KCSJ').AsString:=DatetoStr(DateTimePicker2.Date);
      DM.HYFYQuery.FieldByName('HY_DGSJ').AsString:=DatetoStr(DateTimePicker3.Date);
      DM.HYFYQuery.FieldByName('HY_JSZT').AsString:=FlatCOmBoBox4.Text;
      DM.HYFYQuery.FieldByName('HY_ORDER').AsString:=FlatCOmBoBox2.Text;
      DM.HYFYQuery.FieldByName('HY_MON').AsFloat:=strtofloat(Edit6.Text);
      DM.HYFYQuery.FieldByName('HY_CHF').AsFloat:=strtofloat(Edit5.Text);
      DM.HYFYQuery.FieldByName('HY_TYF').AsFloat:=strtofloat(Edit4.Text);
      DM.HYFYQuery.FieldByName('HY_CNAME').AsString:=Edit3.Text;
      DM.HYFYQuery.FieldByName('HY_JKSJ').AsString:=Edit1.Text;
      Edit7.Text:=Floattostr(TT);
      DM.HYFYQuery.FieldByName('HY_TIT').AsCurrency:=TT * strtoint(Edit25.Text)+StrToFloat(Edit4.Text)+StrToFloat(Edit5.Text)+StrToFloat(Edit6.Text);
      Edit8.Text:=FloatToStr(DM.HYFYQuery.FieldByName('HY_TIT').AsCurrency);
      DM.HYFYQuery.Post;
      except
        ShowMessage('操作有误,保存失败!');
      end;
      {****************CD_FYXX*****************}
       if (DM.CDFYQuery.State=dsinsert) or (DM.CDFYQuery.State=dsEdit) then
    if(Edit12.Text='') or (Edit16.Text='') or (Edit17.Text='') then
      begin
        showmessage('数据不完整,无法保存!');
        Exit;
      end;
    try
      with DM.LYBOXQuery do
      begin
       close;
       sql.Clear;
       sql.Add('select LY_PRICE from LY_XX where LY_BOX='''
       +FlatComBoBox3.Text+''' and LY_MUDI='''
       +FlatComBoBox12.text+'''');
       open;
       TV:=FieldByName('LY_PRICE').AsCurrency;
       if TV=0 then
          begin
            Showmessage('没有相应的数据,请到陆运信息表中录入对应数据!');
            Exit;
          end;
       end;
       if FlatComBoBox3.Text='20' then
         begin
           if Edit25.Text='1' then
             begin
               Title:=TV+strtoFloat(Edit16.Text)+strtofloat(Edit17.Text);
             end;
           if strtoint(Edit25.Text) mod 2=0 then
             begin
               with DM.LYPRCQuery do
                 begin
                   close;
                   sql.clear;
                   sql.add('select LY_PRICE from LY_XX where LY_MUDI='''+FlatComBoBox12.Text+''' and LY_BOX='''+'20X2'+'''');
                   open;
                   M:=fieldByName('LY_PRICE').AsCurrency;
                   if M=0 then
                     begin
                       Showmessage('没有相应的数据,请到陆运信息表中录入对应数据!');
                       Exit;
                     end;
                   end;
               Title:=(strtoint(Edit25.Text)/2)*M+strtoFloat(Edit16.Text)+strtofloat(Edit17.Text);
              end;
            if (Strtoint(Edit25.Text) mod 2<>0) and (strtoint(Edit25.Text)<>1) then
              begin
                with DM.LYPADQuery do
                  begin
                    close;
                    sql.clear;
                    sql.add('select LY_PRICE from LY_XX where LY_MUDI='''+FlatComBoBox12.Text+''' and LY_BOX='''+'20X2'+'''');
                    open;
                    N:=FieldByName('LY_PRICE').AsCurrency;
                    if N=0 then
                      begin
                        Showmessage('没有相应的数据,请到陆运信息表中录入对应数据!');
                        Exit;
                       end;
                   end;
              Title:=TV+(strtoint(Edit25.Text)-1)/2*N+strtoFloat(Edit16.Text)+strtofloat(Edit17.Text);;
              end;
          end;
            if (FlatcomBoBox3.Text='40') or (FlatComBoBOx3.Text='40HC')  then
              begin
                Title:=TV*strtoint(Edit25.Text)+strtofloat(edit16.Text)+strtofloat(edit17.Text);
               end;
     DM.CDFYQuery.FieldByName('CD_ID').AsString:=Edit21.Text;
     DM.CDFYQuery.FieldByName('CD_GSNAME').AsString:=Edit12.Text;
     DM.CDFYQuery.FieldByName('CD_TYADDRESS').AsString:=FlatCOmBoBox12.Text;
     DM.CDFYQuery.FieldByName('CD_TYSJ').AsString:=DatetoStr(DateTimePicker4.Date);
     DM.CDFYQuery.FieldByName('CD_JKZT').AsString:=FlatComBoBox7.Text;
     DM.CDFYQuery.FieldByName('CD_JKSJ').AsString:=Edit9.Text;
     DM.CDFYQuery.FieldByName('CD_MON').AsFloat:=strtoFloat(Edit16.Text);
     DM.CDFYQuery.FieldByName('CD_DFFY').AsFloat:=strtoFloat(Edit17.Text);
     DM.CDFYQuery.FieldByName('CD_PCJ').AsString:=Edit23.Text;
     DM.CDFYQuery.FieldByName('CD_BOX').AsString:=FlatComBoBox3.Text;
     DM.CDFYQuery.FieldByName('CD_NUM').AsString:=Edit25.Text;
     Edit18.Text:=Floattostr(TV);
     Edit19.Text:=Floattostr(Title);
     DM.CDFYQuery.FieldByName('CD_TIT').AsFloat:=strtoFloat(Edit19.Text);
     DM.CDFYQuery.Post;
     except
     showmessage('操作有误,保存失败!');
     end;
      {******************DL_FYXX*****************}
       if (DM.DLFYQuery.State=dsinsert) or (DM.DLFYQuery.State=dsedit) then
    if (Edit26.Text='') or (Edit27.Text='') or (Edit28.Text='') then
       begin
        Showmessage('数据不完整,请输入完整数据!');
        Exit;
        end;
    try
      with DM.LYPADQuery do
        begin
          close;
          sql.Clear;
          sql.Add('select DL_PRICE from DL_XX where DL_GONGSI='''+FlatComBOBox13.text+
          ''' and DL_END='''+FlatComBoBox9.Text+''' and DL_MUDI='''+FlatComBoBox10.Text+''' and DL_BOX='''+FlatComBOBOx3.text+'''');
          open;
          DANJIA:=FieldByName('DL_PRICE').AsCurrency;
          if DANJIA=0 then
            begin
              showmessage('信息表中无此信息请到代理信息表中录入信息!');
              Exit;
            end;
          end;
       if FlatComBoBox3.Text='20' then
         begin
           if Edit25.Text='1' then
             begin
               Title1:=DANJIA;
              end;
           if strtoint(Edit25.Text) mod 2=0 then
             begin
               with DM.DLBoxQuery do
                 begin
                   close;
                   sql.clear;
                   sql.add('select DL_PRICE from DL_XX where DL_MUDI='''
                   +FlatComBoBox10.Text+''' and DL_END='''+FlatCOmBoBox9.Text+
                   ''' and DL_GONGSI='''+FlatComBoBox13.Text+''' and DL_BOX='''+'20X2'+'''');
                   open;
                   M1:=fieldByName('DL_PRICE').AsCurrency;
                   if M1=0 then
                     begin
                       showMessage('信息表中无此信息请到代理信息表中录入信息!');
                       Exit;
                     end;
                 Title1:=(strtoint(Edit25.Text)/2)*M1+strtoFloat(Edit26.Text)+strtoFloat(Edit27.Text)+strtoFloat(Edit28.Text);
                  end;
              end;
           if (strtoint(Edit25.Text) mod 2<> 0) and (strtoint(Edit25.Text)<>1)then
              begin
                with DM.DLPRCQuery do
                  begin
                    Close;
                    Sql.Clear;
                    Sql.Add('select DL_PRICE from DL_XX where DL_MUDI='''+FlatComBoBox10.Text+''' and DL_END='''+FlatCOmBoBox9.Text+''' and DL_GONGSI='''+FlatComBoBox13.Text+''' and DL_BOX='''+'20X2'+'''');
                    Open;
                    M1:=FieldByName('DL_PRICE').AsCurrency;
                    if M1=0 then
                      begin
                        showMessage('信息表中无此信息请到代理信息表中录入信息!');
                        Exit;
                       end;
                   Title1:=DANJIA+(Strtoint(Edit25.Text)-1)/2*M1+strtoFloat(Edit26.Text)+StrtoFloat(Edit27.Text)+StrtoFloat(Edit28.Text);
                   end;
                end;
            end;
      if (FlatcomBoBox3.Text='40') or (FlatComBoBox3.Text='40HC') then
        begin
          Title1:=DANJIA*strtoint(Edit25.Text)+strtofloat(edit26.Text)+strtofloat(edit27.Text)+strtofloat(edit28.Text);
        end;
      DM.DLFYQuery.FieldByName('DL_ID').AsString:=Edit21.Text;
      DM.DLFYQuery.FieldByName('DL_HNAME').AsString:=Edit23.Text;
      DM.DLFYQuery.FieldByName('DL_NUM').AsString:=Edit25.Text;
      DM.DLFYQuery.FieldByName('DL_BOX').AsString:=FlatComBoBox3.Text;
      DM.DLFYQuery.FieldByName('DL_NAME').AsString:=FlatComBoBox13.Text;
      DM.DLFYQuery.FieldByName('DL_END').AsString:=FlatComBoBox9.Text;
      DM.DLFYQuery.FieldByName('DL_MUDI').AsString:=FlatComBoBox10.Text;
      DM.DLFYQuery.FieldByName('DL_MON').AsFloat:=StrtoFloat(Edit26.Text);
      DM.DLFYQuery.FieldByName('DL_ZDF').AsFloat:=strtoFloat(Edit27.Text);
      DM.DLFYQuery.FieldByName('DL_DFFY').AsFloat:=strtoFloat(Edit28.Text);
      DM.DLFYQuery.FieldByName('DL_JKZT').AsString:=FlatComBoBox8.Text;
      DM.DLFYQuery.FieldByName('DL_JKSJ').AsString:=Edit2.Text;
      Edit29.Text:=Floattostr(DANJIA);
      Edit30.Text:=Floattostr(Title1);
      DM.DLFYQuery.FieldByName('DL_TIT').AsFloat:=Title1;
      DM.DLFYQuery.Post;
      except
       showmessage('操作有误保存失败!');
      end;
      {****************OTHER_FYXX***************}
  if (DM.OTHERQuery.State=dsinsert) or (DM.OTHERQuery.State=dsEdit) then
    if(Edit32.Text='') or (Edit37.Text='') or (Edit33.Text='') then
     begin
      showmessage('数据不完整,请输入完整数据!');
      Exit;
     end;
     try
     DM.OTHERQuery.FieldByName('OTHER_ID').AsString:=edit21.Text;
     DM.OTHERQuery.FieldByName('OTHER_HUO').AsString:=Edit23.Text;
     DM.OTHERQuery.FieldByName('OTHER_NUM').AsString:=Edit25.Text;
     DM.OTHERQuery.FieldByName('OTHER_BOX').AsString:=FlatComBoBox3.Text;
     DM.OTHERQuery.FieldByName('OTHER_CHZH').AsString:=Edit33.Text;
     DM.OTHERQuery.FieldByName('OTHER_ZXF').AsFloat:=strtofloat(edit37.Text);
     DM.OTHERQuery.FieldByName('OTHER_DXF').AsFloat:=strtofloat(edit32.Text);
     HEJI:=StrtoFloat(Edit32.Text)+StrtoFloat(Edit37.Text);
     Edit36.Text:=floattostr(HEJI);
     DM.OTHERQuery.FieldByName('OTHER_TIT').AsFloat:=strtofloat(Edit36.Text);
     DM.OTHERQuery.Post;
     except
     showmessage('操作有误,保存失败!');
     end;
     Edit21.Color:=clwindow;
     Edit23.Color:=clwindow;
     Edit25.Color:=clwindow;
     FlatcomBoBox3.Color:=clwindow;
end;

procedure THYForm.DBGrid1CellClick(Column: TColumn);
begin
  if DM.HYFYQuery.Active then
  begin
      Edit21.Text:=DM.HYFYQuery.FieldByName('HY_TD').AsString;
      Edit23.Text:=DM.HYFYQuery.FieldByName('HY_CYNA').AsString;
      FlatCOmBoBox3.ItemIndex:=FlatCOmBoBox3.Items.IndexOf(DM.HYFYQuery.FieldByName('HY_BOX').AsString);
      Edit25.Text:=inttostr(DM.HYFYQuery.FieldByName('HY_NUM').AsInteger);
      FlatCOmBoBox1.ItemIndex:=FlatCOmBoBox1.Items.IndexOf(DM.HYFYQuery.FieldByName('HY_FHGS').AsString);
      FlatCOmBoBox11.ItemIndex:=FlatCOmBoBox11.Items.Add(DM.HYFYQuery.FieldByName('HY_CYGS').AsString);
      Flatcombobox5.ItemIndex:=Flatcombobox5.Items.Add(DM.HYFYQuery.FieldByName('HY_BEGIN').AsString);
      FlatCOmBoBox6.ItemIndex:=FlatCOmBoBox6.Items.Add(DM.HYFYQuery.FieldByName('HY_END').AsString);
      DateTimePicker2.Date:=strtoDate(DM.HYFYQuery.FieldByName('HY_KCSJ').AsString);
      DateTimePicker3.Date:=strtoDate(DM.HYFYQuery.FieldByName('HY_DGSJ').AsString);
      FlatCOmBoBox4.ItemIndex:=FlatCOmBoBox4.Items.Add(DM.HYFYQuery.FieldByName('HY_JSZT').AsString);
      FlatCOmBoBox2.ItemIndex:=FlatCOmBoBox2.Items.Add(DM.HYFYQuery.FieldByName('HY_ORDER').AsString);
      Edit6.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_MON').AsFloat);
      Edit5.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_CHF').AsFloat);
      Edit4.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_TYF').AsFloat);
      Edit3.Text:=DM.HYFYQuery.FieldByName('HY_CNAME').AsString;
     Edit1.Text:=DM.HYFYQuery.FieldByName('HY_JKSJ').AsString;
      Edit8.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_TIT').AsCurrency);
     Edit10.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_HYZF').AsCurrency);
  end;
end;

procedure THYForm.FormShow(Sender: TObject);
begin
  DM.HY_XXQuery.Close;
  DM.HY_XXQuery.SQL.Clear;
  DM.HY_XXQuery.SQL.Add('select * from HY_XX');
  DM.HY_XXQuery.Open;
  DM.HYFYQuery.Close;
  DM.HYFYQuery.SQL.Clear;
  DM.HYFYQuery.SQL.Add('select * from HY_FYXX');
  DM.HYFYQuery.Open;
  DM.CD_XXQuery.Close;
  DM.CD_XXQuery.SQL.Clear;
  DM.CD_XXQuery.SQL.Add('select * from CD_XX');
  Dm.CD_XXQuery.Open;
  DM.CDFYQuery.Close;
  DM.CDFYQuery.SQL.Clear;
  DM.CDFYQuery.SQL.Add('select * from CD_FYXX');
  DM.CDFYQuery.Open;
  DM.DL_XXQuery.Close;
  DM.DL_XXQuery.SQL.Clear;
  DM.DL_XXQuery.SQL.Add('select * from DL_XX');
  DM.DL_XXQuery.Open;
  DM.DLFYQuery.Close;
  DM.DLFYQuery.SQL.Clear;
  DM.DLFYQuery.SQL.Add('select * from DL_FYXX');
  DM.DLFYQuery.Open;
  DM.OTHERQuery.Close;
  DM.OTHERQuery.SQL.Clear;
  DM.OTHERQuery.SQL.Add('select * from OTHER_FYXX');
  DM.OTHERQuery.Open;
  DM.FhxxQuery.Close;
  DM.FhxxQuery.SQL.Clear;
  DM.FhxxQuery.SQL.Add('select *from FHXX');
  DM.FhxxQuery.Open;
end;

procedure THYForm.FlatButton5Click(Sender: TObject);
begin
     if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.HYFYQuery.RecordCount=0 then
      begin
        Showmessage('海运表中无数据,无法修改!');
        Exit;
      end;
    if DM.HYFYQuery.State=dsBrowse then
       DM.HYFYQuery.Edit;
    if DM.CDFYQuery.RecordCount=0 then
      begin
        showmessage('陆运表中无数据,无法修改!');
        Exit;
      end;
    if DM.CDFYQuery.State=dsbrowse then
      DM.CDFYQuery.Edit;
    if DM.DLFYQuery.RecordCount=0 then
       begin
         showmessage('代理表中无数据,无法修改!');
         Exit;
      end;
    if DM.DLFYQuery.State=dsbrowse then
      DM.DLFYQuery.Edit;
    if DM.OTHERQuery.RecordCount=0 then
      begin
        showmessage('其它费用表中无数据,无法修改!');
        Exit;
      end;
    if DM.OTHERQuery.State=dsbrowse then
     DM.OTHERQuery.Edit;
end;

procedure THYForm.FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Flatcombobox2.SetFocus;
end;

procedure THYForm.DateTimePicker2KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
  Flatcombobox11.SetFocus;
end;

procedure THYForm.FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Datetimepicker2.SetFocus;
end;

procedure THYForm.FlatComboBox11KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  Flatcombobox5.SetFocus;
end;

procedure THYForm.FlatComboBox5KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
  Flatcombobox6.SetFocus;
end;

procedure THYForm.FlatComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
  Flatcombobox4.SetFocus;
end;

procedure THYForm.FlatComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
  Datetimepicker3.SetFocus;
end;

procedure THYForm.DateTimePicker3KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   Edit1.SetFocus;
end;

procedure THYForm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
  Edit5.SetFocus;
end;

procedure THYForm.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
     Edit6.SetFocus;
end;

procedure THYForm.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
 Flatcombobox12.SetFocus;
end;

procedure THYForm.FlatComboBox12KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  Datetimepicker4.SetFocus;
end;

procedure THYForm.DateTimePicker4KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Flatcombobox7.SetFocus;
end;

procedure THYForm.FlatComboBox7KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
 Edit9.SetFocus;
end;

procedure THYForm.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
     Edit17.SetFocus;
end;

procedure THYForm.FlatComboBox13KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
  flatcombobox9.SetFocus;
end;

procedure THYForm.FlatComboBox9KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
  flatcombobox10.SetFocus;
end;

procedure THYForm.FlatComboBox10KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
      Edit26.SetFocus;
end;

procedure THYForm.Edit26KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
      Edit27.SetFocus;
end;

procedure THYForm.Edit27KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
     Edit28.SetFocus;
end;

procedure THYForm.Edit28KeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
  Flatcombobox8.SetFocus;
end;

procedure THYForm.FlatComboBox8KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Edit2.SetFocus;
end;

procedure THYForm.Edit33KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
     Edit37.SetFocus;
end;

procedure THYForm.Edit37KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
     Edit32.SetFocus;
end;

procedure THYForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      Edit21.Text:=DM.HYFYQuery.FieldByName('HY_TD').AsString;
      Edit23.Text:=DM.HYFYQuery.FieldByName('HY_CYNA').AsString;
      FlatCOmBoBox3.ItemIndex:=FlatCOmBoBox3.Items.IndexOf(DM.HYFYQuery.FieldByName('HY_BOX').AsString);
      Edit25.Text:=inttostr(DM.HYFYQuery.FieldByName('HY_NUM').AsInteger);
      FlatCOmBoBox1.ItemIndex:=FlatCOmBoBox1.Items.IndexOf(DM.HYFYQuery.FieldByName('HY_FHGS').AsString);
      FlatCOmBoBox11.ItemIndex:=FlatCOmBoBox11.Items.Add(DM.HYFYQuery.FieldByName('HY_CYGS').AsString);
      Flatcombobox5.ItemIndex:=Flatcombobox5.Items.Add(DM.HYFYQuery.FieldByName('HY_BEGIN').AsString);
      FlatCOmBoBox6.ItemIndex:=FlatCOmBoBox6.Items.Add(DM.HYFYQuery.FieldByName('HY_END').AsString);
      DateTimePicker2.Date:=strtoDate(DM.HYFYQuery.FieldByName('HY_KCSJ').AsString);
      DateTimePicker3.Date:=strtoDate(DM.HYFYQuery.FieldByName('HY_DGSJ').AsString);
      FlatCOmBoBox4.ItemIndex:=FlatCOmBoBox4.Items.Add(DM.HYFYQuery.FieldByName('HY_JSZT').AsString);
      FlatCOmBoBox2.ItemIndex:=FlatCOmBoBox2.Items.Add(DM.HYFYQuery.FieldByName('HY_ORDER').AsString);
      Edit6.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_MON').AsFloat);
      Edit5.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_CHF').AsFloat);
      Edit4.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_TYF').AsFloat);
      Edit3.Text:=DM.HYFYQuery.FieldByName('HY_CNAME').AsString;
      Edit1.Text:=DM.HYFYQuery.FieldByName('HY_JKSJ').AsString;
      Edit8.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_TIT').AsCurrency);
      Edit10.Text:=Floattostr(DM.HYFYQuery.FieldByName('HY_HYZF').AsCurrency);
end;

procedure THYForm.DBGrid2CellClick(Column: TColumn);
begin
     Edit21.Text:=DM.CDFYQuery.FieldByName('CD_ID').AsString;
     Edit12.Text:=DM.CDFYQuery.FieldByName('CD_GSNAME').AsString;
     Edit3.Text:=DM.CDFYQuery.FieldByName('CD_CHAN').AsString;
     FlatCOmBoBox12.ItemIndex:=FlatCOmBoBox12.Items.IndexOf(DM.CDFYQuery.FieldByName('CD_TYADDRESS').AsString);
     DateTimePicker4.Date:=strtodate(DM.CDFYQuery.FieldByName('CD_TYSJ').AsString);
     FlatComBoBox7.ItemIndex:=FlatComBoBox7.Items.IndexOf(DM.CDFYQuery.FieldByName('CD_JKZT').AsString);
     Edit9.Text:=DM.CDFYQuery.FieldByName('CD_JKSJ').AsString;
     Edit16.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_MON').AsFloat);
     Edit17.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_DFFY').AsFloat);
     Edit23.Text:=DM.CDFYQuery.FieldByName('CD_PCJ').AsString;
     FlatComBoBox3.ItemIndex:=FlatComBoBox3.Items.IndexOf(DM.CDFYQuery.FieldByName('CD_BOX').AsString);
     Edit25.Text:=inttostr(DM.CDFYQuery.FieldByName('CD_NUM').AsInteger);
     Edit19.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_TIT').AsFloat);
     Edit13.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_LYZF').AsFloat);
end;

procedure THYForm.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Edit21.Text:=DM.CDFYQuery.FieldByName('CD_ID').AsString;
     Edit12.Text:=DM.CDFYQuery.FieldByName('CD_GSNAME').AsString;
     Edit3.Text:=DM.CDFYQuery.FieldByName('CD_CHAN').AsString;
     FlatCOmBoBox12.ItemIndex:=FlatCOmBoBox12.Items.IndexOf(DM.CDFYQuery.FieldByName('CD_TYADDRESS').AsString);
     DateTimePicker4.Date:=strtodate(DM.CDFYQuery.FieldByName('CD_TYSJ').AsString);
     FlatComBoBox7.ItemIndex:=FlatComBoBox7.Items.IndexOf(DM.CDFYQuery.FieldByName('CD_JKZT').AsString);
     Edit9.Text:=DM.CDFYQuery.FieldByName('CD_JKSJ').AsString;
     Edit16.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_MON').AsFloat);
     Edit17.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_DFFY').AsFloat);
     Edit23.Text:=DM.CDFYQuery.FieldByName('CD_PCJ').AsString;
     FlatComBoBox3.ItemIndex:=FlatComBoBox3.Items.IndexOf(DM.CDFYQuery.FieldByName('CD_BOX').AsString);
     Edit25.Text:=inttostr(DM.CDFYQuery.FieldByName('CD_NUM').AsInteger);
     Edit19.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_TIT').AsFloat);
     Edit13.Text:=Floattostr(DM.CDFYQuery.FieldByName('CD_LYZF').AsFloat);
end;

procedure THYForm.DBGrid4CellClick(Column: TColumn);
begin
      Edit21.Text:=DM.DLFYQuery.FieldByName('DL_ID').AsString;
      Edit23.Text:=DM.DLFYQuery.FieldByName('DL_HNAME').AsString;
      Edit25.Text:=inttostr(DM.DLFYQuery.FieldByName('DL_NUM').AsInteger);
      Edit3.Text:=DM.DLFYQuery.FieldByName('DL_CHAN').AsString;
      FlatComBoBox3.ItemIndex:=FlatComBoBox3.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_BOX').AsString);
      FlatComBoBox13.ItemIndex:=FlatComBoBox13.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_NAME').AsString);
      FlatComBoBox14.ItemIndex:=FlatComBoBox14.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_NAME1').AsString);
      FlatComBoBox9.ItemIndex:=FlatComBoBox9.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_END').AsString);
      FlatComBoBox10.ItemIndex:=FlatComBoBox10.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_MUDI').AsString);
      Edit26.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_MON').AsFloat);
      Edit27.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_ZDF').AsFloat);
      Edit28.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_DFFY').AsFloat);
      FlatComBoBox8.ItemIndex:=FlatComBoBox8.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_JKZT').AsString);
      Edit2.Text:=DM.DLFYQuery.FieldByName('DL_JKSJ').AsString;
      Edit30.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_TIT').AsFloat);
      Edit11.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_DLZF').AsFloat);
end;

procedure THYForm.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      Edit21.Text:=DM.DLFYQuery.FieldByName('DL_ID').AsString;
      Edit23.Text:=DM.DLFYQuery.FieldByName('DL_HNAME').AsString;
      Edit25.Text:=inttostr(DM.DLFYQuery.FieldByName('DL_NUM').AsInteger);
      Edit3.Text:=DM.DLFYQuery.FieldByName('DL_CHAN').AsString;
      FlatComBoBox3.ItemIndex:=FlatComBoBox3.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_BOX').AsString);
      FlatComBoBox13.ItemIndex:=FlatComBoBox13.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_NAME').AsString);
      FlatComBoBox14.ItemIndex:=FlatComBoBox14.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_NAME1').AsString);
      FlatComBoBox9.ItemIndex:=FlatComBoBox9.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_END').AsString);
      FlatComBoBox10.ItemIndex:=FlatComBoBox10.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_MUDI').AsString);
      Edit26.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_MON').AsFloat);
      Edit27.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_ZDF').AsFloat);
      Edit28.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_DFFY').AsFloat);
      FlatComBoBox8.ItemIndex:=FlatComBoBox8.Items.IndexOf(DM.DLFYQuery.FieldByName('DL_JKZT').AsString);
      Edit2.Text:=DM.DLFYQuery.FieldByName('DL_JKSJ').AsString;
      Edit30.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_TIT').AsFloat);
      Edit11.Text:=Floattostr(DM.DLFYQuery.FieldByName('DL_DLZF').AsFloat);
end;

procedure THYForm.DBGrid3CellClick(Column: TColumn);
begin
     Edit21.Text:=DM.OTHERQuery.FieldByName('OTHER_ID').AsString;
     Edit34.Text:=DM.OTHERQuery.FieldByName('OTHER_DANWEI').AsString;
     Edit23.Text:=DM.OTHERQuery.FieldByName('OTHER_HUO').AsString;
     Edit25.Text:=inttostr(DM.OTHERQuery.FieldByName('OTHER_NUM').AsInteger);
     Edit3.Text:=DM.OTHERQuery.FieldByName('OTHER_CHAN').AsString;
     FlatComBoBox3.ItemIndex:=FlatComBoBox3.Items.IndexOf(DM.OTHERQuery.FieldByName('OTHER_BOX').AsString);
     Edit33.Text:=DM.OTHERQuery.FieldByName('OTHER_CHZH').AsString;
     edit37.Text:=Floattostr(DM.OTHERQuery.FieldByName('OTHER_ZXF').AsFloat);
     edit32.Text:=Floattostr(DM.OTHERQuery.FieldByName('OTHER_DXF').AsFloat);
     Edit36.Text:=Floattostr(DM.OTHERQuery.FieldByName('OTHER_TIT').AsFloat);
end;

procedure THYForm.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Edit21.Text:=DM.OTHERQuery.FieldByName('OTHER_ID').AsString;
     Edit34.Text:=DM.OTHERQuery.FieldByName('OTHER_DANWEI').AsString;
     Edit23.Text:=DM.OTHERQuery.FieldByName('OTHER_HUO').AsString;
     Edit25.Text:=inttostr(DM.OTHERQuery.FieldByName('OTHER_NUM').AsInteger);
     Edit3.Text:=DM.OTHERQuery.FieldByName('OTHER_CHAN').AsString;
     FlatComBoBox3.ItemIndex:=FlatComBoBox3.Items.IndexOf(DM.OTHERQuery.FieldByName('OTHER_BOX').AsString);
     Edit33.Text:=DM.OTHERQuery.FieldByName('OTHER_CHZH').AsString;
     edit37.Text:=Floattostr(DM.OTHERQuery.FieldByName('OTHER_ZXF').AsFloat);
     edit32.Text:=Floattostr(DM.OTHERQuery.FieldByName('OTHER_DXF').AsFloat);
     Edit36.Text:=Floattostr(DM.OTHERQuery.FieldByName('OTHER_TIT').AsFloat);
end;

procedure THYForm.Edit21KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   Edit23.SetFocus;
end;

procedure THYForm.Edit23KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   Flatcombobox3.SetFocus;
end;

procedure THYForm.FlatComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   Edit25.SetFocus;
end;

procedure THYForm.Edit25KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  Edit3.SetFocus;

end;

procedure THYForm.FlatButton4Click(Sender: TObject);
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    Edit21.Color:=clMoneyGreen;
    Edit23.Color:=clMoneyGreen;
    FlatComBoBox3.Color:=clMoneyGreen;
    Edit25.Color:=clMoneyGreen;
    Edit3.Color:=clMoneyGreen;
    if DM.HYFYQuery.State=dsBrowse then
      try
       Flatcombobox1.Text:='';
       Flatcombobox2.Text:='';
       Flatcombobox4.Text:='';
       Flatcombobox5.Text:='';
       Flatcombobox6.Text:='';
       Flatcombobox11.Text:='';
       Edit4.Text:='';
       Edit5.Text:='';
       Edit6.Text:='';
       Flatcombobox1.Color:=clMoneyGreen;
       Flatcombobox2.Color:=clMoneyGreen;
       Flatcombobox4.Color:=clMoneyGreen;
       Flatcombobox5.Color:=clMoneygreen;
       Flatcombobox6.Color:=clMoneyGreen;
       Flatcombobox11.Color:=clMoneyGreen;
       Edit4.Color:=clMoneyGreen;
       Edit5.Color:=clMoneyGreen;
       Edit6.Color:=clMoneyGreen;
       Edit1.Color:=clMoneyGreen;
       DateTimePicker2.Color:=clMoneyGreen;
       DateTimePicker3.Color:=clMoneyGreen;
       DM.HYFYQuery.Append;
      except
        showmessage('操作有误,添加失败!');
      end;
end;

procedure THYForm.FlatButton26Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.CDFYQuery.State=dsBrowse then
      try
        Edit12.Text:='';
        Edit16.Text:='';
        Edit17.Text:='';
        Flatcombobox7.Text:='';
        Flatcombobox7.Color:=clMoneyGreen;
        Edit12.Color:=clMoneyGreen;
        Edit16.Color:=clMoneyGreen;
        Edit17.Color:=clMoneyGreen;
        DateTimePicker4.Color:=clMoneyGreen;
        Flatcombobox12.Color:=clMoneyGreen;
        Edit9.Color:=clMoneyGreen;
        DM.CDFYQuery.Append;
      except
        Showmessage('操作有误,添加失败!');
      end;
end;

procedure THYForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.DLFYQuery.State=dsBrowse then
      try
        Edit26.Text:='';
        Edit27.Text:='';
        Edit28.Text:='';
        Flatcombobox8.Text:='';
        Flatcombobox9.Text:='';
        Flatcombobox10.Text:='';
        Flatcombobox13.Text:='';
        Flatcombobox14.Text:='';
        Flatcombobox9.Color:=clMoneyGreen;
        Flatcombobox13.Color:=clMoneyGreen;
        Flatcombobox8.Color:=clMoneyGreen;
        Flatcombobox10.Color:=clMoneyGreen;
        Edit2.Color:=clMoneyGreen;
        Edit26.Color:=clMoneyGreen;
        Edit27.Color:=clMoneyGreen;
        Edit28.Color:=clMoneyGreen;
        FlatcomBoBox14.Color:=clMoneyGreen;
        DM.DLFYQuery.Append;
      except
        Showmessage('操作有误,添加失败!');
      end;
end;

procedure THYForm.FlatButton28Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.OTHERQuery.State=dsBrowse then
      try
        Edit33.Text:='';
        Edit32.Text:='';
        Edit37.Text:='';
        Edit32.Color:=clMoneyGreen;
        Edit33.Color:=clMoneyGreen;
        Edit34.Color:=clMoneyGreen;
        Edit37.Color:=clMoneyGreen;
        DM.OTHERQuery.Append;
      except
        Showmessage('操作有误,添加失败!');
      end;
end;

procedure THYForm.FlatButton8Click(Sender: TObject);
begin
     if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if DM.HYFYQuery.RecordCount=0 then
      begin
        Showmessage('海运表中无数据,无法修改!');
        Exit;
      end;
    if DM.HYFYQuery.State=dsBrowse then
      try
       DM.HYFYQuery.Edit;
       Flatcombobox1.Color:=clMoneyGreen;
       Flatcombobox2.Color:=clMoneyGreen;
       Flatcombobox4.Color:=clMoneyGreen;
       Flatcombobox5.Color:=clMoneygreen;
       Flatcombobox6.Color:=clMoneyGreen;
       Flatcombobox11.Color:=clMoneyGreen;
       Edit4.Color:=clMoneyGreen;
       Edit5.Color:=clMoneyGreen;
       Edit6.Color:=clMoneyGreen;
       Edit1.Color:=clMoneyGreen;
       DateTimePicker2.Color:=clMoneyGreen;
       DateTimePicker3.Color:=clMoneyGreen;
      except
        ShowMessage('操作有误,无法修改!');
      end;
end;

procedure THYForm.FlatButton13Click(Sender: TObject);
var
 TT,qqq:Real;
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;

       {**************HY_FYXX***********}
       if (DM.HYFYQuery.State=dsinsert) or (DM.HYFYQuery.State=dsEdit) then
    if (Edit21.Text='') or (Edit23.Text='') or (Edit25.Text='') then
      begin
       ShowMessage('请输入完整数据!');
       Exit;
      end;
      Try
      with DM.BoxFYQuery do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select HY_Price from HY_XX where HY_ORDER = '''+FlatComboBox2.Text+
          ''' and HY_END = '''+FlatComboBox6.Text+''' and HY_BEGIN = '''+FlatComboBox5.Text+
          ''' and HY_GONGSI = '''+FlatComboBox11.Text+''' and HY_BOX = '''+FlatcomboBox3.Text+'''');
        Open;
        TT:=FieldByName('Hy_price').AsCurrency;
        if TT=0 then
         begin
           Showmessage('没有相应的数据,请到海运信息表中录入对应数据!');
           Exit;
         end;
      end;
      DM.HYFYQuery.FieldByName('HY_TD').AsString:=Edit21.Text;
      DM.HYFYQuery.FieldByName('HY_CYNA').AsString:=Edit23.Text;
      DM.HYFYQuery.FieldByName('HY_BOX').AsString:=FlatCOmBoBox3.Text;
      DM.HYFYQuery.FieldByName('HY_NUM').AsInteger:=strtoint(Edit25.Text);
      DM.HYFYQuery.FieldByName('HY_FHGS').AsString:=FlatCOmBoBox1.Text;
      DM.HYFYQuery.FieldByName('HY_CYGS').AsString:=FlatCOmBoBox11.Text;
      DM.HYFYQuery.FieldByName('HY_BEGIN').AsString:=FlatCOmBoBox5.Text;
      DM.HYFYQuery.FieldByName('HY_END').AsString:=FlatCOmBoBox6.Text;
      DM.HYFYQuery.FieldByName('HY_KCSJ').AsString:=DatetoStr(DateTimePicker2.Date);
      DM.HYFYQuery.FieldByName('HY_DGSJ').AsString:=DatetoStr(DateTimePicker3.Date);
      DM.HYFYQuery.FieldByName('HY_JSZT').AsString:=FlatCOmBoBox4.Text;
      DM.HYFYQuery.FieldByName('HY_ORDER').AsString:=FlatCOmBoBox2.Text;
      DM.HYFYQuery.FieldByName('HY_MON').AsFloat:=strtofloat(Edit6.Text);
      DM.HYFYQuery.FieldByName('HY_CHF').AsFloat:=strtofloat(Edit5.Text);
      DM.HYFYQuery.FieldByName('HY_TYF').AsFloat:=strtofloat(Edit4.Text);
      DM.HYFYQuery.FieldByName('HY_CNAME').AsString:=Edit3.Text;
      DM.HYFYQuery.FieldByName('HY_YUE').AsString:=inttostr(YUE);
      if Edit1.Text='' then
        DM.HYFYQuery.FieldByName('HY_JKSJ').AsString:=' '
        else
          DM.HYFYQuery.FieldByName('HY_JKSJ').AsString:=Edit1.Text;
      Edit7.Text:=Floattostr(TT);
      DM.HYFYQuery.FieldByName('HY_TIT').AsCurrency:=TT * strtoint(Edit25.Text)+StrToFloat(Edit4.Text)+StrToFloat(Edit5.Text)+StrToFloat(Edit6.Text);
      qqq:=TT * strtoint(Edit25.Text);
      Edit8.Text:=FloatToStr(DM.HYFYQuery.FieldByName('HY_TIT').AsCurrency);
      DM.HYFYQuery.FieldByName('HY_HYZF').AsFloat:=qqq;
      Edit10.Text:=Floattostr(qqq);
      DM.HYFYQuery.Post;
       Flatcombobox1.Color:=clwindow;
       Flatcombobox2.Color:=clwindow;
       Flatcombobox4.Color:=clwindow;
       Flatcombobox5.Color:=clwindow;
       Flatcombobox6.Color:=clwindow;
       Flatcombobox11.Color:=clwindow;
       Edit4.Color:=clwindow;
       Edit5.Color:=clwindow;
       Edit6.Color:=clwindow;
       Edit1.Color:=clwindow;
       DateTimePicker2.Color:=clwindow;
       DateTimePicker3.Color:=clwindow;
      except
        ShowMessage('操作有误,保存失败!');
      end;
end;

procedure THYForm.FlatButton27Click(Sender: TObject);
var
TV,Title,M,N,jj:real;
begin
     if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
    if (DM.CDFYQuery.State=dsinsert) or (DM.CDFYQuery.State=dsEdit) then
    if(Edit12.Text='') or (Edit16.Text='') or (Edit17.Text='') then
      begin
        showmessage('数据不完整,无法保存!');
        Exit;
      end;
    try
      with DM.LYBOXQuery do
      begin
       close;
       sql.Clear;
       sql.Add('select LY_PRICE from LY_XX where LY_BOX='''
       +FlatComBoBox3.Text+''' and LY_MUDI='''
       +FlatComBoBox12.text+'''');
       open;
       TV:=FieldByName('LY_PRICE').AsCurrency;
       if TV=0 then
          begin
            Showmessage('没有相应的数据,请到陆运信息表中录入对应数据!');
            Exit;
          end;
       end;
       if FlatComBoBox3.Text='20' then
         begin
           if Edit25.Text='1' then
             begin
               Title:=TV+strtoFloat(Edit16.Text)+strtofloat(Edit17.Text);
               jj:=TV;
             end;
           if strtoint(Edit25.Text) mod 2=0 then
             begin
               with DM.LYPRCQuery do
                 begin
                   close;
                   sql.clear;
                   sql.add('select LY_PRICE from LY_XX where LY_MUDI='''+FlatComBoBox12.Text+''' and LY_BOX='''+'20X2'+'''');
                   open;
                   M:=fieldByName('LY_PRICE').AsCurrency;
                   if M=0 then
                     begin
                       Showmessage('没有相应的数据,请到陆运信息表中录入对应数据!');
                       Exit;
                     end;
                   end;
               Title:=(strtoint(Edit25.Text)/2)*M+strtoFloat(Edit16.Text)+strtofloat(Edit17.Text);
               jj:=(strtoint(Edit25.Text)/2)*M;
              end;
            if (Strtoint(Edit25.Text) mod 2<>0) and (strtoint(Edit25.Text)<>1) then
              begin
                with DM.LYPADQuery do
                  begin
                    close;
                    sql.clear;
                    sql.add('select LY_PRICE from LY_XX where LY_MUDI='''+FlatComBoBox12.Text+''' and LY_BOX='''+'20X2'+'''');
                    open;
                    N:=FieldByName('LY_PRICE').AsCurrency;
                    if N=0 then
                      begin
                        Showmessage('没有相应的数据,请到陆运信息表中录入对应数据!');
                        Exit;
                       end;
                   end;
              Title:=TV+(strtoint(Edit25.Text)-1)/2*N+strtoFloat(Edit16.Text)+strtofloat(Edit17.Text);
              jj:=TV+(strtoint(Edit25.Text)-1)/2*N;
              end;
          end;
            if (FlatcomBoBox3.Text='40') or (FlatComBoBOx3.Text='40HC')  then
              begin
                Title:=TV*strtoint(Edit25.Text)+strtofloat(edit16.Text)+strtofloat(edit17.Text);
                jj:=TV*strtoint(Edit25.Text);
               end;
     DM.CDFYQuery.FieldByName('CD_ID').AsString:=Edit21.Text;
     DM.CDFYQuery.FieldByName('CD_GSNAME').AsString:=Edit12.Text;
     DM.CDFYQuery.FieldByName('CD_CHAN').AsString:=Edit3.Text;
     DM.CDFYQuery.FieldByName('CD_TYADDRESS').AsString:=FlatCOmBoBox12.Text;
     DM.CDFYQuery.FieldByName('CD_TYSJ').AsString:=DatetoStr(DateTimePicker4.Date);
     DM.CDFYQuery.FieldByName('CD_JKZT').AsString:=FlatComBoBox7.Text;
     if Edit9.Text='' then
        DM.CDFYQuery.FieldByName('CD_JKSJ').AsString:=' '
        else
        DM.CDFYQuery.FieldByName('CD_JKSJ').AsString:=Edit9.Text;
     DM.CDFYQuery.FieldByName('CD_MON').AsFloat:=strtoFloat(Edit16.Text);
     DM.CDFYQuery.FieldByName('CD_DFFY').AsFloat:=strtoFloat(Edit17.Text);
     DM.CDFYQuery.FieldByName('CD_PCJ').AsString:=Edit23.Text;
     DM.CDFYQuery.FieldByName('CD_BOX').AsString:=FlatComBoBox3.Text;
     DM.CDFYQuery.FieldByName('CD_NUM').AsInteger:=strtoint(Edit25.Text);
     DM.CDFYQuery.FieldByName('CD_YUE').AsString:=inttostr(YUE);
     Edit18.Text:=Floattostr(TV);
     Edit19.Text:=Floattostr(Title);
     DM.CDFYQuery.FieldByName('CD_TIT').AsFloat:=strtoFloat(Edit19.Text);
     Edit13.Text:=Floattostr(jj);
     DM.CDFYQuery.FieldByName('CD_LYZF').AsFloat:=strtofloat(Edit13.Text);
     DM.CDFYQuery.Post;
        Flatcombobox7.Color:=clWindow;
        Edit12.Color:=clWindow;
        Edit16.Color:=clWindow;
        Edit17.Color:=clWindow;
        DateTimePicker4.Color:=clWindow;
        Flatcombobox12.Color:=clWindow;
        Edit9.Color:=clWindow;
     except
     showmessage('操作有误,保存失败!');
     end;
end;

procedure THYForm.FlatButton19Click(Sender: TObject);
var
 DANJIA,Title1,M1,ss:Real; //DL_FYXX var
 X1,X2,X3,X4,X5,X6,X7:String;
begin
     if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
      end;
    if (DM.DLFYQuery.State=dsinsert) or (DM.DLFYQuery.State=dsedit) then
    if (Edit26.Text='') or (Edit27.Text='') or (Edit28.Text='') then
      begin
        Showmessage('数据不完整,请输入完整数据!');
        Exit;
        end;
    try
      with DM.ADOQuery5 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select * from SHXX  where SH_NAME='''+FlatComboBox14.text+'''');
          Open;
          X1:=FieldByName('SH_GONGSI').asstring;
          X2:=FieldByName('SH_NAME').asstring;
          X3:=FieldByName('SH_PHONE').asstring;
          X4:=FieldByName('SH_CHZH').asstring;
          X5:=FieldByName('SH_CALL').asstring;
          X6:=FieldByName('SH_ADDRESS').asstring;
          X7:=FieldByName('SH_YOUBIAN').asstring;
        end;
      with DM.LYPADQuery do
        begin
          close;
          sql.Clear;
          sql.Add('select DL_PRICE from DL_XX where DL_GONGSI='''+FlatComBOBox13.text+
          ''' and DL_END='''+FlatComBoBox9.Text+''' and DL_MUDI='''+FlatComBoBox10.Text+''' and DL_BOX='''+FlatComBOBOx3.text+'''');
          open;
          DANJIA:=FieldByName('DL_PRICE').AsCurrency;
          if DANJIA=0 then
            begin
              showmessage('信息表中无此信息请到代理信息表中录入信息!');
              Exit;
            end;
          end;
       if FlatComBoBox3.Text='20' then
         begin
           if Edit25.Text='1' then
             begin
               Title1:=DANJIA+strtoFloat(Edit26.Text)+strtoFloat(Edit27.Text)+strtoFloat(Edit28.text);
               SS:=DANJIA;
              end;
           if strtoint(Edit25.Text) mod 2=0 then
             begin
               with DM.DLBoxQuery do
                 begin
                   close;
                   sql.clear;
                   sql.add('select DL_PRICE from DL_XX where DL_MUDI='''
                   +FlatComBoBox10.Text+''' and DL_END='''+FlatCOmBoBox9.Text+
                   ''' and DL_GONGSI='''+FlatComBoBox13.Text+''' and DL_BOX='''+'20X2'+'''');
                   open;
                   M1:=fieldByName('DL_PRICE').AsCurrency;
                   if M1=0 then
                     begin
                       showMessage('信息表中无此信息请到代理信息表中录入信息!');
                       Exit;
                     end;
                 Title1:=(strtoint(Edit25.Text)/2)*M1+strtoFloat(Edit26.Text)+strtoFloat(Edit27.Text)+strtoFloat(Edit28.Text);
                 ss:=(strtoint(Edit25.Text)/2)*M1;
                  end;
              end;
           if (strtoint(Edit25.Text) mod 2<> 0) and (strtoint(Edit25.Text)<>1)then
              begin
                with DM.DLPRCQuery do
                  begin
                    Close;
                    Sql.Clear;
                    Sql.Add('select DL_PRICE from DL_XX where DL_MUDI='''+FlatComBoBox10.Text+''' and DL_END='''+FlatCOmBoBox9.Text+''' and DL_GONGSI='''+FlatComBoBox13.Text+''' and DL_BOX='''+'20X2'+'''');
                    Open;
                    M1:=FieldByName('DL_PRICE').AsCurrency;
                    if M1=0 then
                      begin
                        showMessage('信息表中无此信息请到代理信息表中录入信息!');
                        Exit;
                       end;
                   Title1:=DANJIA+(Strtoint(Edit25.Text)-1)/2*M1+strtoFloat(Edit26.Text)+StrtoFloat(Edit27.Text)+StrtoFloat(Edit28.Text);
                   ss:=DANJIA+(Strtoint(Edit25.Text)-1)/2*M1;
                   end;
                end;
            end;
      if (FlatcomBoBox3.Text='40') or (FlatComBoBox3.Text='40HC') then
        begin
          Title1:=DANJIA*strtoint(Edit25.Text)+strtofloat(edit26.Text)+strtofloat(edit27.Text)+strtofloat(edit28.Text);
          ss:=DANJIA*strtoint(Edit25.Text);
        end;
       Edit14.Text:=X1;
       Edit15.Text:=X3;
       Edit20.Text:=X4;
       Edit22.Text:=X6;
       Edit24.Text:=X5;
       Edit31.Text:=X7;
       DM.DLFYQuery.FieldByName('DL_GONGSI').AsString:=X1;
       DM.DLFYQuery.FieldByName('DL_NAME1').AsString:=FlatcomBoBox14.text;
       DM.DLFYQuery.FieldByName('DL_PHONE').AsString:=X3;
       DM.DLFYQuery.FieldByName('DL_CHZH').AsString:=X4;
       DM.DLFYQuery.FieldByName('DL_CALL').AsString:=X5;
       DM.DLFYQuery.FieldByName('DL_ADDRESS').AsString:=X6;
       DM.DLFYQuery.FieldByName('DL_YOUBIAN').AsString:=X7;
      DM.DLFYQuery.FieldByName('DL_ID').AsString:=Edit21.Text;
      DM.DLFYQuery.FieldByName('DL_HNAME').AsString:=Edit23.Text;
      DM.DLFYQuery.FieldByName('DL_NUM').AsInteger:=strtoint(Edit25.Text);
      DM.DLFYQuery.FieldByName('DL_CHAN').AsString:=Edit3.Text;
      DM.DLFYQuery.FieldByName('DL_BOX').AsString:=FlatComBoBox3.Text;
      DM.DLFYQuery.FieldByName('DL_NAME').AsString:=FlatComBoBox13.Text;
      DM.DLFYQuery.FieldByName('DL_END').AsString:=FlatComBoBox9.Text;
      DM.DLFYQuery.FieldByName('DL_MUDI').AsString:=FlatComBoBox10.Text;
      DM.DLFYQuery.FieldByName('DL_MON').AsFloat:=StrtoFloat(Edit26.Text);
      DM.DLFYQuery.FieldByName('DL_ZDF').AsFloat:=strtoFloat(Edit27.Text);
      DM.DLFYQuery.FieldByName('DL_DFFY').AsFloat:=strtoFloat(Edit28.Text);
      DM.DLFYQuery.FieldByName('DL_JKZT').AsString:=FlatComBoBox8.Text;
       DM.DLFYQuery.FieldByName('DL_YUE').AsString:=inttostr(YUE);
      if Edit2.Text='' then
        DM.DLFYQuery.FieldByName('DL_JKSJ').AsString:=' '
      else
        DM.DLFYQuery.FieldByName('DL_JKSJ').AsString:=Edit2.Text;
      Edit29.Text:=Floattostr(DANJIA);
      Edit30.Text:=Floattostr(Title1);
      DM.DLFYQuery.FieldByName('DL_TIT').AsFloat:=Title1;
      Edit11.Text:=Floattostr(ss);
      DM.DLFYQuery.FieldByName('DL_DLZF').AsFloat:=ss;
      DM.DLFYQuery.Post;
        Flatcombobox9.Color:=clWindow;
        Flatcombobox13.Color:=clWindow;
        Flatcombobox8.Color:=clWindow;
        Flatcombobox10.Color:=clWindow;
        Edit2.Color:=clWindow;
        Edit26.Color:=clWindow;
        Edit27.Color:=clWindow;
        Edit28.Color:=clWindow;
        FlatcomBoBox14.color:=clWindow;
      except
       showmessage('操作有误保存失败!');
      end;
end;

procedure THYForm.FlatButton29Click(Sender: TObject);
var
  HEJI:Real;
begin
     if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
      end;
   if (DM.OTHERQuery.State=dsinsert) or (DM.OTHERQuery.State=dsEdit) then
    if(Edit32.Text='') or (Edit37.Text='') or (Edit33.Text='') then
     begin
      showmessage('数据不完整,请输入完整数据!');
      Exit;
     end;
     try
     DM.OTHERQuery.FieldByName('OTHER_ID').AsString:=Edit21.Text;
     IF Edit34.Text=trim('') then
       DM.OTHERQuery.FieldByName('OTHER_DANWEI').AsString:=''
     Else
     DM.OTHERQuery.FieldByName('OTHER_DANWEI').AsString:=Edit34.Text;
     DM.OTHERQuery.FieldByName('OTHER_HUO').AsString:=Edit23.Text;
     DM.OTHERQuery.FieldByName('OTHER_NUM').AsInteger:=strtoint(Edit25.Text);
     DM.OTHERQuery.FieldByName('OTHER_CHAN').AsString:=Edit3.Text;
     DM.OTHERQuery.FieldByName('OTHER_BOX').AsString:=FlatComBoBox3.Text;
     DM.OTHERQuery.FieldByName('OTHER_CHZH').AsString:=Edit33.Text;
     DM.OTHERQuery.FieldByName('OTHER_YUE').AsString:=inttostr(YUE);
     DM.OTHERQuery.FieldByName('OTHER_ZXF').AsFloat:=strtofloat(edit37.Text);
     DM.OTHERQuery.FieldByName('OTHER_DXF').AsFloat:=strtofloat(edit32.Text);
     HEJI:=StrtoFloat(Edit32.Text)+StrtoFloat(Edit37.Text);
     Edit36.Text:=floattostr(HEJI);
     DM.OTHERQuery.FieldByName('OTHER_TIT').AsFloat:=strtofloat(Edit36.Text);
     DM.OTHERQuery.Post;
     Edit32.Color:=clwindow;
     Edit33.Color:=clwindow;
     Edit34.Color:=clWindow;
     Edit37.Color:=clwindow;
     except
     showmessage('操作有误,保存失败!');
     end;
end;

procedure THYForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  Edit4.SetFocus;
end;

procedure THYForm.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
   Edit16.SetFocus;
end;

procedure THYForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Flatcombobox14.SetFocus;
end;

procedure THYForm.Edit34KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Edit33.SetFocus;
end;

end.

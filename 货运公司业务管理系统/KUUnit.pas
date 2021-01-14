unit KUUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, Grids, DBGrids, StdCtrls, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit,DB, ComCtrls, TFlatComboBoxUnit;

type
  TKHForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    AALabel3: TAALabel;
    AALabel4: TAALabel;
    AALabel5: TAALabel;
    AALabel6: TAALabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    DBGrid1: TDBGrid;
    FlatPanel2: TFlatPanel;
    FlatButton2: TFlatButton;
    FlatButton1: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    FlatComboBox1: TFlatComboBox;
    AALabel7: TAALabel;
    AALabel8: TAALabel;
    AALabel9: TAALabel;
    AALabel10: TAALabel;
    FlatComboBox2: TFlatComboBox;
    FlatComboBox3: TFlatComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    FlatComboBox4: TFlatComboBox;
    FlatButton7: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure FlatButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FlatButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KHForm: TKHForm;

implementation

uses DMUnit, KHQUERYUnit, CDUnit, MainUnit, PrintUnit;

{$R *.dfm}

procedure TKHForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TKHForm.FormCreate(Sender: TObject);
begin
  with DM.CD_XXQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from CD_XX');
      Open;
    end;
//  if DM.CD_XXQuery.Active=false then
  //  DM.CD_XXQuery.Active:=true;
    DM.YWYQuery.Close;
    DM.YWYQuery.SQL.Clear;
    DM.YWYQuery.SQL.Add('select * from YWY_XX');
    DM.YWYQuery.Open;
      //else
   while not DM.YWYQuery.Eof do
    begin
     FlatComBoBox2.Items.Add(DM.YWYQuery.FieldByName('YWYNAME').AsString);
     DM.YWYQuery.Next;
    end;
   //if DM.FhxxQuery.Active=false then
     //DM.FhxxQuery.Active:=true;
       with DM.FhxxQuery do
         begin
           Close;
           SQL.Clear;
           SQL.Add('select * from FHXX');
           Open;
           end;
     while not DM.FhxxQuery.Eof do
     begin
       FlatComBoBox4.Items.Add(DM.FhxxQuery.FieldByName('FH_GONGSI').AsString);
       DM.FhxxQuery.Next;
     end;
end;

procedure TKHForm.FormShow(Sender: TObject);
begin
  DM.CD_XXQuery.Close;
  DM.CD_XXQuery.SQL.Clear;
  DM.CD_XXQuery.SQL.Add('select * from CD_XX');
  DM.CD_XXQuery.Open;
end;

procedure TKHForm.FlatButton1Click(Sender: TObject);
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
   if DM.YWYQuery.RecordCount=0 then
     begin
       showmessage('请先从业务员表中录入基本信息!');
     end;
  if DM.CD_XXQuery.State=dsBrowse then
  begin
   Edit1.Color:=clMoneyGreen;
   FlatComBoBox4.Color:=ClMoneyGreen;
   Edit3.Color:=ClMoneyGreen;
   Edit4.Color:=ClMoneyGreen;
   //Edit5.Color:=ClMoneyGreen;
   FlatComBOBox1.Color:=clMoneyGreen;
   FlatComBoBox2.Color:=clMoneyGreen;
   FlatComBoBox3.Color:=clMoneyGreen;
   DateTimePicker1.Color:=clMoneyGreen;
   DateTimePicker2.Color:=clMoneyGreen;
   Edit6.Color:=ClMoneyGreen;
   DM.CD_XXQuery.Append;
   Edit1.SetFocus;
  end;
end;

procedure TKHForm.FlatButton4Click(Sender: TObject);
begin
  if (DM.CD_XXQuery.State=dsinsert) or (DM.CD_XXQuery.State=dsEdit) then
    begin
      try
        DM.CD_XXQuery.FieldByName('CD_ID').AsString:=Edit1.Text;
        DM.CD_XXQuery.FieldByName('CD_NAME').AsString:=FlatComBoBox4.Text;
        DM.CD_XXQuery.FieldByName('CD_BEGIN').AsString:=Edit3.Text;
        DM.CD_XXQuery.FieldByName('CD_ADDRESS').AsString:=Edit4.Text;
        DM.CD_XXQuery.FieldByName('CD_BOX').AsString:=FlatCOmBoBox1.Text;
        DM.CD_XXQuery.FieldByName('CD_YWY').AsString:=FlatCOmBoBox2.Text;
        DM.CD_XXQuery.FieldByName('CD_TYTK').AsString:=FlatCOmBoBox3.Text;
        DM.CD_XXQuery.FieldByName('CD_PRICE').AsFloat:=strtoFloat(Edit6.Text);
        DM.CD_XXQuery.FieldByName('CD_DJSJ').AsString:=Datetostr(DateTimePicker1.DateTime);
        DM.CD_XXQuery.FieldByName('CD_YXSJ').AsString:=DatetoStr(DateTimePicker2.DateTime);
        DM.CD_XXQuery.Post;
        Edit1.Color:=ClWindow;
        FlatComBoBox4.Color:=ClWindow;
        Edit3.Color:=ClWindow;
        Edit4.Color:=clWindow;
        Edit6.Color:=Clwindow;
        FlatComBoBox1.Color:=Clwindow;
        FlatCOmBoBox2.Color:=Clwindow;
        FlatComBoBOx3.Color:=Clwindow;
        DateTimePicker1.Color:=Clwindow;
        DateTimePicker2.Color:=Clwindow;
        Edit1.Text:='';
        Edit3.Text:='';
        Edit4.Text:='';
        Edit6.Text:='';
      except
       ShowMessage('操作有误,保存记录失败!');
      end;
    end;
end;

procedure TKHForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.CD_XXQuery.RecordCount=0 then
    begin
     ShowMessage('表中无记录,无法修改!');
     Exit;
    end;
  if DM.CD_XXQuery.State=dsbrowse then
    begin
      Edit1.Color:=clMoneyGreen;
      FlatComBoBox4.Color:=clMoneyGreen;
      Edit3.Color:=clMoneyGreen;
      Edit4.Color:=clMoneyGreen;
      FlatComBOBox1.Color:=clMoneyGreen;
      FlatComBoBox2.Color:=clMoneyGreen;
      FlatComBoBox3.Color:=clMoneyGreen;
      DateTimePicker1.Color:=clMoneyGreen;
      DateTimePicker2.Color:=clMoneyGreen;
      Edit6.Color:=clMoneyGreen;
      DM.CD_XXQuery.Edit;
      Edit1.SetFocus;
    end;
end;

procedure TKHForm.FlatButton3Click(Sender: TObject);
begin
    if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.CD_XXQuery.RecordCount=0 then
   begin
    ShowMessage('表中无记录,无法删除!');
    Exit;
   end;
   if Application.MessageBox('是否删除记录!','系统提示',mb_yesno)=mryes then
    try
     DM.CD_XXQuery.Delete;
     Edit1.Text:='';
     Edit3.Text:='';
     Edit4.Text:='';
     Edit6.Text:='';
    except
     ShowMessage('操作有误,删除失败!');
    end;
end;

procedure TKHForm.FlatButton5Click(Sender: TObject);
begin
    KUQUERYForm:=TKUQUERYForm.Create(Self);
    KUQUERYForm.ShowModal;
end;

procedure TKHForm.FlatButton6Click(Sender: TObject);
begin
 Close;
end;

procedure TKHForm.DBGrid1CellClick(Column: TColumn);
begin
   Edit1.Text:=DM.CD_XXQuery.FieldByName('CD_ID').AsString;
   Edit3.Text:=DM.CD_XXQuery.FieldByName('CD_BEGIN').AsString;
   Edit4.Text:=DM.CD_XXQuery.FieldByName('CD_ADDRESS').AsString;
   Flatcombobox4.ItemIndex:=Flatcombobox4.Items.IndexOf(DM.CD_XXQuery.FieldByName('CD_NAME').AsString);
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='20' then
     FlatCOmBoBox1.ItemIndex:=0;
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='40' then
     FlatCOmBoBox1.ItemIndex:=1;
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='40HC' then
     FlatCOmBoBox1.ItemIndex:=2;
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='20X2' then
     FlatCOmBoBox1.ItemIndex:=3;
   Flatcombobox2.ItemIndex:=Flatcombobox2.Items.IndexOf(DM.CD_XXQuery.FieldByName('CD_YWY').AsString);
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='CFS-D' then
     FlatCOmBoBox3.ItemIndex:=0;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='CFS-CY' then
     FlatCOmBoBox3.ItemIndex:=1;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='CFS-CFS' then
     FlatCOmBoBox3.ItemIndex:=2;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='D-D' then
     FlatCOmBoBox3.ItemIndex:=3;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='D-CFS' then
     FlatCOmBoBox3.ItemIndex:=4;
   Edit6.Text:=Floattostr(DM.CD_XXQuery.FieldByName('CD_PRICE').AsFloat);
   DateTimePicker1.DateTime:=strtoDate(DM.CD_XXQuery.FieldByName('CD_DJSJ').AsString);
   DateTimePicker2.DateTime:=StrtoDate(DM.CD_XXQuery.FieldByName('CD_YXSJ').AsString);
end;

procedure TKHForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Edit1.Text:=DM.CD_XXQuery.FieldByName('CD_ID').AsString;
   //Edit2.Text:=DM.CD_XXQuery.FieldByName('CD_NAME').AsString;
   Edit3.Text:=DM.CD_XXQuery.FieldByName('CD_BEGIN').AsString;
   Edit4.Text:=DM.CD_XXQuery.FieldByName('CD_ADDRESS').AsString;
    Flatcombobox4.ItemIndex:=Flatcombobox4.Items.IndexOf(DM.CD_XXQuery.FieldByName('CD_NAME').AsString);
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='20' then
     FlatCOmBoBox1.ItemIndex:=0;
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='40' then
     FlatCOmBoBox1.ItemIndex:=1;
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='40HC' then
     FlatCOmBoBox1.ItemIndex:=2;
   if DM.CD_XXQuery.FieldByName('CD_BOX').AsString='20X2' then
     FlatCOmBoBox1.ItemIndex:=3;
   DM.CD_XXQuery.FieldByName('CD_YWY').AsString:=FlatCOmBoBox2.Text;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='CFS-D' then
     FlatCOmBoBox3.ItemIndex:=0;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='CFS-CY' then
     FlatCOmBoBox3.ItemIndex:=1;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='CFS-CFS' then
     FlatCOmBoBox3.ItemIndex:=2;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='D-D' then
     FlatCOmBoBox3.ItemIndex:=3;
   if DM.CD_XXQuery.FieldByName('CD_TYTK').AsString='D-CFS' then
     FlatCOmBoBox3.ItemIndex:=4;
   Edit6.Text:=Floattostr(DM.CD_XXQuery.FieldByName('CD_PRICE').AsFloat);
   DateTimePicker1.DateTime:=strtoDate(DM.CD_XXQuery.FieldByName('CD_DJSJ').AsString);
   DateTimePicker2.DateTime:=StrtoDate(DM.CD_XXQuery.FieldByName('CD_YXSJ').AsString);
end;

procedure TKHForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  FlatComBoBOx4.SetFocus;
end;

procedure TKHForm.FlatComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
     Edit4.SetFocus;
end;

procedure TKHForm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
     Edit3.SetFocus;
end;

procedure TKHForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  FlatComBoBox3.SetFocus;
end;

procedure TKHForm.FlatComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
 DatetimePicker1.SetFocus;
 end;

procedure TKHForm.DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Flatcombobox2.SetFocus;
end;

procedure TKHForm.FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Flatcombobox1.SetFocus;
end;

procedure TKHForm.FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  Edit6.SetFocus;
end;

procedure TKHForm.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  DateTimePicker2.SetFocus;
end;

procedure TKHForm.FlatButton7Click(Sender: TObject);
begin
  PrintFile:=13;
  PrintForm:=TPrintForm.Create(application);
  PrintForm.Show;
end;

end.


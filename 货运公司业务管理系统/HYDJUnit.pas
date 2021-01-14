unit HYDJUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TFlatButtonUnit, StdCtrls, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit,DB, TFlatComboBoxUnit;

type
  THYDJForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    AALabel3: TAALabel;
    AALabel4: TAALabel;
    AALabel5: TAALabel;
    AALabel6: TAALabel;
    AALabel7: TAALabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    DBGrid1: TDBGrid;
    FlatComboBox1: TFlatComboBox;
    FlatPanel2: TFlatPanel;
    FlatButton2: TFlatButton;
    FlatButton1: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    FlatComboBox2: TFlatComboBox;
    FlatButton7: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure FlatButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FlatButton5Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure FlatButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HYDJForm: THYDJForm;

implementation

uses DMUnit, HYDJQUERYUnit, MainUnit, PrintUnit;

{$R *.dfm}

procedure THYDJForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=CaFree;
end;

procedure THYDJForm.FormCreate(Sender: TObject);
begin
  with DM.HY_XXQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from HY_XX');
      Open;
    end;
//  IF DM.HY_XXQuery.Active=false then
//    DM.HY_XXQuery.Active:=true;
end;

procedure THYDJForm.FormShow(Sender: TObject);
begin
  {DM.HY_XXQuery.Close;
  DM.HY_XXQuery.SQL.Clear;
  DM.HY_XXQuery.SQL.Add('select * from HY_XX');
  DM.HY_XXQuery.Open; }
end;

procedure THYDJForm.FlatButton1Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.HY_XXQuery.State=dsbrowse then
    begin
     Edit1.Color:=clMoneyGreen;
     Edit2.Color:=clMoneyGreen;
     Edit3.Color:=clMoneyGreen;
     Edit4.Color:=clMoneyGreen;
     FlatComBoBOx2.Color:=clMoneyGreen;
     Edit6.Color:=clMoneyGreen;
     FlatComBoBox1.Color:=clMoneyGreen;
     DM.HY_XXQuery.Append;
     Edit1.SetFocus;
    end;
end;

procedure THYDJForm.FlatButton4Click(Sender: TObject);
begin
  if (Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='') then
   begin
     ShowMessage('数据不完整,请输入完整数据!');
     Exit;
   end;
   if (DM.HY_XXQuery.State=dsEdit) or (DM.HY_XXQuery.State=dsinsert) then
     begin
       try
         DM.HY_XXQuery.FieldByName('HY_ID').AsString:=Edit1.Text;
         DM.HY_XXQuery.FieldByName('HY_ORDER').AsString:=FlatComBoBox1.Text;
         DM.HY_XXQuery.FieldByName('HY_GONGSI').AsString:=Edit2.Text;
         DM.HY_XXQuery.FieldByName('HY_END').AsString:=Edit4.Text;
         DM.HY_XXQuery.FieldByName('HY_BEGIN').AsString:=Edit3.Text;
         DM.HY_XXQuery.FieldByName('HY_BOX').AsString:=FlatComBoBox2.Text;
         DM.HY_XXQuery.FieldByName('HY_PRICE').AsFloat:=strtoFloat(Edit6.Text);
         DM.HY_XXQuery.Post;
         Edit1.Color:=clwindow;
         Edit2.Color:=clwindow;
         Edit3.Color:=clwindow;
         Edit4.Color:=clwindow;
         FlatComBoBox2.Color:=clwindow;
         Edit6.Color:=clwindow;
         FlatComBoBox1.Color:=clwindow;
         Edit1.Text:='';
         Edit2.Text:='';
         Edit3.Text:='';
         Edit4.Text:='';
         Edit6.Text:='';
       except
       SHowMessage('操作有误,保存数据失败!');
       end;
     end;
end;

procedure THYDJForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.HY_XXQuery.RecordCount=0 then
  begin
    ShowMessage('表中无记录!');
    Exit;
  end;
  if DM.HY_XXQuery.State=dsbrowse then
   begin
   try
     Edit1.Color:=clMoneyGreen;
     Edit2.Color:=clMoneyGreen;
     Edit3.Color:=clMoneyGreen;
     Edit4.Color:=clMoneyGreen;
     FlatComBoBox2.Color:=clMoneyGreen;
     Edit6.Color:=clMoneyGreen;
     FlatComBoBox1.Color:=clMoneyGreen;
     DM.HY_XXQuery.Edit;
     Edit1.SetFocus;
     except
      ShowMessage('操作有误,修改失败!');
     end;
   end;
end;

procedure THYDJForm.FlatButton3Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.HY_XXQuery.RecordCount=0 then
    begin
      ShowMessage('表中无记录,无法删除!');
      Exit;
    end;
  if Application.MessageBox('是否删除记录!','系统提示',mb_yesno)=mryes then
    try
     DM.HY_XXQuery.Delete;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     Edit4.Text:='';
     Edit6.Text:='';
    except
    ShowMessage('操作有误,删除记录失败!');
    end;
end;

procedure THYDJForm.FlatButton6Click(Sender: TObject);
begin
close;
end;

procedure THYDJForm.DBGrid1CellClick(Column: TColumn);
begin
   Edit1.Text:=DM.HY_XXQuery.FieldByName('HY_ID').AsString;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='CFS-D' then
    FlatComBoBox1.ItemIndex:=0;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='CFS-CY' then
    FlatComBoBox1.ItemIndex:=1;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='CFS-CFS' then
    FlatComBoBox1.ItemIndex:=2;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='D-D' then
    FlatComBoBox1.ItemIndex:=3;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='D-CFS' then
    FlatComBoBox1.ItemIndex:=4;
   Edit2.Text:=DM.HY_XXQuery.FieldByName('HY_GONGSI').AsString;
   Edit4.Text:=DM.HY_XXQuery.FieldByName('HY_END').AsString;
   Edit3.Text:=DM.HY_XXQuery.FieldByName('HY_BEGIN').AsString;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='20' then
    FlatComBoBox2.ItemIndex:=0;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='40' then
    FlatComBoBox2.ItemIndex:=1;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='40HC' then
    FlatComBoBox2.ItemIndex:=2;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='20X2' then
    FlatComBoBox2.ItemIndex:=3;
   Edit6.Text:=Floattostr(DM.HY_XXQuery.FieldByName('HY_PRICE').AsFloat);
end;

procedure THYDJForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Edit1.Text:=DM.HY_XXQuery.FieldByName('HY_ID').AsString;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='CFS-D' then
    FlatComBoBox1.ItemIndex:=0;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='CFS-CY' then
    FlatComBoBox1.ItemIndex:=1;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='CFS-CFS' then
    FlatComBoBox1.ItemIndex:=2;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='D-D' then
    FlatComBoBox1.ItemIndex:=3;
   if DM.HY_XXQuery.FieldByName('HY_ORDER').AsString='D-CFS' then
    FlatComBoBox1.ItemIndex:=4;
   Edit2.Text:=DM.HY_XXQuery.FieldByName('HY_GONGSI').AsString;
   Edit4.Text:=DM.HY_XXQuery.FieldByName('HY_END').AsString;
   Edit3.Text:=DM.HY_XXQuery.FieldByName('HY_BEGIN').AsString;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='20' then
    FlatComBoBox2.ItemIndex:=0;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='40' then
    FlatComBoBox2.ItemIndex:=1;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='40HC' then
    FlatComBoBox2.ItemIndex:=2;
    if DM.HY_XXQuery.FieldByName('HY_BOX').AsString='20X2' then
    FlatComBoBox2.ItemIndex:=3;
   Edit6.Text:=Floattostr(DM.HY_XXQuery.FieldByName('HY_PRICE').AsFloat);
end;

procedure THYDJForm.FlatButton5Click(Sender: TObject);
begin
  HYDJQUeryForm:=THYDJQUeryForm.Create(self);
  HYDJQUeryForm.ShowModal;
end;

procedure THYDJForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Edit2.SetFocus;
end;

procedure THYDJForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Edit3.SetFocus;
end;

procedure THYDJForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Edit4.SetFocus;
end;

procedure THYDJForm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  FlatComBoBox1.SetFocus;
end;

procedure THYDJForm.FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  FlatComBoBox2.SetFocus;
end;

procedure THYDJForm.FlatComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Edit6.SetFocus;
end;

procedure THYDJForm.FlatButton7Click(Sender: TObject);
begin
  PrintFile:=10;
  PrintForm:=TPrintForm.Create(application);
  PrintForm.Show;
end;

end.

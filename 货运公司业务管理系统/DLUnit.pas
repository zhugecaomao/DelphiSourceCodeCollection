unit DLUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AAFont, AACtrls, TFlatButtonUnit, Grids, DBGrids,
  ExtCtrls, TFlatPanelUnit,DB, TFlatComboBoxUnit;

type
  TDLForm = class(TForm)
    FlatPanel1: TFlatPanel;
    DBGrid1: TDBGrid;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    AALabel3: TAALabel;
    AALabel4: TAALabel;
    AALabel5: TAALabel;
    AALabel6: TAALabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    FlatPanel2: TFlatPanel;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    FlatComboBox1: TFlatComboBox;
    FlatButton7: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure FlatButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FlatButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DLForm: TDLForm;

implementation

uses DMUnit, DLQUERYUnit, MainUnit, PrintUnit;

{$R *.dfm}

procedure TDLForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TDLForm.FlatButton1Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.DL_XXQuery.State=dsbrowse then
   begin
     Edit1.Color:=clMoneyGreen;
     Edit2.Color:=clMoneyGreen;
     FlatComBoBox1.Color:=clMoneyGreen;
     Edit4.Color:=clMoneyGreen;
     Edit5.Color:=clMoneyGreen;
     Edit6.Color:=clMoneyGreen;
     DM.DL_XXQuery.Append;
     Edit1.SetFocus;
   end;
end;

procedure TDLForm.FlatButton4Click(Sender: TObject);
begin
  if (Edit1.Text='') or (Edit2.Text='') or (Edit4.Text='') then
    begin
      ShowMessage('数据不完整,请输入完整数据!');
      Exit;
    end;
  if (DM.DL_XXQuery.State=dsinsert) or (DM.DL_XXQuery.State=dsEdit) then
    begin
     try
       DM.DL_XXQuery.FieldByName('DL_ID').AsString:=Edit1.Text;
       DM.DL_XXQuery.FieldByName('DL_GONGSI').AsString:=Edit2.Text;
       DM.DL_XXQuery.FieldByName('DL_END').AsString:=Edit4.Text;
       DM.DL_XXQuery.FieldByName('DL_MUDI').AsString:=Edit6.Text;
       DM.DL_XXQuery.FieldByName('DL_BOX').AsString:=FlatComBoBox1.Text;
       DM.DL_XXQuery.FieldByName('DL_PRICE').AsFloat:=strtoFloat(Edit5.Text);
       DM.DL_XXQuery.Post;
       Edit1.Color:=clwindow;
       Edit2.Color:=clwindow;
       Edit4.Color:=clwindow;
       Edit5.Color:=clwindow;
       Edit6.Color:=clwindow;
       Flatcombobox1.Color:=clwindow;
       Edit1.Text:='';
       Edit2.Text:='';
       Edit4.Text:='';
       Edit5.Text:='';
       Edit6.Text:='';
     except
      ShowMessage('操作有误,保存失败!');
     end;
    end;
end;

procedure TDLForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.DL_XXQuery.RecordCount=0 then
   begin
    ShowMessage('表中无记录,无法修改!');
    Exit;
   end;
   if DM.DL_XXQuery.State=dsBrowse then
   begin
   try
    Edit1.Color:=clMoneyGreen;
    Edit2.Color:=clMoneyGreen;
    FlatComBoBox1.Color:=clMoneyGreen;
    Edit4.Color:=clMoneyGreen;
    Edit5.Color:=clMoneyGreen;
    Edit6.Color:=clMoneyGreen;
    DM.DL_XXQuery.Edit;
    Edit1.SetFocus;
    except
    Showmessage('操作有误,修改失败!');
    end;;
   end;
end;

procedure TDLForm.FlatButton3Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.DL_XXQuery.RecordCount=0 then
    begin
     ShowMessage('表中无数据!无法删除!');
     Exit;
    end;
  if Application.MessageBox('是否删除数据!','系统提示',mb_yesno)=mryes then
    try
    DM.DL_XXQuery.Delete;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit4.Text:='';
    Edit5.Text:='';
    Edit6.Text:='';
    except
    ShowMessage('操作有误,删除失败!');
    end;
end;

procedure TDLForm.FlatButton5Click(Sender: TObject);
begin
 Close;
end;

procedure TDLForm.FlatButton6Click(Sender: TObject);
begin
  DLQUERYForm:=TDLQUERYForm.Create(Self);
    DLQUERYForm.ShowModal;
end;

procedure TDLForm.DBGrid1CellClick(Column: TColumn);
begin
   Edit1.Text:=DM.DL_XXQuery.FieldByName('DL_ID').AsString;
   Edit2.Text:=DM.DL_XXQuery.FieldByName('DL_GONGSI').AsString;
   Edit4.Text:=DM.DL_XXQuery.FieldByName('DL_MUDI').AsString;
   Edit6.Text:=DM.DL_XXQuery.FieldByName('DL_END').AsString;
   if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='20' then
   FlatComBoBox1.ItemIndex:=0;
    if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='40' then
   FlatComBoBox1.ItemIndex:=1;
    if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='40HC' then
   FlatComBoBox1.ItemIndex:=2;
    if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='20X2' then
   FlatComBoBox1.ItemIndex:=3;
   Edit5.Text:=floattostr(DM.DL_XXQuery.FieldByName('DL_PRICE').AsFloat);

end;

procedure TDLForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Edit1.Text:=DM.DL_XXQuery.FieldByName('DL_ID').AsString;
   Edit2.Text:=DM.DL_XXQuery.FieldByName('DL_GONGSI').AsString;
   Edit4.Text:=DM.DL_XXQuery.FieldByName('DL_MUDI').AsString;
   Edit6.Text:=DM.DL_XXQuery.FieldByName('DL_END').AsString;
    if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='20' then
   FlatComBoBox1.ItemIndex:=0;
    if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='40' then
   FlatComBoBox1.ItemIndex:=1;
    if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='40HC' then
   FlatComBoBox1.ItemIndex:=2;
    if DM.DL_XXQuery.FieldByName('DL_BOX').AsString='20X2' then
   FlatComBoBox1.ItemIndex:=3;
   Edit5.Text:=floattostr(DM.DL_XXQuery.FieldByName('DL_PRICE').AsFloat);
end;

procedure TDLForm.FormCreate(Sender: TObject);
begin
  if DM.DL_XXQuery.Active=false then
    DM.DL_XXQuery.Active:=true;
end;

procedure TDLForm.FormShow(Sender: TObject);
begin
  DM.DL_XXQuery.Close;
  DM.DL_XXQuery.SQL.Clear;
  DM.DL_XXQuery.SQL.Add('select * from DL_XX');
  DM.DL_XXQuery.Open;
end;

procedure TDLForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
  Edit2.SetFocus;
end;

procedure TDLForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then
  Edit4.SetFocus;
end;

procedure TDLForm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Edit6.SetFocus;
end;

procedure TDLForm.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Flatcombobox1.SetFocus;
end;

procedure TDLForm.FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Edit5.SetFocus;
end;

procedure TDLForm.FlatButton7Click(Sender: TObject);
begin
  PrintFile:=12;
  PrintForm:=TPrintForm.Create(application);
  PrintForm.Show;
end;

end.

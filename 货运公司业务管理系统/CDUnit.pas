unit CDUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, StdCtrls, AAFont, AACtrls, Grids, DBGrids,
  ExtCtrls, TFlatPanelUnit,DB, TFlatComboBoxUnit;

type
  TCDForm = class(TForm)
    FlatPanel1: TFlatPanel;
    DBGrid1: TDBGrid;
    AALabel1: TAALabel;
    AALabel3: TAALabel;
    AALabel4: TAALabel;
    AALabel5: TAALabel;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    FlatPanel2: TFlatPanel;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton1: TFlatButton;
    FlatComboBox1: TFlatComboBox;
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
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FlatButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDForm: TCDForm;

implementation

uses DMUnit, LYQUERYUnit, MainUnit, PrintUnit;

{$R *.dfm}

procedure TCDForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TCDForm.FormCreate(Sender: TObject);
begin
  if DM.LY_XXQuery.Active=false then
    DM.LY_XXQuery.Active:=true;
end;

procedure TCDForm.FormShow(Sender: TObject);
begin
  DM.LY_XXQuery.Close;
  DM.LY_XXQuery.SQL.Clear;
  DM.LY_XXQuery.SQL.Add('select * from LY_XX');
  DM.LY_XXQuery.Open;
end;

procedure TCDForm.FlatButton1Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.LY_XXQuery.State=dsbrowse then
    begin
     Edit1.Color:=clMoneyGreen;
     //Edit2.Color:=clMoneyGreen;
     FlatCOmBoBOx1.Color:=clMoneyGreen;
     Edit4.Color:=clMoneyGreen;
     Edit5.Color:=clMoneyGreen;
     DM.LY_XXQuery.Append;
     Edit1.SetFocus;
    end;
end;

procedure TCDForm.FlatButton4Click(Sender: TObject);
begin
  if (Edit1.Text='')  or (Edit4.Text='') then
    begin
      ShowMessage('数据不完整,请输入完整数据!');
      Exit;
    end;
  if (DM.LY_XXQuery.State=dsinsert) or (DM.LY_XXQuery.State=dsedit) then
    begin
     try
      DM.LY_XXQuery.FieldByName('LY_ID').AsString:=Edit1.Text;
      //DM.LY_XXQuery.FieldByName('LY_GONGSI').AsString:=Edit2.Text;
      DM.LY_XXQuery.FieldByName('LY_BOX').AsString:=FlatComBoBox1.Text;
      DM.LY_XXQuery.FieldByName('LY_MUDI').AsString:=Edit4.Text;
      DM.LY_XXQuery.FieldByName('LY_PRICE').AsFloat:=strtoFloat(Edit5.Text);
      DM.LY_XXQuery.Post;
      Edit1.Color:=clWindow;
     //Edit2.Color:=clWindow;
      FlatComBoBox1.Color:=clWindow;
      Edit4.Color:=clWindow;
      Edit5.Color:=clWindow;
      Edit1.Text:='';
     // Edit2.Text:='';
      //Edit3.Text:='';
      Edit4.Text:='';
      Edit5.Text:='';
     except
     ShowMessage('操作有误,保存数据失败!');
     end;
    end;
end;

procedure TCDForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.LY_XXQuery.RecordCount=0 then
   begin
     ShowMessage('表中无记录,无法保存!');
     Exit;
   end;
   if DM.LY_XXQuery.State=dsbrowse then
    begin
      Edit1.Color:=clMoneyGreen;
     // Edit2.Color:=clMoneyGreen;
      FlatComBoBox1.Color:=clMoneyGreen;
      Edit4.Color:=clMoneyGreen;
      Edit5.Color:=clMoneyGreen;
      DM.LY_XXQuery.Edit;
      Edit1.SetFocus;
    end;
end;

procedure TCDForm.FlatButton3Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.LY_XXQuery.RecordCount=0 then
   begin
    ShowMessage('表中无记录,无法删除!');
    Exit;
   end;
   if Application.MessageBox('是否删除数据!','系统提示',mb_yesno)=mryes then
    try
     DM.LY_XXQuery.Delete;
     Edit1.Text:='';
     Edit4.text:='';
     Edit5.Text:='';
    except
     ShowMessage('操作有误,删除数据失败!');
    end;
end;

procedure TCDForm.FlatButton5Click(Sender: TObject);
begin
  LYQUERYForm:=TLYQUERYForm.Create(Self);
    LYQUERYForm.ShowModal;
end;

procedure TCDForm.FlatButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TCDForm.DBGrid1CellClick(Column: TColumn);
begin
      Edit1.Text:=DM.LY_XXQuery.FieldByName('LY_ID').AsString;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='20' then
      FlatComBoBox1.ItemIndex:=0;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='40' then
      FlatComBoBox1.ItemIndex:=1;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='40HC' then
      FlatComBoBox1.ItemIndex:=2;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='20X2' then
      FlatComBoBox1.ItemIndex:=3;
      Edit4.Text:=DM.LY_XXQuery.FieldByName('LY_MUDI').AsString;
      Edit5.Text:=floattostr(DM.LY_XXQuery.FieldByName('LY_PRICE').AsFloat);
end;

procedure TCDForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Edit1.Text:=DM.LY_XXQuery.FieldByName('LY_ID').AsString;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='20' then
      FlatComBoBox1.ItemIndex:=0;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='40' then
      FlatComBoBox1.ItemIndex:=1;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='40HC' then
      FlatComBoBox1.ItemIndex:=2;
      if DM.LY_XXQuery.FieldByName('LY_BOX').AsString='20X2' then
      FlatComBoBox1.ItemIndex:=3;
      Edit4.Text:=DM.LY_XXQuery.FieldByName('LY_MUDI').AsString;
      Edit5.Text:=floattostr(DM.LY_XXQuery.FieldByName('LY_PRICE').AsFloat);
end;

procedure TCDForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Edit4.SetFocus;
end;

procedure TCDForm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  Flatcombobox1.SetFocus;
end;

procedure TCDForm.FlatComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Edit5.SetFocus;
end;

procedure TCDForm.FlatButton7Click(Sender: TObject);
begin
  PrintFile:=11;
  PrintForm:=TPrintForm.Create(application);
  PrintForm.Show;
end;

end.

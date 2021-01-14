unit FHXXUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TFlatButtonUnit, StdCtrls, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit,DB, Mask;

type
  TFHXXForm = class(TForm)
    DBGrid1: TDBGrid;
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    AALabel3: TAALabel;
    AALabel4: TAALabel;
    AALabel5: TAALabel;
    AALabel6: TAALabel;
    AALabel7: TAALabel;
    AALabel8: TAALabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    FlatPanel2: TFlatPanel;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    FlatButton6: TFlatButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    FlatButton7: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure FlatButton6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure FlatButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHXXForm: TFHXXForm;

implementation

uses DMUnit, FHXXQUERYUnit, MainUnit, PrintUnit;

{$R *.dfm}

procedure TFHXXForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFHXXForm.FormCreate(Sender: TObject);
begin
  with DM.FhxxQuery do
    begin
      Close;
      SQl.Clear;
      SQL.Add('select * from FHXX');
      Open;
    end;
 // if DM.FhxxQuery.Active=False then
  //  DM.FhxxQuery.Active:=true;
end;

procedure TFHXXForm.FlatButton1Click(Sender: TObject);
begin
  if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.FhxxQuery.State=dsbrowse then
  try
  Edit1.Color:=clMoneyGreen;
  Edit2.Color:=clMoneyGreen;
  Edit3.Color:=clMoneyGreen;
  MaskEdit1.Color:=clMoneyGreen;
  MaskEdit2.Color:=clMoneyGreen;
  Edit6.Color:=clMoneyGreen;
  MaskEdit3.Color:=clMoneyGreen;
  MaskEdit4.Color:=clMoneyGreen;
   Edit1.Text:='';
   Edit2.Text:='';
   Edit3.Text:='';
   MaskEdit1.Text:='';
   MaskEdit2.Text:='';
   Edit6.Text:='';
   MaskEdit3.Text:='';
   MaskEdit4.Text:='';
  DM.FhxxQuery.Append;
  Edit1.SetFocus;
  except
   ShowMessage('操作有误，添加失败!');
  end;
end;

procedure TFHXXForm.FlatButton4Click(Sender: TObject);
begin
   if (Edit1.Text='') or (Edit2.Text='') then
   begin
     ShowMessage('数据不完整，请重新输入!');
     Exit;
   end;
   if (DM.FhxxQuery.State=dsinsert) or (DM.FhxxQuery.State=dsedit) then
  begin
    try
    DM.FhxxQuery.FieldByName('FH_ID').AsString:=Edit1.Text;
    DM.FhxxQuery.FieldByName('FH_GONGSI').AsString:=Edit2.Text;
    DM.FhxxQuery.FieldByName('FH_NAME').AsString:=Edit3.Text;
    DM.FhxxQuery.FieldByName('FH_PHONE').AsString:=MaskEdit1.Text;
    DM.FhxxQuery.FieldByName('FH_CHZH').AsString:=MaskEdit2.Text;
    DM.FhxxQuery.FieldByName('FH_ADDRESS').AsString:=Edit6.Text;
    DM.FhxxQuery.FieldByName('FH_CALL').AsString:=MaskEdit3.Text;
    DM.FhxxQuery.FieldByName('FH_YOUBIAN').AsString:=MaskEdit4.Text;
    DM.FhxxQuery.Post;
    Edit1.Color:=clwindow;
    Edit2.Color:=clwindow;
    Edit3.Color:=clwindow;
    MaskEdit1.Color:=clwindow;
    MaskEdit2.Color:=clwindow;
    Edit6.Color:=clwindow;
    MaskEdit3.Color:=clwindow;
    MaskEdit4.Color:=clwindow;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    MaskEdit1.Text:='';
    MaskEdit2.Text:='';
    Edit6.Text:='';
    MaskEdit3.Text:='';
    MaskEdit4.Text:='';
    except
    ShowMessage('数据保存失败!');
    end;
    end;
end;

procedure TFHXXForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.FhxxQuery.RecordCount=0 then
    begin
      ShowMessage('表中无数据!');
      Exit;
    end;
  if DM.FhxxQuery.State=dsbrowse then
    begin
    Try
    Edit1.Color:=clMoneyGreen;
    Edit2.Color:=clMoneyGreen;
    Edit3.Color:=clMoneyGreen;
    MaskEdit1.Color:=clMoneyGreen;
    MaskEdit2.Color:=clMoneyGreen;
    Edit6.Color:=clMoneyGreen;
    MaskEdit3.Color:=clMoneyGreen;
    MaskEdit4.Color:=clMoneyGreen;
    DM.FhxxQuery.edit;
    Edit1.SetFocus;
    Except
    ShowMessage('操作有误，无法修改!');
    end;
    end;
end;

procedure TFHXXForm.FlatButton3Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.FhxxQuery.RecordCount=0 then
  begin
  ShowMessage('操作有误,表中无数据!');
  Exit;
  end;
  if DM.FhxxQuery.State=dsbrowse then
  if Application.MessageBox('是否删除数据!','系统提示',mb_yesno)=mryes then
  try
    DM.FhxxQuery.Delete;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    MaskEdit1.Text:='';
    MaskEdit2.Text:='';
    Edit6.Text:='';
    MaskEdit3.Text:='';
    MaskEdit4.Text:='';
  except
  ShowMessage('数据删除失败!');
  end;
end;

procedure TFHXXForm.DBGrid1CellClick(Column: TColumn);
begin
   Edit1.Text:=DM.FhxxQuery.FieldByName('FH_ID').AsString;
   Edit2.Text:= DM.FhxxQuery.FieldByName('FH_GONGSI').AsString;
   Edit3.Text:=DM.FhxxQuery.FieldByName('FH_NAME').AsString;
   MaskEdit1.Text:=DM.FhxxQuery.FieldByName('FH_PHONE').AsString;
   MaskEdit2.Text:=DM.FhxxQuery.FieldByName('FH_CHZH').AsString;
   Edit6.Text:=DM.FhxxQuery.FieldByName('FH_ADDRESS').AsString;
   MaskEdit3.Text:=DM.FhxxQuery.FieldByName('FH_CALL').AsString;
   MaskEdit4.Text:=DM.FhxxQuery.FieldByName('FH_YOUBIAN').AsString;
end;

procedure TFHXXForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Edit1.Text:=DM.FhxxQuery.FieldByName('FH_ID').AsString;
   Edit2.Text:= DM.FhxxQuery.FieldByName('FH_GONGSI').AsString;
   Edit3.Text:=DM.FhxxQuery.FieldByName('FH_NAME').AsString;
   MaskEdit1.Text:=DM.FhxxQuery.FieldByName('FH_PHONE').AsString;
   MaskEdit2.Text:=DM.FhxxQuery.FieldByName('FH_CHZH').AsString;
   Edit6.Text:=DM.FhxxQuery.FieldByName('FH_ADDRESS').AsString;
   MaskEdit3.Text:=DM.FhxxQuery.FieldByName('FH_CALL').AsString;
   MaskEdit4.Text:=DM.FhxxQuery.FieldByName('FH_YOUBIAN').AsString;
end;

procedure TFHXXForm.FormShow(Sender: TObject);
begin
  DM.FhxxQuery.Close;
  DM.FhxxQuery.SQL.Clear;
  DM.FhxxQuery.SQL.Add('Select * from FHXX');
  DM.FhxxQuery.Open;
end;

procedure TFHXXForm.FlatButton5Click(Sender: TObject);
begin
  FHXXQUERYForm:=TFHXXQUERYForm.Create(Self);
    FHXXQUERYForm.ShowModal;
end;

procedure TFHXXForm.FlatButton6Click(Sender: TObject);
begin
close;
end;

procedure TFHXXForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //selectnext(sender as Twincontrol,true,true);
end;

procedure TFHXXForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Edit2.SetFocus;
end;

procedure TFHXXForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    edit3.SetFocus;
end;

procedure TFHXXForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  MaskEdit1.SetFocus;
end;

procedure TFHXXForm.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Edit6.SetFocus;
end;

procedure TFHXXForm.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key=#13 then
  MaskEdit2.SetFocus;
end;

procedure TFHXXForm.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  MaskEdit3.SetFocus;
end;

procedure TFHXXForm.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
    if Key=#13 then
  MaskEdit4.SetFocus;

end;

procedure TFHXXForm.FlatButton7Click(Sender: TObject);
begin
  PrintFile:=8;
  PrintForm:=TPrintForm.Create(application);
  PrintForm.Show;
end;

end.

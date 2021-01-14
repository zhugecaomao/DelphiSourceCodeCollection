unit YHGLUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, AAFont, AACtrls, ExtCtrls,
  TFlatPanelUnit, TFlatButtonUnit, TFlatComboBoxUnit,DB, TFlatGroupBoxUnit;

type
  TYHGLForm = class(TForm)
    DBGrid1: TDBGrid;
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    AALabel3: TAALabel;
    Edit1: TEdit;
    Edit2: TEdit;
    FlatGroupBox1: TFlatGroupBox;
    FlatButton1: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton4: TFlatButton;
    FlatComboBox1: TFlatComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YHGLForm: TYHGLForm;

implementation

uses DMUnit, MainUnit;

{$R *.dfm}

procedure TYHGLForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TYHGLForm.FormCreate(Sender: TObject);
begin
   DM.UseNameQuery.Active:=False;
     DM.UseNameQuery.SQL.Clear;
      DM.UseNameQuery.SQL.Add('select * from usename');
    DM.UseNameQuery.Active:=True;
end;

procedure TYHGLForm.FlatButton1Click(Sender: TObject);
begin
  If DM.UseNameQuery.State=dsBrowse Then
    begin
      Edit1.Color:=ClMoneyGreen;
      Edit2.Color:=ClMoneyGreen;
      FlatComBoBOx1.Color:=ClMoneyGreen;
      Edit1.SetFocus;
      DM.UseNameQuery.Append;
    end;
end;

procedure TYHGLForm.FlatButton4Click(Sender: TObject);
begin
  If DM.UseNameQuery.State=dsinsert then
     If (Edit1.Text='') or (Edit2.Text='') then
     begin
       ShowMessage('请输入完整数据!');
       Edit1.SetFocus;
       Exit;
     end;
    Try
    DM.UseNameQuery.FieldByName('NAME').AsString:=Edit1.Text;
    DM.UseNameQuery.FieldByName('PASS').AsString:=Edit2.Text;
    DM.UseNameQuery.FieldByName('POPEDOM').AsString:=FlatComBoBox1.Text;
    DM.UseNameQuery.Post;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit1.Color:=clWindow;
    Edit2.Color:=clWindow;
    FlatComBoBOx1.Color:=clWindow;
    Except
    end;
end;

procedure TYHGLForm.DBGrid1CellClick(Column: TColumn);
begin
  Edit1.Text:=DM.UseNameQuery.FieldByName('NAME').AsString;
  Edit2.Text:=DM.UseNameQuery.FieldByName('PASS').AsString;
  if DM.UseNameQuery.FieldByName('POPEDOM').AsString='管理员' then
    FlatComBoBox1.ItemIndex:=0
    else
    FlatComBoBox1.ItemIndex:=1;
end;

procedure TYHGLForm.FlatButton2Click(Sender: TObject);
begin
   Try
   DM.UseNameQuery.Edit;
   DM.UseNameQuery.FieldByName('NAME').AsString:=Edit1.Text;
   DM.UseNameQuery.FieldByName('PASS').AsString:=Edit2.Text;
   DM.UseNameQuery.FieldByName('POPEDOM').AsString:=FlatComBoBox1.Text;
   DM.UseNameQuery.Post;
   ShowMessage('修改记录成功!');
   Except
   ShowMessage('修改记录失败!');
   end;
end;

procedure TYHGLForm.FlatButton3Click(Sender: TObject);
begin
  If DM.UseNameQuery.RecordCount=0 then
    begin
      ShowMessage('表中无记录!');
      Exit;
    end
    else if DM.UseNameQuery.State=dsBrowse then
      if Application.MessageBox('确认删除用户?','系统提示',mb_yesno)=mryes then
    Try
     DM.UseNameQuery.Delete;
     Edit1.Text:='';
     Edit2.Text:='';
     FlatComBoBox1.Text:='';
    Except
    ShowMessage('删除记录失败!');
    end;
end;

procedure TYHGLForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Edit1.Text:=DM.UseNameQuery.FieldByName('NAME').AsString;
  Edit2.Text:=DM.UseNameQuery.FieldByName('PASS').AsString;
  if DM.UseNameQuery.FieldByName('POPEDOM').AsString='管理员' then
    FlatComBoBox1.ItemIndex:=0
    else
    FlatComBoBox1.ItemIndex:=1;
end;

end.

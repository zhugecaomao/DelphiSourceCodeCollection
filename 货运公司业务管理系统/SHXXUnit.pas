unit SHXXUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TFlatButtonUnit, TFlatSpeedButtonUnit, ExtCtrls,
  TFlatPanelUnit, StdCtrls, AAFont, AACtrls,DB, Mask;

type
  TSHXXForm = class(TForm)
    FlatPanel1: TFlatPanel;
    DBGrid1: TDBGrid;
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
    Edit7: TEdit;
    FlatPanel2: TFlatPanel;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatButton3: TFlatButton;
    FlatButton4: TFlatButton;
    FlatButton5: TFlatButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    FlatButton6: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton5Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FlatButton4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure FlatButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SHXXForm: TSHXXForm;

implementation

uses DMUnit, SHXXQUERYUnit, MainUnit, PrintUnit;

{$R *.dfm}

procedure TSHXXForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TSHXXForm.FormCreate(Sender: TObject);
begin
   with DM.SHXXQuery do
     begin
       Close;
       SQL.Clear;
       SQL.Add('select * from SHXX');
       Open;
     end;
 //if DM.SHXXQuery.Active=false then
   // DM.SHXXQuery.Active:=true;
end;

procedure TSHXXForm.FormShow(Sender: TObject);
begin
 { DM.SHXXQuery.Close;
  DM.SHXXQuery.SQL.Clear;
  DM.SHXXQuery.SQL.Add('select * from SHXX');
  DM.SHXXQuery.Open;}
end;

procedure TSHXXForm.FlatSpeedButton1Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.SHXXQuery.State=dsbrowse then
   begin
     Edit1.Color:=clMoneyGreen;
     Edit2.Color:=clMoneyGreen;
     Edit3.Color:=clMoneyGreen;
     MaskEdit1.Color:=clMoneyGreen;
     MaskEdit3.Color:=clMoneyGreen;
     MaskEdit2.Color:=clMoneyGreen;
     Edit7.Color:=clMoneyGreen;
     MaskEdit4.Color:=clMoneyGreen;
     DM.SHXXQuery.Append;
     Edit1.SetFocus;
   end;
end;

procedure TSHXXForm.FlatButton3Click(Sender: TObject);
begin
  if (Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='') then
    begin
      ShowMessage('数据不完整,请录入完整数据!');
      Exit;
    end;
  if (DM.SHXXQuery.State=dsinsert) or (DM.SHXXQuery.State=dsEdit) then
    begin
    Try
    DM.SHXXQuery.FieldByName('SH_ID').AsString:=Edit1.Text;
    DM.SHXXQuery.FieldByName('SH_GONGSI').AsString:=Edit2.Text;
    DM.SHXXQuery.FieldByName('SH_NAME').AsString:=Edit3.Text;
    DM.SHXXQuery.FieldByName('SH_PHONE').AsString:=MaskEdit1.Text;
    DM.SHXXQuery.FieldByName('SH_CHZH').AsString:=MaskEdit2.Text;
    DM.SHXXQuery.FieldByName('SH_ADDRESS').AsString:=Edit7.Text;
    DM.SHXXQuery.FieldByName('SH_CALL').AsString:=MaskEdit3.Text;
    DM.SHXXQuery.FieldByName('SH_YOUBIAN').AsString:=MaskEdit4.Text;
    DM.SHXXQuery.Post;
    Edit1.Color:=clwindow;
    Edit2.Color:=clwindow;
    Edit3.Color:=clwindow;
    MaskEdit1.Color:=clwindow;
    MaskEdit3.Color:=clwindow;
    MaskEdit2.Color:=clwindow;
    Edit7.Color:=clwindow;
    MaskEdit4.Color:=clwindow;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    MaskEdit1.Text:='';
    MaskEdit3.Text:='';
    MaskEdit2.Text:='';
    Edit7.Text:='';
    MaskEdit4.Text:='';
    except
     ShowMessage('操作失误,保存失败!');
    end;
    end;
end;

procedure TSHXXForm.FlatButton1Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.SHXXQuery.RecordCount=0 then
    begin
    ShowMessage('表中无记录,无法修改!');
    Exit;
    end;
  if DM.SHXXQuery.State=dsbrowse then
    try
     Edit1.Color:=clMoneyGreen;
     Edit2.Color:=clMoneyGreen;
     Edit3.Color:=clMoneyGreen;
     MaskEdit1.Color:=clMoneyGreen;
     MaskEdit3.Color:=clMoneyGreen;
     MaskEdit2.Color:=clMoneyGreen;
     Edit7.Color:=clMoneyGreen;
     MaskEdit4.Color:=clMoneyGreen;
     DM.SHXXQuery.Edit;
     Edit1.SetFocus;
    except
    ShowMessage('操作有误,修改失败!');
    end;
end;

procedure TSHXXForm.FlatButton2Click(Sender: TObject);
begin
   if MainForm.QuanXian=2 then
    begin
      ShowMessage('你的权限不够！');
      exit;
    end;
  if DM.SHXXQuery.RecordCount=0 then
    begin
      ShowMessage('表中无记录！');
      Exit;
    end;
  If Application.MessageBox('是否删除表中记录!','系统提示',mb_yesno)=mryes then
    Try
     DM.SHXXQuery.Delete;
      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='';
      MaskEdit1.Text:='';
      MaskEdit3.Text:='';
      MaskEdit2.Text:='';
      Edit7.Text:='';
      MaskEdit4.Text:='';
    except
    ShowMessage('操作有误, 删除失败!');
    end;
end;

procedure TSHXXForm.FlatButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TSHXXForm.DBGrid1CellClick(Column: TColumn);
begin
    Edit1.Text:=DM.SHXXQuery.FieldByName('SH_ID').AsString;
    Edit2.Text:=DM.SHXXQuery.FieldByName('SH_GONGSI').AsString;
    Edit3.Text:=DM.SHXXQuery.FieldByName('SH_NAME').AsString;
    MaskEdit1.Text:=DM.SHXXQuery.FieldByName('SH_PHONE').AsString;
    MaskEdit2.Text:=DM.SHXXQuery.FieldByName('SH_CHZH').AsString;
    Edit7.Text:=DM.SHXXQuery.FieldByName('SH_ADDRESS').AsString;
    MaskEdit3.Text:=DM.SHXXQuery.FieldByName('SH_CALL').AsString;
    MaskEdit4.Text:=DM.SHXXQuery.FieldByName('SH_YOUBIAN').AsString;
end;

procedure TSHXXForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Edit1.Text:=DM.SHXXQuery.FieldByName('SH_ID').AsString;
    Edit2.Text:=DM.SHXXQuery.FieldByName('SH_GONGSI').AsString;
    Edit3.Text:=DM.SHXXQuery.FieldByName('SH_NAME').AsString;
    MaskEdit1.Text:=DM.SHXXQuery.FieldByName('SH_PHONE').AsString;
    MaskEdit2.Text:=DM.SHXXQuery.FieldByName('SH_CHZH').AsString;
    Edit7.Text:=DM.SHXXQuery.FieldByName('SH_ADDRESS').AsString;
    MaskEdit3.Text:=DM.SHXXQuery.FieldByName('SH_CALL').AsString;
    MaskEdit4.Text:=DM.SHXXQuery.FieldByName('SH_YOUBIAN').AsString;
end;

procedure TSHXXForm.FlatButton4Click(Sender: TObject);
begin
  SHXXQueryForm:=TSHXXQueryForm.Create(Self);
   SHXXQueryForm.ShowModal;
end;

procedure TSHXXForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Edit2.SetFocus;
end;

procedure TSHXXForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Edit3.SetFocus;
end;

procedure TSHXXForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   MaskEdit1.SetFocus;
end;

procedure TSHXXForm.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  MaskEdit2.SetFocus;
end;

procedure TSHXXForm.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   edit7.SetFocus;
end;

procedure TSHXXForm.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
   MaskEdit3.SetFocus;
end;

procedure TSHXXForm.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
   if  Key=#13 then
  MaskEdit4.SetFocus;
end;

procedure TSHXXForm.FlatButton6Click(Sender: TObject);
begin
  PrintFile:=9;
  PrintForm:=TPrintForm.Create(application);
  PrintForm.Show;
end;

end.

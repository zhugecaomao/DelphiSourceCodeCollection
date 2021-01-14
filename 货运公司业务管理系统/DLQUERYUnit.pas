unit DLQUERYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AAFont, AACtrls, TFlatButtonUnit, TFlatComboBoxUnit,
  ExtCtrls, TFlatPanelUnit;

type
  TDLQUERYForm = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatComboBox1: TFlatComboBox;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DLQUERYForm: TDLQUERYForm;

implementation

uses DMUnit, DLUnit;

{$R *.dfm}

procedure TDLQUERYForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TDLQUERYForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure TDLQUERYForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.DL_XXQuery.Close;
      DM.DL_XXQuery.SQL.Clear;
      DM.DL_XXQuery.SQL.Add('select * from DL_XX');
      DM.DL_XXQuery.Open;
      Exit;
    end;
  Str:='Select * from DL_XX';
  S:=Edit1.Text;
  if FlatComBoBox1.Text='公司名称' then
   Str:=Str+' where DL_GONGSI like '''+s+'%'+'''';
  if FlatComBoBox1.Text='目的港' then
   Str:=Str+' where DL_END like '''+s+'%'+'''';
  if FlatComBoBox1.Text='船名/船次' then
   Str:=Str+' where DL_CHAN like '''+s+'%'+'''';
  if FlatComBoBox1.Text='目的地' then
   Str:=Str+' where DL_MUDI like '''+s+'%'+'''';
    DM.DL_XXQuery.Close;
    DM.DL_XXQuery.SQL.Clear;
    DM.DL_XXQuery.SQL.Add(Str);
    DM.DL_XXQuery.Open;
    DLQueryForm.Close;

end;

end.

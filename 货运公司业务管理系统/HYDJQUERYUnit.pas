unit HYDJQUERYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, StdCtrls, TFlatComboBoxUnit, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit;

type
  THYDJQUeryForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    FlatComboBox1: TFlatComboBox;
    Edit1: TEdit;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HYDJQUeryForm: THYDJQUeryForm;

implementation

uses DMUnit, HYDJUnit;

{$R *.dfm}

procedure THYDJQUeryForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure THYDJQUeryForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.HY_XXQuery.Close;
      DM.HY_XXQuery.SQL.Clear;
      DM.HY_XXQuery.SQL.Add('select * from HY_XX');
      DM.HY_XXQuery.Open;
      Exit;
    end;
  Str:='Select * from HY_XX';
  S:=Edit1.Text;
  if FlatComBoBox1.Text='船运公司' then
   Str:=Str+' where HY_GONGSI like '''+s+'%'+'''';
  if FlatComBoBox1.Text='目的港' then
   Str:=Str+' where HY_END like '''+s+'%'+'''';
  if FlatComBoBox1.Text='起运港' then
   Str:=Str+' where HY_BEGIN like '''+s+'%'+'''';
    DM.HY_XXQuery.Close;
    DM.HY_XXQuery.SQL.Clear;
    DM.HY_XXQuery.SQL.Add(Str);
    DM.HY_XXQuery.Open;
    HYDJQueryForm.Close;

end;

end.

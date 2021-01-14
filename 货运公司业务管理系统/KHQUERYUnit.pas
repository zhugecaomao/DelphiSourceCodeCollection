unit KHQUERYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatComboBoxUnit, TFlatButtonUnit, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit;

type
  TKUQUERYForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    FlatComboBox1: TFlatComboBox;
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
  KUQUERYForm: TKUQUERYForm;

implementation

uses DMUnit, KUUnit, CDUnit;

{$R *.dfm}

procedure TKUQUERYForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TKUQUERYForm.FlatButton2Click(Sender: TObject);
begin
  close;
end;

procedure TKUQUERYForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.CD_XXQuery.Close;
      DM.CD_XXQuery.SQL.Clear;
      DM.CD_XXQuery.SQL.Add('select * from CD_XX');
      DM.CD_XXQuery.Open;
      Exit;
    end;
  Str:='Select * from CD_XX';
  S:=Edit1.Text;
  if FlatComBoBox1.Text='发货名称' then
  Str:=Str+' where CD_NAME like '''+s+'%'+'''';
  if FlatComBoBox1.Text='目的地' then
   Str:=Str+' where CD_BEGIN like '''+s+'%'+'''';
    DM.CD_XXQuery.Close;
    DM.CD_XXQuery.SQL.Clear;
    DM.CD_XXQuery.SQL.Add(Str);
    DM.CD_XXQuery.Open;
    KUQUERYForm.Close;

end;

end.

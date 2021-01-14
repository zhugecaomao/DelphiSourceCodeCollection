unit LYQUERYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatButtonUnit, TFlatComboBoxUnit, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit;

type
  TLYQUERYForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    FlatComboBox1: TFlatComboBox;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
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
  LYQUERYForm: TLYQUERYForm;

implementation

uses DMUnit, CDUnit;

{$R *.dfm}

procedure TLYQUERYForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TLYQUERYForm.FlatButton2Click(Sender: TObject);
begin
  close;
end;

procedure TLYQUERYForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.LY_XXQuery.Close;
      DM.LY_XXQuery.SQL.Clear;
      DM.LY_XXQuery.SQL.Add('select * from LY_XX');
      DM.LY_XXQuery.Open;
      Exit;
    end;               
  Str:='Select * from LY_XX';
  S:=Edit1.Text;
 // if FlatComBoBox1.Text='发货名称' then
 // Str:=Str+' where CD_NAME like '''+s+'%'+'''';
  if FlatComBoBox1.Text='目的地' then
   Str:=Str+' where LY_MUDI like '''+s+'%'+'''';
    DM.LY_XXQuery.Close;
    DM.LY_XXQuery.SQL.Clear;
    DM.LY_XXQuery.SQL.Add(Str);
    DM.LY_XXQuery.Open;
    LYQUERYForm.Close;


end;

end.

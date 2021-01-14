unit FHXXQUERYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, StdCtrls, TFlatComboBoxUnit, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit;

type
  TFHXXQUERYForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    FlatComboBox1: TFlatComboBox;
    Edit1: TEdit;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHXXQUERYForm: TFHXXQUERYForm;

implementation

uses DMUnit, FHXXUnit;

{$R *.dfm}

procedure TFHXXQUERYForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFHXXQUERYForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.FhxxQuery.Close;
      DM.FhxxQuery.SQL.Clear;
      DM.FhxxQuery.SQL.Add('select * from FHXX');
      DM.FhxxQuery.Open;
      Exit;
    end;
  Str:='Select * from FHXX';
  S:=Edit1.Text;
  if FlatComBoBox1.Text='发货公司' then
   Str:=Str+' where FH_GONGSI like '''+s+'%'+'''';
  if FlatComBoBox1.Text='联系人' then
   Str:=Str+' where FH_NAME like '''+s+'%'+'''';
    DM.FhxxQuery.Close;
    DM.FhxxQuery.SQL.Clear;
    DM.FhxxQuery.SQL.Add(Str);
    DM.FhxxQuery.Open;
    FHXXQueryForm.Close;
end;

procedure TFHXXQUERYForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

end.

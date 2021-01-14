unit SHXXQUERYUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatButtonUnit, AAFont, AACtrls, TFlatComboBoxUnit,
  ExtCtrls, TFlatPanelUnit;

type
  TSHXXQUeryForm = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatComboBox1: TFlatComboBox;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    Edit1: TEdit;
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SHXXQUeryForm: TSHXXQUeryForm;

implementation

uses DMUnit;

{$R *.dfm}

procedure TSHXXQUeryForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure TSHXXQUeryForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.SHXXQuery.Close;
      DM.SHXXQuery.SQL.Clear;
      DM.SHXXQuery.SQL.Add('select * from SHXX');
      DM.SHXXQuery.Open;
      Exit;
    end;
  Str:='Select * from SHXX';
  S:=Edit1.Text;
  if FlatComBoBox1.Text='收货公司' then
   Str:=Str+' where SH_GONGSI like '''+s+'%'+'''';
  if FlatComBoBox1.Text='收货人' then
   Str:=Str+' where SH_NAME like '''+s+'%'+'''';
    DM.SHXXQuery.Close;
    DM.SHXXQuery.SQL.Clear;
    DM.SHXXQuery.SQL.Add(Str);
    DM.SHXXQuery.Open;
    SHXXQueryForm.Close;
end;

end.

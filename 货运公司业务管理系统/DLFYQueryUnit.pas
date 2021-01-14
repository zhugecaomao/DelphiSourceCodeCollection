unit DLFYQueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, StdCtrls, TFlatComboBoxUnit, ExtCtrls,
  TFlatPanelUnit, AAFont, AACtrls;

type
  TDLFYQueryForm = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatComboBox1: TFlatComboBox;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    AALabel2: TAALabel;
    AALabel1: TAALabel;
    Edit1: TEdit;
    AALabel3: TAALabel;
    FlatComboBox2: TFlatComboBox;
    FlatButton3: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DLFYQueryForm: TDLFYQueryForm;

implementation

uses DMUnit;

{$R *.dfm}

procedure TDLFYQueryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TDLFYQueryForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.DLFYQuery.Close;
      DM.DLFYQuery.SQL.Clear;
      DM.DLFYQuery.SQL.Add('select * from DL_FYXX');
      DM.DLFYQuery.Open;
      Exit;
    end;
  Str:='Select * from DL_FYXX';
  S:=Edit1.Text;
  if Flatcombobox2.Text=trim('') then
    begin
      if FlatComBoBox1.Text='提单号' then
        Str:=Str+' where DL_ID like '''+s+'%'+'''';
      if FlatComBoBox1.Text='代理名称' then
        Str:=Str+' where DL_NAME like '''+s+'%'+'''';
      if FlatComBoBox1.Text='目的港' then
        Str:=Str+' where DL_END like '''+s+'%'+'''';
      if FlatComBoBox1.Text='目的地' then
        Str:=Str+' where DL_MUDI like '''+s+'%'+'''';
      if FlatComBoBox1.Text='船名/船次' then
        Str:=Str+' where DL_CHAN like '''+s+'%'+'''';
      end;
    if Flatcombobox2.Text<>trim('') then
      begin
         if FlatComBoBox1.Text='提单号' then
        Str:=Str+' where DL_ID like '''+s+'%'+''' and DL_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='代理名称' then
        Str:=Str+' where DL_NAME like '''+s+'%'+''' and DL_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='目的港' then
        Str:=Str+' where DL_END like '''+s+'%'+''' and DL_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='目的地' then
        Str:=Str+' where DL_MUDI like '''+s+'%'+''' and DL_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='船名/船次' then
        Str:=Str+' where DL_CHAN like '''+s+'%'+''' and DL_YUE ='''+Flatcombobox2.Text+'''';
      end;
    DM.DLFYQuery.Close;
    DM.DLFYQuery.SQL.Clear;
    DM.DLFYQuery.SQL.Add(Str);
    DM.DLFYQuery.Open;
    DLFYQueryForm.Close;
end;

procedure TDLFYQueryForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure TDLFYQueryForm.FlatButton3Click(Sender: TObject);
begin
  if Flatcombobox2.Enabled=true then
    Flatcombobox2.Enabled:=false
  else
    Flatcombobox2.Enabled:=true;
end;

end.

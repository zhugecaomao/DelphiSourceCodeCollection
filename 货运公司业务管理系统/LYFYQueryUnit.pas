unit LYFYQueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AAFont, AACtrls, TFlatButtonUnit, TFlatComboBoxUnit,
  ExtCtrls, TFlatPanelUnit;

type
  TLYFYQueryForm = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatComboBox1: TFlatComboBox;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    Edit1: TEdit;
    FlatButton3: TFlatButton;
    FlatComboBox2: TFlatComboBox;
    AALabel3: TAALabel;
    procedure FlatButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LYFYQueryForm: TLYFYQueryForm;

implementation

uses DMUnit;

{$R *.dfm}

procedure TLYFYQueryForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure TLYFYQueryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TLYFYQueryForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.CDFYQuery.Close;
      DM.CDFYQuery.SQL.Clear;
      DM.CDFYQuery.SQL.Add('select * from CD_FYXX');
      DM.CDFYQuery.Open;
      Exit;
    end;
  Str:='Select * from CD_FYXX';
  S:=Edit1.Text;
  if Flatcombobox2.Text=trim('') then
    begin
      if FlatComBoBox1.Text='提单号' then
        Str:=Str+' where CD_ID like '''+s+'%'+'''';
      if FlatComBoBox1.Text='公司名称' then
        Str:=Str+' where CD_GSNAME like '''+s+'%'+'''';
      if FlatComBoBox1.Text='船名/船次' then
        Str:=Str+' where CD_CHAN like '''+s+'%'+'''';
      if FlatComBoBox1.Text='托运地址' then
        Str:=Str+' where CD_TYADDRESS like '''+s+'%'+'''';
    end;
  if Flatcombobox2.Text<>trim('') then
     begin
       if FlatComBoBox1.Text='提单号' then
         Str:=Str+' where CD_ID like '''+s+'%'+''' and CD_YUE ='''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='公司名称' then
         Str:=Str+' where CD_GSNAME like '''+s+'%'+''' and CD_YUE ='''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='船名/船次' then
         Str:=Str+' where CD_CHAN like '''+s+'%'+''' and CD_YUE ='''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='托运地址' then
         Str:=Str+' where CD_TYADDRESS like '''+s+'%'+''' and CD_YUE ='''+Flatcombobox2.text+'''';
     end;
    DM.CDFYQuery.Close;
    DM.CDFYQuery.SQL.Clear;
    DM.CDFYQuery.SQL.Add(Str);
    DM.CDFYQuery.Open;
    LYFYQueryForm.Close;
end;

procedure TLYFYQueryForm.FlatButton3Click(Sender: TObject);
begin
  if Flatcombobox2.Enabled=true then
    Flatcombobox2.Enabled:=false
    else
    Flatcombobox2.Enabled:=true;
end;

end.

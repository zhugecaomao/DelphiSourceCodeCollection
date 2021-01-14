unit HYFYQueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatButtonUnit, TFlatComboBoxUnit, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit;

type
  THYFYQueryForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
    FlatComboBox1: TFlatComboBox;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    Edit1: TEdit;
    AALabel3: TAALabel;
    FlatComboBox2: TFlatComboBox;
    FlatButton3: TFlatButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HYFYQueryForm: THYFYQueryForm;

implementation

uses DMUnit;

{$R *.dfm}

procedure THYFYQueryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure THYFYQueryForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure THYFYQueryForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.HYFYQuery.Close;
      DM.HYFYQuery.SQL.Clear;
      DM.HYFYQuery.SQL.Add('select * from HY_FYXX');
      DM.HYFYQuery.Open;
      Exit;
    end;
  Str:='Select * from HY_FYXX';
  S:=Edit1.Text;
  if Flatcombobox2.Text=trim('') then
    begin
      if FlatComBoBox1.Text='提单号' then
        Str:=Str+' where HY_TD like '''+s+'%'+'''';
      if FlatComBoBox1.Text='发货公司' then
        Str:=Str+' where HY_FHGS like '''+s+'%'+'''';
      if FlatComBoBox1.Text='船名/船次' then
        Str:=Str+' where HY_CNAME like '''+s+'%'+'''';
      if FlatComBoBox1.Text='船运公司' then
        Str:=Str+' where HY_CYGS like '''+s+'%'+'''';
      if FlatComBoBox1.Text='开船时间' then
        Str:=Str+' where HY_KCSJ like '''+s+'%'+'''';
     end;
  if Flatcombobox2.Text<>trim('') then
    begin
       if FlatComBoBox1.Text='提单号' then
        Str:=Str+' where HY_TD like '''+s+'%'+''' and HY_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='发货公司' then
        Str:=Str+' where HY_FHGS like '''+s+'%'+''' and HY_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='船名/船次' then
        Str:=Str+' where HY_CNAME like '''+s+'%'+''' and HY_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='船运公司' then
        Str:=Str+' where HY_CYGS like '''+s+'%'+''' and HY_YUE ='''+Flatcombobox2.Text+'''';
      if FlatComBoBox1.Text='开船时间' then
        Str:=Str+' where HY_KCSJ like '''+s+'%'+''' and HY_YUE ='''+FlatComBoBox2.Text+'''';
    end;
    DM.HYFYQuery.Close;
    DM.HYFYQuery.SQL.Clear;
    DM.HYFYQuery.SQL.Add(Str);
    DM.HYFYQuery.Open;
    HYFYQueryForm.Close;

end;

procedure THYFYQueryForm.FlatButton3Click(Sender: TObject);
begin
  if Flatcombobox2.Enabled then
    Flatcombobox2.Enabled:=false
    else
    Flatcombobox2.Enabled:=true;
end;

end.

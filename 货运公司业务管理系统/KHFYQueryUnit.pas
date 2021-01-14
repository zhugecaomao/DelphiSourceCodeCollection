unit KHFYQueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatButtonUnit, TFlatComboBoxUnit, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit;

type
  TKHFYQueryForm = class(TForm)
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
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KHFYQueryForm: TKHFYQueryForm;

implementation

uses DMUnit;

{$R *.dfm}

procedure TKHFYQueryForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure TKHFYQueryForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.KHFYQuery.Close;
      DM.KHFYQuery.SQL.Clear;
      DM.KHFYQuery.SQL.Add('select * from KHFY');
      DM.KHFYQuery.Open;
      Exit;
    end;
  Str:='Select * from KHFY';
  S:=Edit1.Text;
   if  Flatcombobox2.Text= trim('') then
     begin
        if FlatComBoBox1.Text='提单号' then
          Str:=Str+' where KHFY_ID like '''+s+'%'+'''';
        if FlatComBoBox1.Text='发货名称' then
          Str:=Str+' where KHFY_NAME like '''+s+'%'+'''';
        if FlatComBoBox1.Text='联系人' then
          Str:=Str+' where KHFY_CALL like '''+s+'%'+'''';
        if FlatComBoBox1.Text='目的地' then
          Str:=Str+' where KHFY_MUDI like '''+s+'%'+'''';
        if FlatComBoBox1.Text='托运地址' then
          Str:=Str+' where KHFY_TYADD like '''+s+'%'+'''';
        if FlatComBoBox1.Text='业务员' then
          Str:=Str+' where KHFY_YWY like '''+s+'%'+'''';
        if FlatComBoBox1.Text='船名/船次' then
          Str:=Str+' where KHFY_CHAN like '''+s+'%'+'''';
     end;

  if Flatcombobox2.Text<> trim('') then
     begin
       if FlatComBoBox1.Text='提单号' then
          Str:=Str+' where KHFY_ID like '''+s+'%'+''' and KHFY_YUE = '''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='发货名称' then
          Str:=Str+' where KHFY_NAME like '''+s+'%'+''' and KHFY_YUE = '''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='联系人' then
          Str:=Str+' where KHFY_CALL like '''+s+'%'+''' and KHFY_YUE = '''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='目的地' then
          Str:=Str+' where KHFY_MUDI like '''+s+'%'+''' and KHFY_YUE = '''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='托运地址' then
          Str:=Str+' where KHFY_TYADD like '''+s+'%'+''' and KHFY_YUE = '''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='业务员' then
          Str:=Str+' where KHFY_YWY like '''+s+'%'+''' and KHFY_YUE = '''+Flatcombobox2.text+'''';
       if FlatComBoBox1.Text='船名/船次' then
          Str:=Str+' where KHFY_CHAN like '''+s+'%'+''' and KHFY_YUE = '''+Flatcombobox2.text+'''';
     end;
    DM.KHFYQuery.Close;
    DM.KHFYQuery.SQL.Clear;
    DM.KHFYQuery.SQL.Add(Str);
    DM.KHFYQuery.Open;
    KHFYQueryForm.Close;
end;

procedure TKHFYQueryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TKHFYQueryForm.FlatButton3Click(Sender: TObject);
begin
  if Flatcombobox2.Enabled then
    Flatcombobox2.Enabled:=false
    else
    Flatcombobox2.Enabled:=true;
end;

end.

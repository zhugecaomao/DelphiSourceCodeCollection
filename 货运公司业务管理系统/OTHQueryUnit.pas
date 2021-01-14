unit OTHQueryUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AAFont, AACtrls, TFlatButtonUnit, TFlatComboBoxUnit,
  ExtCtrls, TFlatPanelUnit;

type
  TOTHQueryForm = class(TForm)
    FlatPanel1: TFlatPanel;
    FlatComboBox1: TFlatComboBox;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    AALabel1: TAALabel;
    AALabel2: TAALabel;
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
  OTHQueryForm: TOTHQueryForm;

implementation

uses DMUnit;

{$R *.dfm}

procedure TOTHQueryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TOTHQueryForm.FlatButton2Click(Sender: TObject);
begin
close;
end;

procedure TOTHQueryForm.FlatButton1Click(Sender: TObject);
var
 str:string;
 s:string;
begin
 if (FlatComBoBox1.Text='') or (Edit1.Text='') then
    begin
      showmessage('请输入完整查询条件!');
      DM.OTHERQuery.Close;
      DM.OTHERQuery.SQL.Clear;
      DM.OTHERQuery.SQL.Add('select * from OTHER_FYXX');
      DM.OTHERQuery.Open;
      Exit;
    end;
  Str:='Select * from OTHER_FYXX';
  S:=Edit1.Text;
  if Flatcombobox2.Text=trim('')  then
    begin
      if FlatComBoBox1.Text='提单号' then
        Str:=Str+' where OTHER_ID like '''+s+'%'+'''';
      if FlatComBoBox1.Text='货名' then
        Str:=Str+' where OTHER_HUO like '''+s+'%'+'''';
      if FlatComBoBox1.Text='船名/船次' then
        Str:=Str+' where OTHER_CHAN like '''+s+'%'+'''';
      if FlatComBoBox1.Text='场站' then
        Str:=Str+' where OTHER_CHZH like '''+s+'%'+'''';
     end;
    if Flatcombobox2.Text<> trim('') then
      begin
        if FlatComBoBox1.Text='提单号' then
          Str:=Str+' where OTHER_ID like '''+s+'%'+''' and OTHER_YUE ='''+Flatcombobox2.text+'''';
        if FlatComBoBox1.Text='货名' then
          Str:=Str+' where OTHER_HUO like '''+s+'%'+''' and OTHER_YUE ='''+Flatcombobox2.text+'''';
        if FlatComBoBox1.Text='船名/船次' then
          Str:=Str+' where OTHER_CHAN like '''+s+'%'+''' and OTHER_YUE ='''+Flatcombobox2.text+'''';
        if FlatComBoBox1.Text='场站' then
          Str:=Str+' where OTHER_CHZH like '''+s+'%'+''' and OTHER_YUE ='''+Flatcombobox2.text+'''';
      end;
    DM.OTHERQuery.Close;
    DM.OTHERQuery.SQL.Clear;
    DM.OTHERQuery.SQL.Add(Str);
    DM.OTHERQuery.Open;
    OTHQueryForm.Close;

end;

procedure TOTHQueryForm.FlatButton3Click(Sender: TObject);
begin
  if Flatcombobox2.Enabled=true then
    Flatcombobox2.Enabled:=false
  else
    Flatcombobox2.Enabled:=true;
end;

end.

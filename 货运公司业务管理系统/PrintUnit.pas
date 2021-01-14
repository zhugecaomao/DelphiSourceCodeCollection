unit PrintUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TFlatButtonUnit, StdCtrls, TFlatComboBoxUnit, AAFont, AACtrls,
  ExtCtrls, TFlatPanelUnit;

type
  TPrintForm = class(TForm)
    FlatPanel1: TFlatPanel;
    AALabel1: TAALabel;
    FlatComboBox1: TFlatComboBox;
    FlatButton1: TFlatButton;
    FlatButton2: TFlatButton;
    procedure FormCreate(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

uses DMUnit, CallPrint, HYUnit, MainUnit;

{$R *.dfm}

procedure TPrintForm.FormCreate(Sender: TObject);
begin
  if DM.TEMPQuery.Active=false then
    DM.TEMPQuery.Active:=true;
    DM.TEMPQuery.Close;
    DM.TEMPQuery.SQL.Clear;
    DM.TEMPQuery.SQL.Add('select * from TEMPLATE');
    DM.TEMPQuery.Open;
    while not DM.TEMPQuery.Eof do
     begin
     FlatComBoBox1.Items.Add(DM.TEMPQuery.FieldByName('NAME').AsString);
     DM.TEMPQuery.Next;
     end;
end;

procedure TPrintForm.FlatButton1Click(Sender: TObject);
begin
  if PrintFile=1 then
  ReportDesigner(PrintForm,DM.HYFYSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=2 then
  ReportDesigner(PrintForm,DM.CDFYSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=3 then
  ReportDesigner(PrintForm,DM.DLFYSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=4 then
  ReportDesigner(PrintForm,DM.OTHERSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=5 then
  ReportDesigner(PrintForm,DM.khfysource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if printFile=6 then
  ReportDesigner(PrintForm,DM.MonthSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=7 then
  ReportDesigner(PrintForm,DM.MonthSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=8 then
  ReportDesigner(PrintForm,DM.FhxxSource,DM.TEMPSource,Flatcombobox1.Items.Strings[Flatcombobox1.ItemIndex]);
  if PrintFile=9 then
  ReportDesigner(PrintForm,DM.SHXXSource,DM.TEMPSource,Flatcombobox1.Items.Strings[Flatcombobox1.ItemIndex]);
  if PrintFile=10 then
  ReportDesigner(PrintForm,DM.HY_XXSource,DM.TEMPSource,Flatcombobox1.Items.Strings[Flatcombobox1.ItemIndex]);
  if PrintFile=11 then
  ReportDesigner(PrintForm,DM.LY_XXSource,DM.TEMPSource,Flatcombobox1.Items.Strings[Flatcombobox1.ItemIndex]);
  if PrintFile=12 then
  ReportDesigner(PrintForm,DM.DL_XXSource,DM.TEMPSource,Flatcombobox1.Items.Strings[Flatcombobox1.ItemIndex]);
  if PrintFile=13 then
  ReportDesigner(PrintForm,DM.CD_XXSource,DM.TEMPSource,Flatcombobox1.Items.Strings[Flatcombobox1.ItemIndex]);
end;

procedure TPrintForm.FlatButton2Click(Sender: TObject);
begin
  if PrintFile=1 then
   ReportPrint(PrintForm,DM.HYFYSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=2 then
    ReportPrint(PrintForm,DM.CDFYSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=3 then
   ReportPrint(PrintForm,DM.DLFYSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=4 then
    ReportPrint(PrintForm,DM.OTHERSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=5 then
    ReportPrint(PrintForm,DM.KHFYSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=6 then
    ReportPrint(PrintForm,DM.MonthSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=7 then
    ReportPrint(PrintForm,DM.MonthSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=8 then
   ReportPrint(PrintForm,DM.FhxxSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=9 then
    ReportPrint(PrintForm,DM.SHXXSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=10 then
   ReportPrint(PrintForm,DM.HY_XXSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=11 then
    ReportPrint(PrintForm,DM.LY_XXSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=12 then
    ReportPrint(PrintForm,DM.DL_XXSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
  if PrintFile=13 then
    ReportPrint(PrintForm,DM.CD_XXSource,DM.TEMPSource,FlatCombobox1.Items.Strings[FlatCombobox1.itemIndex]);
end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=cafree;
end;

end.


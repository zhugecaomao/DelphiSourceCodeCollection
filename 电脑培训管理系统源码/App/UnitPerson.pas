unit UnitPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDBForm, ComCtrls, DBCtrls, ExtCtrls, MenuBar, ToolWin,
  StdCtrls, DB, Grids, DBGrids, Mask, ExtDlgs,Clipbrd, DsFancyButton;

type
  TfrmPerson = class(TBaseDBFrm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DS: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBImage1: TDBImage;
    dcb_SEX: TDBComboBox;
    dcb_SX: TDBComboBox;
    dcb_STAR: TDBComboBox;
    Label16: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label17: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label18: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label19: TLabel;
    DBEdit4: TDBEdit;
    Label20: TLabel;
    DBEdit6: TDBEdit;
    Label21: TLabel;
    DBEdit7: TDBEdit;
    Label22: TLabel;
    DBMemo1: TDBMemo;
    Label23: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label24: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label25: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Label26: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label27: TLabel;
    DBEdit15: TDBEdit;
    Label28: TLabel;
    DBEdit16: TDBEdit;
    Label29: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    Label30: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    Label31: TLabel;
    DBEdit17: TDBEdit;
    Label32: TLabel;
    DBEdit18: TDBEdit;
    Label33: TLabel;
    DBLookupComboBox10: TDBLookupComboBox;
    Label34: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    OPD: TOpenPictureDialog;
    btnSaveAs: TDsFancyButton;
    SPD: TSavePictureDialog;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
    procedure DBEdit9DblClick(Sender: TObject);
    procedure DBEdit12DblClick(Sender: TObject);
    procedure DBEdit13DblClick(Sender: TObject);
    procedure DBEdit14DblClick(Sender: TObject);
    procedure DBMemo1DblClick(Sender: TObject);
    procedure DBEdit18DblClick(Sender: TObject);
    procedure DBEdit8DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPerson: TfrmPerson;

implementation

uses UnitDM, UnitData;

{$R *.dfm}

procedure TfrmPerson.FormShow(Sender: TObject);
begin
  inherited;
DN.DataSource.DataSet.Active:=true;
end;

procedure TfrmPerson.FormDestroy(Sender: TObject);
begin
  inherited;
DN.DataSource.DataSet.Active:=false;
end;

procedure TfrmPerson.ToolButton4Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsEdit,dsInsert] then
    DN.DataSource.DataSet.Post;

end;

procedure TfrmPerson.ToolButton1Click(Sender: TObject);
begin
  inherited;
if DN.DataSource.DataSet.State in[dsInsert] then
begin
    DN.DataSource.DataSet.FieldByName('FLAG').AsString:='Y';
    DN.DataSource.DataSet.FieldByName('OPERATOR').AsString:=sOperator;

end;
end;

procedure TfrmPerson.DBImage1DblClick(Sender: TObject);
begin
  inherited;
if OPD.Execute then
begin
    DBImage1.Picture.LoadFromFile(OPD.FileName);
    DBImage1.CopyToClipboard;
    DBImage1.PasteFromClipboard;
end;
end;

procedure TfrmPerson.btnSaveAsClick(Sender: TObject);
begin
  inherited;
if DBImage1.Field.IsNull then
    Msgs('对不起，没有图片。')
else
    if SPD.Execute then
        DBImage1.Picture.SaveToFile(SPD.FileName);

end;

procedure TfrmPerson.DBEdit9DblClick(Sender: TObject);
begin
  inherited;
ShowDetail(Sender);
end;

procedure TfrmPerson.DBEdit12DblClick(Sender: TObject);
begin
  inherited;
ShowDetail(Sender);
end;

procedure TfrmPerson.DBEdit13DblClick(Sender: TObject);
begin
  inherited;
ShowDetail(Sender);
end;

procedure TfrmPerson.DBEdit14DblClick(Sender: TObject);
begin
  inherited;
ShowDetail(Sender);
end;

procedure TfrmPerson.DBMemo1DblClick(Sender: TObject);
begin
  inherited;
ShowDetail(Sender);
end;

procedure TfrmPerson.DBEdit18DblClick(Sender: TObject);
begin
  inherited;
ShowDetail(Sender);
end;

procedure TfrmPerson.DBEdit8DblClick(Sender: TObject);
begin
  inherited;
ShowDetail(Sender);
end;

procedure TfrmPerson.FormCreate(Sender: TObject);
begin
  inherited;
AddToItem('DICT_SEX','SEX_MC',dcb_SEX.Items);
AddToItem('DICT_SX','SX_MC',dcb_SX.Items);
AddToItem('DICT_STAR','STAR_MC',dcb_STAR.Items);

end;

end.

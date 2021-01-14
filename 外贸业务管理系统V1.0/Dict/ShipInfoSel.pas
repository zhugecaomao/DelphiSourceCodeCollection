unit ShipInfoSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls;

type
  TShipInfoSel_frm = class(TBaseFrm)
    suiGroupBox1: TsuiGroupBox;
    DBGrid: TDBGridEh;
    DataSource1: TDataSource;
    Query: TADOQuery;
    suiImagePanel1: TsuiImagePanel;
    btnSel: TsuiButton;
    btnOK: TsuiButton;
    btnclose: TsuiButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtShipName: TEdit;
    txtShipEngName: TEdit;
    txtTel: TEdit;
    txtFax: TEdit;
    procedure btnSelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShipInfoSel_frm: TShipInfoSel_frm;

implementation

uses DataModule, BasePage, ShipInfo;

{$R *.dfm}

procedure TShipInfoSel_frm.btnSelClick(Sender: TObject);
VAR sqlstr, whstr :string;
begin
  inherited;
  whstr :='';
  if txtShipName.Text <> '' then
  begin
    whstr :=whstr + ' and ShipName like ''' + txtShipName.Text + '%''';
  end;
  if txtShipEngName.Text <> '' then
  begin
    whstr :=whstr + ' and ShipEngName like ''' + txtShipEngName.Text + '%''';
  end;
  if txtTel.Text <> '' then
  begin
    whstr :=whstr + ' and Tel like ''' + txtTel.Text + '%''';
  end;
  if txtFax.Text <> '' then
  begin
    whstr :=whstr + ' and Fax like ''' + txtFax.Text + '%''';
  end;
  sqlstr :='select * from ShipInfo where 1=1 ' + whstr;
  Get_Query(Query, sqlstr);
  
end;

procedure TShipInfoSel_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TShipInfoSel_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  CLOSE();
end;

procedure TShipInfoSel_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
  if Query.Active then
  begin
     
     ShipInfo_frm.Query_ini(Query.FieldByName('ShipID').AsString);
  end;
end;

procedure TShipInfoSel_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  txtShipName.Clear;
  txtShipEngName.Clear;
  txtTel.Clear;
  txtFax.Clear;
  btnSel.Click;
end;

procedure TShipInfoSel_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

end.

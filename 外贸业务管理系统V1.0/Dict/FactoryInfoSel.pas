unit FactoryInfoSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls, Menus, SUIPopupMenu;

type
  TFactoryInfoSel_frm = class(TBaseFrm)
    suiGroupBox1: TsuiGroupBox;
    DBGrid: TDBGridEh;
    DataSource1: TDataSource;
    Query: TADOQuery;
    suiImagePanel1: TsuiImagePanel;
    btnSel: TsuiButton;
    btnOK: TsuiButton;
    btnclose: TsuiButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtFactoryName: TEdit;
    txtTel: TEdit;
    txtFax: TEdit;
    btnBrower: TsuiButton;
    albtnPrint: TsuiArrowButton;
    PopupMenu1: TsuiPopupMenu;
    N2: TMenuItem;
    N1: TMenuItem;
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

  end;

var
  FactoryInfoSel_frm: TFactoryInfoSel_frm;

implementation

uses DataModule, BasePage, ShipInfo, ClientInfo, FactoryInfo;

{$R *.dfm}

procedure TFactoryInfoSel_frm.btnSelClick(Sender: TObject);
VAR sqlstr, whstr :string;
begin
  inherited;
  whstr :='';
  if txtFactoryName.Text <> '' then
  begin
    whstr :=whstr + ' and FactoryName like ''' + txtFactoryName.Text + '%''';
  end;
  if txtTel.Text <> '' then
  begin
    whstr :=whstr + ' and Tel like ''' + txtTel.Text + '%''';
  end;
  if txtFax.Text <> '' then
  begin
    whstr :=whstr + ' and Fax like ''' + txtFax.Text + '%''';
  end;
  sqlstr :='select * from FactoryInfo where 1=1 ' + whstr;
  Get_Query(Query, sqlstr);
  
end;

procedure TFactoryInfoSel_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TFactoryInfoSel_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  CLOSE();
end;

procedure TFactoryInfoSel_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
  if Query.Active then
  begin
     FactoryInfo_frm.Query_ini(Query.FieldByName('FactoryID').AsString);
  end;
end;

procedure TFactoryInfoSel_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  txtFactoryName.Clear;
  txtTel.Clear;
  txtFax.Clear;
  btnSel.Click;
end;

procedure TFactoryInfoSel_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

end.

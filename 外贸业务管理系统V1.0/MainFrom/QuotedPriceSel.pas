unit QuotedPriceSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls, Menus, SUIPopupMenu,
  Mask, DBCtrlsEh, DBLookupEh, ComCtrls, SUIStatusBar;

type
  TQuotedPriceSel_frm = class(TBaseFrm)
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
    txtClientName: TEdit;
    txtQuotedID: TEdit;
    btnBrower: TsuiButton;
    albtnPrint: TsuiArrowButton;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    txtCreator: TDBLookupComboboxEh;
    suiStatusBar1: TsuiStatusBar;
    procedure btnSelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuotedPriceSel_frm: TQuotedPriceSel_frm;

implementation

uses DataModule, BasePage, ShipInfo, ClientInfo, ProductInfo, QuotedPrice;

{$R *.dfm}

procedure TQuotedPriceSel_frm.btnSelClick(Sender: TObject);
VAR sqlstr, whstr :string;
begin
  inherited;
  whstr :='';
  if txtClientName.Text <> '' then
  begin
    whstr :=whstr + ' and ClientName like ''' + txtClientName.Text + '%''';
  end;
  if txtQuotedID.Text <> '' then
  begin
    whstr :=whstr + ' and QuotedID =''' + txtQuotedID.Text + '''';
  end;
  if txtCreator.Text <> '' then
  begin
    whstr :=whstr + ' and Creator= ''' + txtCreator.Text + '''';
  end;
  sqlstr :='select QuotedID, CreateDate,ClientID, (select ClientName from ClientInfo where ClientID=QuotedPrice.ClientID)as ClientName, '+
    'StartPort, ArriveCountry, TerminiPort, Creator from QuotedPrice '+
        ' where 1=1 ' + whstr;
  Get_Query(Query, sqlstr);
  
end;

procedure TQuotedPriceSel_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TQuotedPriceSel_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  CLOSE();
end;

procedure TQuotedPriceSel_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
end;

procedure TQuotedPriceSel_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  txtClientName.Clear;
  txtQuotedID.Clear;
  txtCreator.Clear;
  btnSel.Click;
end;

procedure TQuotedPriceSel_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TQuotedPriceSel_frm.DBGridDblClick(Sender: TObject);
begin
  inherited;
  if Query.Active then
  begin
     QuotedPrice_frm.Search_Ini(Query.FieldByName('QuotedID').AsString);
  end;

end;

end.

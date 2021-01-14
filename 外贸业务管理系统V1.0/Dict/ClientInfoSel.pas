unit ClientInfoSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls, Menus, SUIPopupMenu;

type
  TClientInfoSel_frm = class(TBaseFrm)
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
    txtTel: TEdit;
    txtFax: TEdit;
    btnBrower: TsuiButton;
    albtnPrint: TsuiArrowButton;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
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
    DataType:string;
    Flag :boolean;
  end;

var
  ClientInfoSel_frm: TClientInfoSel_frm;

implementation

uses DataModule, BasePage, ShipInfo, ClientInfo;

{$R *.dfm}

procedure TClientInfoSel_frm.btnSelClick(Sender: TObject);
VAR sqlstr, whstr :string;
begin
  inherited;
  whstr :='';
  if txtClientName.Text <> '' then
  begin
    whstr :=whstr + ' and ClientName like ''' + txtClientName.Text + '%''';
  end;
  if txtTel.Text <> '' then
  begin
    whstr :=whstr + ' and Tel like ''' + txtTel.Text + '%''';
  end;
  if txtFax.Text <> '' then
  begin
    whstr :=whstr + ' and Fax like ''' + txtFax.Text + '%''';
  end;
  sqlstr :='select * from ClientInfo where 1=1 ' + whstr;
  Get_Query(Query, sqlstr);
  
end;

procedure TClientInfoSel_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  close();
end;

procedure TClientInfoSel_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  Flag :=false;
  CLOSE();
end;

procedure TClientInfoSel_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
  if Query.Active then
  begin
     if DataType ='1' then
     else
        ClientInfo_frm.Query_ini(Query.FieldByName('ClientID').AsString);
  end;
end;

procedure TClientInfoSel_frm.FormShow(Sender: TObject);
begin
  inherited;
//
  txtClientName.Clear;
  txtTel.Clear;
  txtFax.Clear;
  btnSel.Click;
end;

procedure TClientInfoSel_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TClientInfoSel_frm.DBGridDblClick(Sender: TObject);
begin
  inherited;
  Flag :=true;
  btnOK.Click;
end;

end.

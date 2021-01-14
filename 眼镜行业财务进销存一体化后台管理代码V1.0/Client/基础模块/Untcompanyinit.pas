unit Untcompanyinit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fm_Base, StdCtrls, ExtCtrls,inifiles, Buttons, Mask, DBCtrls,db;

type
  Tfm_company = class(TfmBase)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    f:tinifile;
    procedure forminit;
  public
    { Public declarations }
  end;

var
  fm_company: Tfm_company;

implementation

uses func, untdatadm;

{$R *.dfm}
procedure Tfm_company.forminit;
begin
  dmmain.CdsCOMINFO.Close;
  dmmain.CdsCOMINFO.Open;
  dmmain.CdsCOMINFO.Edit;
end;
procedure Tfm_company.btnCancelClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfm_company.btnOkClick(Sender: TObject);
begin
  inherited;
  dmmain.CdsCOMINFO.Post;
  try
    dmmain.CdsCOMINFO.ApplyUpdates(-1); 
  except
  end;
  close;
end;

procedure Tfm_company.FormShow(Sender: TObject);
begin
  inherited;
  forminit;
end;

procedure Tfm_company.E2Exit(Sender: TObject);
begin
  inherited;
  dbedit3.Text:=selectpy(trim(dbedit2.Text));
end;

procedure Tfm_company.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmmain.CdsCOMINFO do
  begin
    if state in [dsEdit] then
    Cancel;
    close;
    data:=null;
  end;
  inherited;

end;

end.

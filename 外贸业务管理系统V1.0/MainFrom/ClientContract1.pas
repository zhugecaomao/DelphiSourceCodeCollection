unit ClientContract1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, MemTableDataEh, Db, DBGridEh, DBCtrlsEh, DBLookupEh,
  StdCtrls, SUIButton, Mask, SUIImagePanel, SUIGroupBox, ADODB, MemTableEh,
  DataDriverEh, ExtCtrls, SUIForm, GridsEh;

type
  TClientContract_frm1 = class(TBaseFrm)
    dsd_Contract: TDataSetDriverEh;
    mt_Contract: TMemTableEh;
    ds_Contract: TDataSource;
    T_Contract: TADOTable;
    Label1: TLabel;
    DBEditEh1: TDBEditEh;
    btnSave: TsuiButton;
    SGrid: TDBGridEh;
    MemTableEh1: TMemTableEh;
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientContract_frm1: TClientContract_frm1;

implementation

{$R *.dfm}

procedure TClientContract_frm1.btnSaveClick(Sender: TObject);
begin
  inherited;
  MemTableEh1.ApplyUpdates(-1);
  MemTableEh1.Post;
end;

procedure TClientContract_frm1.FormShow(Sender: TObject);
begin
  inherited;

MemTableEh1.Open;
end;

end.

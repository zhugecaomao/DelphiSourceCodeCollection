unit ShipInfoAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIImagePanel, SUIGroupBox,
  SUIRadioGroup, SUIButton;

type
  TShipInfoAdd_frm = class(TBaseFrm)
    rgroupType: TsuiRadioGroup;
    btnOK: TsuiButton;
    btncancel: TsuiButton;
    procedure btnOKClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    AddValue :string;
  end;

var
  ShipInfoAdd_frm: TShipInfoAdd_frm;

implementation

{$R *.dfm}

procedure TShipInfoAdd_frm.btnOKClick(Sender: TObject);
begin
  inherited;
  if rgroupType.ItemIndex >=0 then
  begin
     AddValue :=inttostr(rgroupType.ItemIndex + 1);
     close();
  end
  else
  begin
    showmessage('请选择增加类型');
  end;
//
end;

procedure TShipInfoAdd_frm.btncancelClick(Sender: TObject);
begin
  inherited;
  AddValue :='';
  close();
//
end;

end.

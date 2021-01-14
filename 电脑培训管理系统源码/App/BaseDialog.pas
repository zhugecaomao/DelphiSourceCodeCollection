unit BaseDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, MenuBar, ToolWin, ExtCtrls, StdCtrls,
  DsFancyButton, BaseForm;

type
  TBaseDialogFrm = class(TBaseFrm)
    Panel_button: TPanel;
    Bevel_button: TBevel;
    OKBtn: TDsFancyButton;
    CancelBtn: TDsFancyButton;
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseDialogFrm: TBaseDialogFrm;

implementation

{$R *.dfm}

procedure TBaseDialogFrm.CancelBtnClick(Sender: TObject);
begin
  inherited;
Close ;
end;

end.

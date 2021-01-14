unit ufrmModifyDataBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBase, ImgList, ComCtrls, ToolWin, ActnList, DB, StdCtrls,
  Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib, ADODB, CSADOQuery;

type
  TfrmModifyDataBase = class(TfrmBase)
    bbtnConfirm: TBitBtn;
    bbtnCancel: TBitBtn;
    procedure OnAllChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmModifyDataBase: TfrmModifyDataBase;

implementation

{$R *.dfm}

{ TfrmModifyDataBase }

procedure TfrmModifyDataBase.OnAllChange(Sender: TObject);
begin
  bbtnConfirm.Enabled := True;
end;

procedure TfrmModifyDataBase.prop_IniInterFace;
begin
  inherited;
  Position := poScreenCenter;
end;

procedure TfrmModifyDataBase.FormShow(Sender: TObject);
var
  li_I: Integer;
begin
  inherited;
  for li_I := 0 to ControlCount - 1 do
  begin
    prop_SetOnChange(Controls[li_I], OnAllChange);
  end;
  bbtnConfirm.Enabled := Ri_Flag = 3;
end;

procedure TfrmModifyDataBase.bbtnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmModifyDataBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    27:
    begin
      bbtnCancel.Click;
    end;
  end;
end;

end.

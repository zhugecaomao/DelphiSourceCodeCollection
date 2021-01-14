unit C_Klsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DosMove, DB, DBTables, StdCtrls, Buttons, ExtCtrls, C_CtDefine;

type
  TKlszForm = class(TForm)
    Panel1: TPanel;
    lblTitile: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Bevel1: TBevel;
    edtOldPass: TLabeledEdit;
    edtNewPass: TLabeledEdit;
    Panel3: TPanel;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    tblYgda: TTable;
    DosMove1: TDosMove;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FYgbh: string;
  public
    { Public declarations }
  end;

var
  KlszForm: TKlszForm;

procedure Klsz(const AYgbh: string);

implementation

{$R *.dfm}

procedure Klsz(const AYgbh: string);
begin
  KlszForm := TKlszForm.Create(Application);
  try
    with KlszForm do
    begin
      FYgbh := AYgbh;
      tblYgda.Open;
      ShowModal;
    end;
  finally
    KlszForm.tblYgda.Close;
    KlszForm.Free;
  end;
end;


procedure TKlszForm.btnOKClick(Sender: TObject);
var
  OldPass,NewPass: string;
begin
  inherited;
  OldPass := edtOldPass.Text;
  NewPass := edtNewPass.Text;
  if tblYgda.FindKey([FYgbh]) then
  begin
    if OldPass = tblYgda.FieldByName('D_KL').AsString then
    begin
      tblYgda.Edit;
      tblYgda.FieldByName('D_KL').AsString := NewPass;
      tblYgda.Post;
      ShowInfo('口令设置成功！');
      Close;
    end
    else
      ShowWarning('旧口令不正确！');
  end;
end;

end.

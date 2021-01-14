unit C_cttc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, DosMove;

type
  TCttcForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnOK: TBitBtn;
    btnCanc: TBitBtn;
    DBText1: TDBText;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    DosMove1: TDosMove;
    procedure btnCancClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  CttcForm: TCttcForm;

procedure Cttc;

implementation

uses C_ctdc;

{$R *.dfm}

procedure Cttc;
begin
  CttcForm := TCttcForm.Create(Application);
  try
    with CttcForm do
    begin
      CtdcForm.tblDcmx.Edit;
      ShowModal;
    end;
  finally
    CttcForm.Free;
  end;

end;

procedure TCttcForm.btnCancClick(Sender: TObject);
begin
  CtdcForm.tblDcmx.Cancel;
end;

procedure TCttcForm.btnOKClick(Sender: TObject);
begin
  with CtdcForm do
  begin
    tblDcmx.Post;
  end;
  Close;
end;

procedure TCttcForm.FormShow(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

end.

unit Unitvalueadd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib;

type
  TFormvalueadd = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    dxsl: TdxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edmc: TEdit;
    Edlx: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dxslKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formvalueadd: TFormvalueadd;

implementation
uses UDM;
{$R *.dfm}

procedure TFormvalueadd.FormShow(Sender: TObject);
begin
  Edmc.Enabled:=False;
  Edlx.Enabled:=False;

  dm.ADOl_assist.Open;
  dm.ADOalllname.Open;
end;

procedure TFormvalueadd.Button1Click(Sender: TObject);
begin
  if dxsl.Value <> 0 then
  begin
   try
     dm.adocon1.BeginTrans;
     dm.ADOl_assist.Edit;
     dm.ADOl_assistJE.Value:=dm.sl+dxsl.Value;
     dm.ADOl_assist.Post;
     dm.adocon1.CommitTrans;
     except
       dm.adocon1.RollbackTrans;
    end;
  end;
  close;
end;

procedure TFormvalueadd.dxslKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
 Button1Click(Sender); 
end;

end.

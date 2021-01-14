unit Ftrainresult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  Ttrainresult = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    cxLookupComboBox1: TcxLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  trainresult: Ttrainresult;

implementation

uses Fmain;
{$R *.dfm}

procedure Ttrainresult.Button1Click(Sender: TObject);
begin
  close
end;

procedure Ttrainresult.Button2Click(Sender: TObject);
begin
  if self.cxLookupComboBox1.Text='' then
    begin
      MessageBox(handle,'«Î—°‘Ò“ªœÓ≈‡—µøŒƒø£°','¥ÌŒÛ',MB_ICONERROR or MB_OK);
      exit;
    end;
  main.r_staffteachid.Append;
  main.r_staffteachid.FieldByName('teachid').AsString:=self.cxLookupComboBox1.EditValue;
  main.r_staffteachid.Post;
  main.r_staffteachid.Close;
  main.r_staffteachid.Open;
  self.Close;
end;

end.

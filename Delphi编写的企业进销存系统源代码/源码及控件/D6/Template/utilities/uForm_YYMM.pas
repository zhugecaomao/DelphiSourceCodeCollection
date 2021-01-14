unit uForm_YYMM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin,utilities;

type
  TForm_YYMM = class(TForm)
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_YYMM: TForm_YYMM;

implementation

{$R *.DFM}

procedure TForm_YYMM.FormCreate(Sender: TObject);
var
  yyyy,mm,dd: Word;
begin
  DecodeDate(date,yyyy,mm,dd);
  SpinEdit1.Value :=yyyy;
  ComboBox1.Text := inttostring(mm,2);
end;

procedure TForm_YYMM.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
     Modalresult := mrok;
end;

end.

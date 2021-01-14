unit SetCal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, dbclient, db, Buttons;

type
  TCalcState = (csFirst, csValid, csError);

  TfrmSetCal = class(TForm)
    Shape2: TShape;
    Button7: TSpeedButton;
    Button8: TSpeedButton;
    Button9: TSpeedButton;
    DivideButton: TSpeedButton;
    Button4: TSpeedButton;
    Button1: TSpeedButton;
    Button0: TSpeedButton;
    ClearButton: TSpeedButton;
    Button2: TSpeedButton;
    PointButton: TSpeedButton;
    Button6: TSpeedButton;
    MultiplyButton: TSpeedButton;
    Button3: TSpeedButton;
    MinusButton: TSpeedButton;
    NegativeButton: TSpeedButton;
    BackButton: TSpeedButton;
    EqualButton: TSpeedButton;
    PlusButton: TSpeedButton;
    DisplayPanel: TPanel;
    Button5: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NegativeButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure PointButtonClick(Sender: TObject);
    //My
    procedure DoCalc(Sender: TObject);
    procedure NumberButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CalcState: TCalcState;
    Operator: Char;
    Operand: Extended;
    Negative: Boolean;
    Number: string;
    procedure SetNumber(Value : string);
  public
    { Public declarations }
		DataSet: TDataset;
    FieldName: string;
  end;

const
  DisplayDigits = 15;   // Number of digits in calculator display
  ZeroStr : string = '0';

var
  frmSetCal: TfrmSetCal;

implementation

{$R *.DFM}

//Form.Show
procedure TfrmSetCal.FormShow(Sender: TObject);
begin
  ClearButton.Click;
end;

//Form.KeyPress
procedure TfrmSetCal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case UpCase(Key) of
    '+' : DoCalc(PlusButton);
    '-' : DoCalc(MinusButton);
    '*' : DoCalc(MultiplyButton);
    '/' : DoCalc(DivideButton);
    '=' : DoCalc(EqualButton);
    '0'..'9' : NumberButtonClick(FindComponent('Button' + Key));
    '_' : NegativeButtonClick(Sender);
    #8  : BackButtonClick(Sender);
    'C' : ClearButtonClick(Sender);
  else
    if Key = DecimalSeparator then PointButton.Click;
  end;
end;

//Form.KeyDown
procedure TfrmSetCal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close
  else if Key = VK_RETURN then
  begin
    Key := 0;
    DoCalc(EqualButton);
  end;
end;

//DoCalc
procedure TfrmSetCal.DoCalc(Sender: TObject);
var
  Value : Extended;
  Key : Char;

  procedure Error; // Sets error state
  begin
    CalcState := csError;
    DisplayPanel.Caption := 'Errore';
  end; { Error }

begin
  if (Sender = EqualButton) and (EqualButton.Caption = '确认') then
  begin
    DataSet.Edit;
    DataSet.FieldByName(FieldName).AsFloat := StrToFloat(DisplayPanel.Caption);
    Close;
  end;

  EqualButton.Caption := '=';

  if CalcState = csError then Exit;

  // First char of button caption
  Key := (Sender as TSpeedButton).Caption[1];

  Value := StrToFloat(Number);
  if Negative then Value := -Value;

  if CalcState = csValid then
  begin
    CalcState := csFirst;

    if Key = '%' then
      case Operator of
        '+' : Value := Operand * Value / 100;
        '-' : Value := Operand * Value / 100;
        '*' : Value := Value / 100;
        '/' : Value := Value / 100;
      end;

    case Operator of
      '+' : Value := Operand + Value;
      '-' : Value := Operand - Value;
      '*' : Value := Operand * Value;
      '/' : if Value = 0 then begin
               Error;
               Exit;
            end else
               Value := Operand / Value;
    end;
  end; // CalcState

//My +
  Value := StrToFloat(FormatFloat('0.###', Value));

  Operand := Value;
  Operator := Key;
  Negative := Value < 0;
  if Negative then Value := -Value;
  Number := LowerCase(FloatToStr(Value));

  if Length(Number) > DisplayDigits then
     Error
  else SetNumber(Format('%f',[Value]));

  if Sender = EqualButton then
    EqualButton.Caption := '确认';

end;

//NumberButtonClick
procedure TfrmSetCal.NumberButtonClick(Sender: TObject);
var
  C : Char;
begin
  if CalcState = csError then Exit;

  C := (Sender as TSpeedButton).Name[Length((Sender as TSpeedButton).Name)];

  if CalcState = csFirst then
     begin
       CalcState := csValid;
       Negative := False;
       Number := C;
     end
  else if Length(Number) < DisplayDigits then
     begin
       if Number = ZeroStr then
         Number := C
       else
         Number := Number + C;
     end;
  DisplayPanel.Caption := Number;
end;

//NegativeButton.Click
procedure TfrmSetCal.NegativeButtonClick(Sender: TObject);
begin
  if CalcState = csError then Exit;
  Negative := not Negative;
  Number := Number;
  DisplayPanel.Caption := Number;
end;

//BackButtonClickClick
procedure TfrmSetCal.BackButtonClick(Sender: TObject);
begin
  if CalcState = csError then Exit;
  if CalcState = csValid then
  begin
    Number := Copy(Number, 1, Length(Number) - 1);
    if Number = '' then Number := ZeroStr;
  end;
  DisplayPanel.Caption := Number;
end;

//ClearButton.Click
procedure TfrmSetCal.ClearButtonClick(Sender: TObject);
begin
  EqualButton.Caption := '=';
  CalcState := csFirst;
  Operand := 0;
  Operator := '=';
  Negative := False;
  Number := ZeroStr;
  DisplayPanel.Caption := Number;
end;

//PointButton.Click
procedure TfrmSetCal.PointButtonClick(Sender: TObject);
begin
  if CalcState = csError then Exit;
  if CalcState = csFirst then
  begin
    CalcState := csValid;
    Negative := False;
    Number := ZeroStr;
  end;
  if (Pos(DecimalSeparator, Number) = 0) and (Length(Number) < DisplayDigits) then
    Number := Number + DecimalSeparator;
  DisplayPanel.Caption := Number;
end;

//SetNumber
procedure TfrmSetCal.SetNumber(Value: string);
begin
  Number := Value;
  if Negative then Value := '-' + Value;
//My  DisplayPanel.Caption := Value;
  DisplayPanel.Caption := FormatFloat('0.###', StrToFloat(Value));
end;

end.

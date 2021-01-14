unit SetDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, dbclient, db, Variants;

type
  TfrmSetDate = class(TForm)
    MonthCalendar1: TMonthCalendar;
    Shape1: TShape;
    Panel1: TPanel;
    Shape2: TShape;
    btnOk: TButton;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Edit1: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
		DataSet: TDataset;
    FieldName: string;
    CurDate: TDateTime;
  end;

var
  frmSetDate: TfrmSetDate;

implementation

uses Common, Main;

{$R *.DFM}

procedure TfrmSetDate.FormShow(Sender: TObject);
var
  v: Variant;
begin
  if CurDate <> 0 then
    MonthCalendar1.Date := CurDate
  else
    MonthCalendar1.Date := Date;
  v := GetFieldValue('select DEFAULDATE from AppDate where uId = ' + IntToStr(pintUserId) + ' and ' +
    'DATASET = ''' + DataSet.Name + ''' and ' +
    'FIELDNAME = ''' + FieldName + '''');
  if v = null then
    RadioButton3.Checked := true
  else if VarToStr(v) = '1' then
    RadioButton1.Checked := true
  else
    RadioButton2.Checked := true;
  Edit1.SetFocus;
end;

procedure TfrmSetDate.btnOkClick(Sender: TObject);
var
  strTmp: string;
begin
  if RadioButton3.Checked then
    SqlExec('delete from AppDate where uId = ' + IntToStr(pintUserId) + ' and ' +
      'DATASET = ''' + DataSet.Name + ''' and ' +
      'FIELDNAME = ''' + FieldName + '''')
  else begin
    if RadioButton1.Checked then
      strTmp := '1'
    else
      strTmp := '2';
    if not CheckRecord('select * from AppDate where uId = ' + IntToStr(pintUserId) + ' and ' +
      'DATASET = ''' + DataSet.Name + ''' and ' +
      'FIELDNAME = ''' + FieldName + '''') then
      SqlExec('insert into AppDate (uId, DATASET, FIELDNAME, SETDATE, DEFAULDATE) ' +
        'values (' + IntToStr(pintUserId) + ', ''' + DataSet.Name + ''', ''' + FieldName + ''', ' +
        '0, ' + strTmp + ')')
    else
      SqlExec('update AppDate set DEFAULDATE = ' + strTmp);
  end;
  DataSet.Edit;
  DataSet.FieldByName(FieldName).AsDateTime := MonthCalendar1.Date;
  Close;
end;

procedure TfrmSetDate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP: MonthCalendar1.Date := MonthCalendar1.Date - 7;
    VK_DOWN: MonthCalendar1.Date := MonthCalendar1.Date + 7;
    VK_LEFT: MonthCalendar1.Date := MonthCalendar1.Date - 1;
    VK_RIGHT: MonthCalendar1.Date := MonthCalendar1.Date + 1;
    VK_PRIOR: MonthCalendar1.Date := MonthCalendar1.Date - 30;
    VK_NEXT: MonthCalendar1.Date := MonthCalendar1.Date + 30;
    VK_ESCAPE: Close;
  end;
end;

end.

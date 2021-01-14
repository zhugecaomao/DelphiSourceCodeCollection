unit Fpaycalculate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB;

type
  Tpaycalculate = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1ID: TAutoIncField;
    ADOQuery1name: TWideStringField;
    ADOQuery1ename: TWideStringField;
    ADOQuery1staffid: TWideStringField;
    ADOQuery1sex: TWideStringField;
    ADOQuery1idnum: TWideStringField;
    ADOQuery1classcodeID: TIntegerField;
    ADOQuery1intime: TDateTimeField;
    ADOQuery1birthday: TDateTimeField;
    ADOQuery1ifmarriage: TWideStringField;
    ADOQuery1Nationality: TWideStringField;
    ADOQuery1Nativeplace: TWideStringField;
    ADOQuery1Residence: TWideStringField;
    ADOQuery1exigenceman: TWideStringField;
    ADOQuery1exigencephone: TWideStringField;
    ADOQuery1knowledge: TWideStringField;
    ADOQuery1School: TWideStringField;
    ADOQuery1forlang: TWideStringField;
    ADOQuery1howforlang: TWideStringField;
    ADOQuery1Address: TWideStringField;
    ADOQuery1Telephone: TWideStringField;
    ADOQuery1Email: TWideStringField;
    ADOQuery1imemo: TWideStringField;
    ADOQuery1delrecy: TWideStringField;
    ADOQuery1branchid: TIntegerField;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  paycalculate: Tpaycalculate;

implementation

uses fmain;

{$R *.dfm}

procedure Tpaycalculate.Button2Click(Sender: TObject);
begin
  close
end;

procedure Tpaycalculate.FormCreate(Sender: TObject);
begin
  self.DateTimePicker1.Date:=now;
  self.DateTimePicker2.Date:=now;
end;

procedure Tpaycalculate.Button1Click(Sender: TObject);
begin
  if self.DateTimePicker1.Date>self.DateTimePicker2.Date then
    begin
      MessageBox(handle,'日期选择有误！','错误',MB_ICONERROR or MB_OK);
      exit;
    end;
  main.tmpquery.Close;
  main.tmpquery.SQL.Clear;
  main.tmpquery.SQL.Add('select * from r_staffpay where 1=1');
  //main.tmpquery.SQL.Add('and pstardate>'''+datetostr(self.DateTimePicker1.Date)+'''');
  //main.tmpquery.SQL.Add('and penddate<'''+datetostr(self.DateTimePicker2.Date)+'''');
  main.tmpquery.Open;
  self.Close;
end;

end.

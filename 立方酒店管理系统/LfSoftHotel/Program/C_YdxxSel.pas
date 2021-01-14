unit C_YdxxSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_Select, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TYdxxSelForm = class(TSelectForm)
    btnNew: TBitBtn;
    CheckBox1: TCheckBox;
    procedure btnNewClick(Sender: TObject);
    procedure dbgSelectDblClick(Sender: TObject);
    procedure btnLocaClick(Sender: TObject);
    procedure dsSelectDataChange(Sender: TObject; Field: TField);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    FKrbh: string;
    FBd,FEd: string;
  public
    { Public declarations }
  end;

var
  YdxxSelForm: TYdxxSelForm;

function YdxxSel: string;

implementation

uses C_Ydxx;

{$R *.dfm}

function YdxxSel: string;
var
  s : string;
begin
  YdxxSelForm := TYdxxSelForm.Create(Application);
  try
    with YdxxSelForm do
    begin
      FBd := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Date))),12);
      FEd := IntToHex(Trunc(TimeStampToMSecs(DateTimeToTimeStamp(Now))),12);
      s := 'select * from YDXX where (D_KRBH>="'+FBd+'")and(D_KRBH<="'+FEd+'") order by D_KRBH';
      qrySelect.Close;
      qrySelect.SQL.Clear;
      qrySelect.SQL.Add(s);
      qrySelect.Open;
      ShowModal;
      if ModalResult = mrOK then
        Result := FKrbh
      else
        Result := '';
    end;
  finally
    YdxxSelForm.qrySelect.Close;
    YdxxSelForm.Free;
  end;

end;
procedure TYdxxSelForm.btnNewClick(Sender: TObject);
begin
  inherited;
  Ydxx;
  qrySelect.Close;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add('select * from YDXX order by D_KRBH');
  qrySelect.Open;
  qrySelect.Last;
  ModalResult := mrOK;
end;

procedure TYdxxSelForm.dbgSelectDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

procedure TYdxxSelForm.btnLocaClick(Sender: TObject);
var
  LocaFieldName: string;
begin
  inherited;
  if cmbExpress.ItemIndex = 0 then
  begin
    if cmbOption.ItemIndex = 0 then
      LocaFieldName := 'D_KRXM'
    else
      LocaFieldName := 'D_DWMC';
    with qrySelect do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from YDXX where '+LocaFieldName+' like "%'+edtValue.Text+'%"');
      Open;
    end;
    //qrySelect.Locate(LocaFieldName,edtValue.Text,[loPartialKey])
  end;
end;

procedure TYdxxSelForm.dsSelectDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  FKrbh := qrySelect.FieldByName('D_KRBH').AsString;
end;

procedure TYdxxSelForm.CheckBox1Click(Sender: TObject);
var
  s : string;
begin
  inherited;
  if CheckBox1.Checked then
    s := 'select * from YDXX where (D_KRBH>="'+FBd+'")and(D_KRBH<="'+FEd+'") order by D_KRBH'
  else
    s := 'select * from YDXX order by D_KRBH';
  qrySelect.Close;
  qrySelect.SQL.Clear;
  qrySelect.SQL.Add(s);
  qrySelect.Open;  
end;

end.

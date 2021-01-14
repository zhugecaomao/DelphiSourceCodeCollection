unit uFM_SEP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Db, DBTables;

type
  TFM_SEP = class(TS_Form)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Query1: TQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Query1AutoNo: TIntegerField;
    Query1BDEDesigner: TStringField;
    Query1BDEDesigner2: TStringField;
    Query1BDEDesigner3: TStringField;
    Query1BDEDesigner4: TStringField;
    Query1BDEDesigner5: TStringField;
    Label5: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    iF01,iF02,iF03,iF04,iF05:String;
    { Public declarations }
  end;

var
  FM_SEP: TFM_SEP;

function SelProd(inF01,inF02,inF03,inF04,inF05:String;var iOut:Integer; sWhere:string=''):Boolean;

implementation

{$R *.DFM}

function SelProd(inF01,inF02,inF03,inF04,inF05:String;var iOut:Integer; sWhere:string=''):Boolean;
var
  xFM:TFM_SEP;
begin
  Result := false;
  xFM := TFM_SEP.Create(Application);
  try
    xFM.Query1.Close;
    xFM.Query1.SQL.Add(sWhere);
    xFM.iF01 := inF01;
    xFM.iF02 := inF02;
    xFM.iF03 := inF03;
    xFM.iF04 := inF04;
    xFM.iF05 := inF05;
    xFM.Query1.Open;
    if xFM.ShowModal=mrOK then
    begin
      iOut := xFM.Query1.Fields[0].asinteger;
      Result := True;
    end;
  finally
    xFM.free;
  end;


end;



procedure TFM_SEP.FormCreate(Sender: TObject);
begin
 // inherited;
 Width:=680; Height:=480;
end;

procedure TFM_SEP.Edit1Exit(Sender: TObject);
begin
  inherited;
  With Query1 do
  begin
    Close;
    if TEdit(Sender).Text='' then
      ParamByName('sF0'+IntToStr(TEdit(Sender).Tag)).AsString := '%'
    else
      ParamByName('sF0'+IntToStr(TEdit(Sender).Tag)).AsString := TEdit(Sender).Text;
    Open;
  end;

end;

procedure TFM_SEP.FormShow(Sender: TObject);
begin
  inherited;
  Edit1.text := iF01;
  Edit2.text := iF02;
  Edit3.text := iF03;
  Edit4.text := iF04;
  Edit5.text := iF05;
end;

procedure TFM_SEP.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BitBtn1.Click;
end;

end.

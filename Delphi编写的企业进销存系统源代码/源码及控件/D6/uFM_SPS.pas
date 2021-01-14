unit uFM_SPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  US_FM, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Db,
  DBTables;

type
  TFM_SPS = class(TS_Form)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query2: TQuery;
    DataSource2: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  FM_SPS: TFM_SPS;
  No,MNo:string;
  SNo:integer;
//sOut[µ•∫≈],sOut1[‘≠¡œ±‡∫≈],iOut[∞Î∫≈∆∑±‡∫≈]
function SelProdSemi(var sOut, sOut1:string;var iOut:integer):Boolean;
implementation

{$R *.DFM}

function SelProdSemi(var sOut, sOut1:string;var iOut:integer):Boolean;
var
  xFM:TFM_SPS;
begin
  Result := false;
  xFM := TFM_SPS.Create(Application);
  try
    if xFM.ShowModal=mrOK then
    begin
      sOut := No;
      sOut1 := MNo ;
      iOut := SNo;
      Result := True;
    end
  finally
   // xFM.free;
  end;
end;

procedure TFM_SPS.FormCreate(Sender: TObject);
begin
  //inherited;
  Height := 330;        width := 480;
  DBGrid2.Columns[1].Width := 0;
end;

procedure TFM_SPS.BitBtn1Click(Sender: TObject);
begin
  inherited;
  No := Query1.Fields[0].asstring;
  MNo := Query1.Fields[1].asstring;
  SNo := 0;
end;

procedure TFM_SPS.BitBtn3Click(Sender: TObject);
begin
  inherited;
  No := Query2.Fields[0].asstring;
  MNo := '';
  SNo := Query2.Fields[1].asInteger;
end;

procedure TFM_SPS.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BitBtn1.Click;
end;

procedure TFM_SPS.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  BitBtn3.Click;
end;

procedure TFM_SPS.FormShow(Sender: TObject);
begin
  inherited;
  Query1.Close;
  Query1.Open;
  Query2.Close;
  Query2.Open;
end;

end.

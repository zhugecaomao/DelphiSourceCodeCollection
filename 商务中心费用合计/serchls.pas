unit serchls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, ComCtrls, ImgList, DB, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls;

type
  Tfrmserchls = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    r2: TdxDBGrid;
    personid2: TdxDBGridColumn;
    personid3: TdxDBGridColumn;
    personid4: TdxDBGridColumn;
    personid5: TdxDBGridColumn;
    personid6: TdxDBGridColumn;
    personid7: TdxDBGridColumn;
    personid8: TdxDBGridColumn;
    personid9: TdxDBGridColumn;
    personid10: TdxDBGridColumn;
    personid11: TdxDBGridColumn;
    personid16: TdxDBGridColumn;
    personid17: TdxDBGridColumn;
    personidr2Column13: TdxDBGridColumn;
    personidr2Column14: TdxDBGridColumn;
    personidr2Column15: TdxDBGridColumn;
    personidr2Column16: TdxDBGridColumn;
    personidr2Column17: TdxDBGridColumn;
    personidr2Column18: TdxDBGridColumn;
    personidr2Column20: TdxDBGridColumn;
    personidr2Column21: TdxDBGridColumn;
    r3: TdxDBGrid;
    personidr3Column1: TdxDBGridColumn;
    personidr3Column2: TdxDBGridColumn;
    personidr3Column3: TdxDBGridColumn;
    personidr3Column4: TdxDBGridColumn;
    personidr3Column5: TdxDBGridColumn;
    personidr3Column6: TdxDBGridColumn;
    personidr3Column7: TdxDBGridColumn;
    personidr3Column8: TdxDBGridColumn;
    personidr3Column10: TdxDBGridColumn;
    personidr3Column12: TdxDBGridColumn;
    personidr3Column11: TdxDBGridColumn;
    personidr3Column13: TdxDBGridColumn;
    personidr3Column14: TdxDBGridColumn;
    personidr3Column15: TdxDBGridColumn;
    personidr3Column16: TdxDBGridColumn;
    personidr3Column17: TdxDBGridColumn;
    personidr3Column18: TdxDBGridColumn;
    personidr3Column19: TdxDBGridColumn;
    personidr3Column20: TdxDBGridColumn;
    personidr3Column21: TdxDBGridColumn;
    DSkrls: TDataSource;
    DSbuls: TDataSource;
    ImageList1: TImageList;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    r3Column21: TdxDBGridColumn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmserchls: Tfrmserchls;

implementation
uses UDM;
{$R *.dfm}

procedure Tfrmserchls.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmserchls.BitBtn1Click(Sender: TObject);
begin
    dm.ADObmls.Active:=True;
    dm.ADOkrls.Active:=True;
    with dm.ADObmls do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from center');
      SQL.Add('where t_time between :ksj and :jsj and lx=''1''');
      Parameters.ParamByName('ksj').Value:=DateTimePicker1.Date;
      Parameters.ParamByName('jsj').Value:=DateTimePicker2.Date;
      Prepared;
      Open;
    end;


    with dm.ADOkrls do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from tableforpeople');
      SQL.Add('where rq between :krq and :jrq and lx=''1''');
      Parameters.ParamByName('krq').Value:=DateTimePicker1.Date;
      Parameters.ParamByName('jrq').Value:=DateTimePicker2.Date;
      Prepared;
      Open;
    end;

end;

procedure Tfrmserchls.FormShow(Sender: TObject);
begin
  dm.ADObmls.Open;
  dm.ADOkrls.Open;
end;

procedure Tfrmserchls.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm.ADObmls.Close;
   dm.ADOkrls.Close;
end;

end.

unit Ujiage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls,
  ComCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid;

type
  TFjiage = class(TForm)
    Panel1: TPanel;
    DSbmjiage: TDataSource;
    DSkrjiage: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1Column2: TdxDBGridColumn;
    dxDBGrid1Column3: TdxDBGridColumn;
    dxDBGrid1Column1: TdxDBGridColumn;
    TabSheet2: TTabSheet;
    dxDBGrid2: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    wwDBGrid1: TwwDBGrid;
    DSallname: TDataSource;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fjiage: TFjiage;

implementation
uses UDM;
{$R *.dfm}

procedure TFjiage.SpeedButton4Click(Sender: TObject);
begin
  close;
end;

procedure TFjiage.SpeedButton1Click(Sender: TObject);
begin
 PageControl1.TabIndex:=0;
 with dm.Qbdanjia do
 begin
   Close;
   sql.Clear;
   sql.Add('select * from danjia');
   sql.Add('where lx=''部门''');
   Prepared;
   Open;
 end;

end;

procedure TFjiage.SpeedButton2Click(Sender: TObject);
begin
 PageControl1.TabIndex:=1;
 with dm.Qjkiage do
 begin
   Close;
   sql.Clear;
   sql.Add('select * from danjia');
   sql.Add('where lx=''客人''');
   Prepared;
   Open;
 end;

end;

end.

unit GZGL_ZZTJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Buttons, ComCtrls,
  Mask, DBCtrls, dbcgrids;

type
  TFrmGZGL_ZZTJ = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBCtrlGrid1: TDBCtrlGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    Label18: TLabel;
    btn_addJH: TSpeedButton;
    Btn_addall: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btn_addJHClick(Sender: TObject);
    procedure Btn_addallClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_ZZTJ: TFrmGZGL_ZZTJ;

implementation

uses GZGL_DModule, Umyfunction, GZGL_Main;

{$R *.dfm}

procedure TFrmGZGL_ZZTJ.FormCreate(Sender: TObject);
begin
  ClearEDT(SELF);
  Image1.Picture:=FRMGZGL_Main.IMG_LOGO.Picture;
end;

procedure TFrmGZGL_ZZTJ.FormShow(Sender: TObject);
var
  s:string;
begin
  with dmd do begin
    tbl_zzjh.open;
  end;

  s:='select * from 工装 where ZT="在制" ';
  with dmd.qry_gz do begin
    close;
    sql.clear;
    sql.Add(s);
    try
      open;
    except
      execsql;
    end;
    memo1.Lines.add('统计时间：'+datetostr(now));
    memo1.Lines.add('统计目标：在制工装');
    memo1.Lines.add('统计结果：共 '+inttostr(recordcount)+' 套');
  end;
end;


procedure TFrmGZGL_ZZTJ.btn_addJHClick(Sender: TObject);
begin
  with dmd do begin
    if qry_gz.fieldValues['GZBH']<>'' then begin
      tbl_zzjh.Append;
      tbl_zzjh.FieldValues['GZBH'] := qry_gz.FieldValues['GZBH'];
      tbl_zzjh.FieldValues['GZMC'] := qry_gz.FieldValues['GZMC'];
      tbl_zzjh.FieldValues['RWSH'] := qry_gz.FieldValues['RWSH'];
      tbl_zzjh.FieldValues['DHDW'] := qry_gz.FieldValues['DHDW'];
      tbl_zzjh.Post;
    end;
  end;
end;

procedure TFrmGZGL_ZZTJ.Btn_addallClick(Sender: TObject);
begin
  with dmd do begin
    qry_gz.first;
    while not qry_gz.Eof do begin
      if qry_gz.fieldValues['GZBH']<>'' then begin
        tbl_zzjh.Append;
        tbl_zzjh.FieldValues['GZBH'] := qry_gz.FieldValues['GZBH'];
        tbl_zzjh.FieldValues['GZMC'] := qry_gz.FieldValues['GZMC'];
        tbl_zzjh.FieldValues['RWSH'] := qry_gz.FieldValues['RWSH'];
        tbl_zzjh.FieldValues['DHDW'] := qry_gz.FieldValues['DHDW'];
        tbl_zzjh.Post;
      end;
      qry_gz.Next;
    end;
  end;
end;

procedure TFrmGZGL_ZZTJ.DBGrid1DblClick(Sender: TObject);
begin
  btn_addJHClick(Sender);
end;



end.

unit Unitsumvalues;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ImgList, ComCtrls, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  DB, StdCtrls, ExtCtrls, Menus, dxEditor, dxEdLib, Buttons;

type
  TF_sumvalues = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    il1: TImageList;
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
    r1: TdxDBGrid;
    personidr1Column2: TdxDBGridColumn;
    personidr1Column3: TdxDBGridColumn;
    personidr1Column4: TdxDBGridColumn;
    personidr1Column5: TdxDBGridColumn;
    personidr1Column6: TdxDBGridColumn;
    personidr1Column8: TdxDBGridColumn;
    personidr1Column7: TdxDBGridColumn;
    personidr1Column9: TdxDBGridColumn;
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
    r4: TdxDBGrid;
    personidr4Column1: TdxDBGridColumn;
    personidr4Column2: TdxDBGridColumn;
    personidr4Column3: TdxDBGridColumn;
    personidr4Column4: TdxDBGridColumn;
    personidr4Column5: TdxDBGridColumn;
    personidr4Column6: TdxDBGridColumn;
    personidr4Column7: TdxDBGridColumn;
    personidr4Column8: TdxDBGridColumn;
    personidr4Column9: TdxDBGridColumn;
    personidr4Column10: TdxDBGridColumn;
    il2: TImageList;
    ds1: TDataSource;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pnl2: TPanel;
    N4: TMenuItem;
    btn1: TSpeedButton;
    ds2: TDataSource;
    Panel1: TPanel;
    tv1: TTreeView;
    tv2: TTreeView;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    N5: TMenuItem;
    r4Column11: TdxDBGridColumn;
    procedure tv1DblClick(Sender: TObject);
    procedure tv2DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    // tv1DblClick(Sender: TObject);
   //    procedure FormShow(Sender: TObject);
   // procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_sumvalues: TF_sumvalues;

implementation
 uses UDM, Unitsummoneyreport,Unittimetoserchvalues,UnitSUMALL;
{$R *.dfm}


//按部门查询纸张信息
procedure TF_sumvalues.tv1DblClick(Sender: TObject);
 var
   sel:Integer;
  begin
    sel:=tv1.Selected.Index;
   case sel of
  0:
  begin
  ds1.DataSet:=DM.ADOSzz;
  r2.DataSource:=ds1;
  r1.DataSource:=ds1;
   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
   pgc1.TabIndex:=1;
  end;

  1:
   begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
  end;
  2:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
  end;
  3:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  4:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  5:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  6:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  7:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  8:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  9:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  10:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  11:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
    pgc1.TabIndex:=1;
   end;
  12:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
   pgc1.TabIndex:=1;
   end;
  13:
    begin
    ds1.DataSet:=DM.ADOSzz;
    r2.DataSource:=ds1;
    r1.DataSource:=ds1;

   dm.ADOSzz.Close;
   dm.ADOSzz.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz.Active:=True;
   pgc1.TabIndex:=1;
   end;
  14:
    begin
    ds2.DataSet:=DM.ADOSzz2;
    r3.DataSource:=ds2;
    r4.DataSource:=ds2;
   dm.ADOSzz2.Close;
   dm.ADOSzz2.Parameters.ParamByName('@sel').Value:=sel;
   dm.ADOSzz2.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSzz2.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSzz2.Active:=True;
    pgc1.TabIndex:=0;
   end;
  end;
 end;


//查询金额明晰

procedure TF_sumvalues.tv2DblClick(Sender: TObject);
 var
  dep:Integer;
begin
   dep:=tv2.Selected.Index;
   case dep of
 0:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
 1:
  begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;
 end;
 2:
  begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
 3:
  begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
4:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
5:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
6:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
7:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
8:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
9:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
10:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
11:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
12:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end;
13:
 begin
   ds1.DataSet:=dm.ADOSje;
   r1.DataSource:=ds1;
   r2.DataSource:=ds1;
   dm.ADOSje.Close;
   dm.ADOSje.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje.Active:=True;
   pgc1.TabIndex:=1;

 end; 
14:
 begin
   ds2.DataSet:=dm.ADOSje2;
   r3.DataSource:=ds2;
   r4.DataSource:=ds2;
   dm.ADOSje2.Close;
   dm.ADOSje2.Parameters.ParamByName('@sel').Value:=dep;
   dm.ADOSje2.Parameters.ParamByName('@krq').Value:=dtp1.Date;
   dm.ADOSje2.Parameters.ParamByName('@jrq').Value:=dtp2.Date;
   dm.ADOSje2.Active:=True;
   pgc1.TabIndex:=0;

 end;
end;

end;

procedure TF_sumvalues.N3Click(Sender: TObject);
begin
   Close;
   
end;

procedure TF_sumvalues.N2Click(Sender: TObject);
begin
  F_summoneyreport:=TF_summoneyreport.Create(Self);
   with dm.qryREPORT do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select sum(npage) as npage,sum(wpage) as wpage,sum(B5) as B5,sum(k16) as k16,sum(A4) as A4,sum(B4) as B4,');
     SQL.Add('sum(K8) as K8,sum(A3) as A3,sum(A42) as A42,sum(K82) as K82,sum(LABAN) as LABAN,sum(SENDOUTSIDE) as SENDOUTSIDE,');
     SQL.Add('sum(sendinside) as sendinside,sum(sendprive) as sendprive,sum(resivdpage) as resivdpage,sum(chinacall) as chinacall,sum(nationcall) as nationcall,sum(hgcall) as hgcall,department from center');
     SQL.Add('where t_time between :Begin and :End');
     SQL.Add('group by department');
     Parameters.ParamByName('begin').Value:=dtp1.Date;
     Parameters.ParamByName('end').Value:=dtp2.Date;
     try
       Open;
       except
       MessageBox(Handle,'提取报表错误!','系统提示',MB_ICONINFORMATION+MB_OK);
       Exit;
     end;
   end;
   F_summoneyreport.t1.ShowReport();
   FreeAndNil(F_summoneyreport);
end;

procedure TF_sumvalues.FormShow(Sender: TObject);
begin
 dtp1.Date:=Date;
 dtp2.Date:=Date;

 tv1.FullExpand;
 tv2.FullExpand;
end;

procedure TF_sumvalues.N4Click(Sender: TObject);
begin
  F_KERENREPORT:=TF_KERENREPORT.Create(Self);
  with DM.qryKERENREPORT DO
   begin
     Close;
     SQL.Clear;
     SQL.Add('select sum(chinsepage) as chinsepage,sum(englishpage) as englishpage,');
     sql.Add('sum(B5) as B5,sum(k16) as k16,sum(A4) as A4,sum(B4)*5 as B4,');
     sql.Add('sum(K8) as K8,sum(A3) as A3,sum(print1) as print1,sum(sacn) as sacn,');
     sql.Add('sum(intenet) as intenet,sum(SENDOUTSIDE) as SENDOUTSIDE,');
     sql.Add('sum(sendinside) as sendinside,sum(sendprive) as sendprive,sum(resivd) as resivd,');
     sql.Add('sum(land) as land,sum(nationcall) as nationcall,');
     sql.Add('sum(hgcall) as hgcall,sum(chinacall) as chinacall,sum(neibuje) as neibuje,preson from tableforpeople');
     SQL.Add('where rq between :krq and :jrq');
     sql.Add('group by preson');
     Parameters.ParamByName('krq').Value:=dtp1.Date;
     Parameters.ParamByName('jrq').Value:=dtp2.Date;
     try
      Open;
      except
      MessageBox(Handle,'提取数据失败!','系统提示',MB_ICONINFORMATION+MB_OK);
      Exit;
     end;
     F_KERENREPORT.tkerenreport.ShowReport();
   end;
   FreeAndNil(F_KERENREPORT);
end;

procedure TF_sumvalues.btn1Click(Sender: TObject);
begin
   Close;
end;

procedure TF_sumvalues.N5Click(Sender: TObject);
begin
  FormSUMALL:=TFormSUMALL.Create(Self);
  FormSUMALL.ShowModal;
  FreeAndNil(FormSUMALL);
end;

end.

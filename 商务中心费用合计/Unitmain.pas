unit Unitmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, Menus,
  DB, Buttons, ComCtrls, ImgList;

type
  Tf_main = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
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
    r3: TdxDBGrid;
    dskr: TDataSource;
    personidr3Column1: TdxDBGridColumn;
    personidr3Column2: TdxDBGridColumn;
    personidr3Column3: TdxDBGridColumn;
    personidr3Column4: TdxDBGridColumn;
    personidr3Column5: TdxDBGridColumn;
    personidr3Column6: TdxDBGridColumn;
    personidr3Column7: TdxDBGridColumn;
    personidr3Column8: TdxDBGridColumn;
    personidr3Column10: TdxDBGridColumn;
    personidr3Column11: TdxDBGridColumn;
    personidr3Column12: TdxDBGridColumn;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    personidr2Column13: TdxDBGridColumn;
    personidr2Column14: TdxDBGridColumn;
    personidr2Column15: TdxDBGridColumn;
    personidr2Column16: TdxDBGridColumn;
    personidr2Column17: TdxDBGridColumn;
    personidr2Column18: TdxDBGridColumn;
    personidr2Column20: TdxDBGridColumn;
    personidr3Column13: TdxDBGridColumn;
    personidr3Column14: TdxDBGridColumn;
    personidr3Column15: TdxDBGridColumn;
    personidr3Column16: TdxDBGridColumn;
    personidr3Column17: TdxDBGridColumn;
    personidr3Column18: TdxDBGridColumn;
    personidr3Column19: TdxDBGridColumn;
    personidr3Column20: TdxDBGridColumn;
    personidr3Column21: TdxDBGridColumn;
    personidr2Column21: TdxDBGridColumn;
    N7: TMenuItem;
    N8: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ImageList1: TImageList;
    N9: TMenuItem;
    PMkr: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    PMBM: TPopupMenu;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    r3Column21: TdxDBGridColumn;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure r2DblClick(Sender: TObject);
    procedure r3DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N9Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_main: Tf_main;

implementation
uses UDM,Unitaddinformation,UnitME,Unitaddpreson,Unitsumvalues,Unittimetoserch,Unitsumpagereport,menudele,serchls,Urbb;

{$R *.dfm}

procedure Tf_main.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_main.FormShow(Sender: TObject);
begin
   dm.ADOq1.Open;
   dm.qrykr.Open;
   statusBar1.Panels[0].Text:='当前操作员：'+dm.qrypsw.fieldbyname('czyxm').AsString;
   with dm.ADOq1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select * from center');
     SQL.Add('where lx=''0''');
     Prepared;
     Open;
   end;
   with dm.qrykr do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select * from tableforpeople');
     SQL.Add('where lx=''0''');
     Prepared;
     Open;
   end;

end;

procedure Tf_main.N3Click(Sender: TObject);
var
  intdel,intnext:integer;

  begin
    if dm.ADOq1.Active and (dm.ADOq1.RecordCount<=0) then
    Exit;
    begin
       intdel:=dm.ADOq1.fieldbyname('id').AsInteger;
       dm.ADOq1.Next;
       if dm.ADOq1.Eof then dm.ADOq1.MoveBy(-1);
       intnext:=Dm.ADOq1.fieldbyname('id').AsInteger;
       DM.ADOq1.Locate('id',intdel,[]);
       if MessageBox(Handle, PChar('确定要删除此信息：[' + DM.ADOq1.FieldByName('id').AsString + ']吗？'), '系统提示', MB_OKCANCEL + MB_ICONQUESTION) = IDOK  then
       begin
         with dm.ADOTEMP do
          begin
           Close;
           SQL.Clear;
           SQL.Add('delete from center where id=:id');
           Parameters.ParamByName('id').Value:=intdel;
           try
             ExecSQL;
             except
              MessageBox(Handle, '数据删除失败！', '系统提示', MB_OK + MB_ICONINFORMATION);
              Exit;
           end;
          end;
           try
             dm.ADOq1.Close;
             dm.ADOq1.Open;
             except
             MessageBox(Handle, '刷新数据失败！', '系统提示', MB_OK + MB_ICONINFORMATION);
             Exit;
           end;
       end;
       DM.ADOq1.Locate('id',intnext,[]);
   end;
end;
procedure Tf_main.N13Click(Sender: TObject);
begin
 Close;
end;

procedure Tf_main.N12Click(Sender: TObject);
begin
  F_ME:=TF_ME.Create(Self);
  F_ME.ShowModal;
  FreeAndNil(F_ME);
end;

procedure Tf_main.N6Click(Sender: TObject);
   var
    intdel,intnext:Integer;
begin
    if dm.qrykr.Active and (dm.qrykr.RecordCount<=0) then
    Exit;
    begin
       intdel:=dm.qrykr.FieldValues['id'];
       dm.qrykr.Next;
       if dm.qrykr.Eof then dm.qrykr.MoveBy(-1);
       intnext:=DM.qrykr.FieldValues['id'];
       DM.qrykr.Locate('id',intdel,[]);
       if MessageBox(Handle, PChar('确定要删除此信息：[' + DM.qrykr.FieldByName('id').AsString + ']吗？'), '系统提示', MB_OKCANCEL + MB_ICONQUESTION) = IDOK  then
       begin
         with dm.ADOTEMP do
          begin
           Close;
           SQL.Clear;
           SQL.Add('delete from tableforpeople where id=:id');
           Parameters.ParamByName('id').Value:=intdel;
           try
             ExecSQL;
             except
              MessageBox(Handle, '数据删除失败！', '系统提示', MB_OK + MB_ICONINFORMATION);
              Exit;
           end;
          end;
           try
             dm.qrykr.Close;
             dm.qrykr.Open;
             except
             MessageBox(Handle, '刷新数据失败！', '系统提示', MB_OK + MB_ICONINFORMATION);
             Exit;
           end;
       end;
       DM.qrykr.Locate('id',intnext,[]);
    end;
  end;
//增加部门信息
procedure Tf_main.N2Click(Sender: TObject);
begin
  pgc1.TabIndex:=0;
  dm.ADOq1.Append;

  //显示增加信息窗口
  F_addinformation:=TF_addinformation.Create(Self);  
  F_addinformation.ShowModal;
  FreeAndNil(F_addinformation);
end;

procedure Tf_main.N5Click(Sender: TObject);
begin
    pgc1.TabIndex:=1;
    F_addpreson:=TF_addpreson.Create(Self);
     F_addpreson.ShowModal;
     FreeAndNil(F_addpreson);
end;

procedure Tf_main.N14Click(Sender: TObject);
begin
end;
//客人信息修改
procedure Tf_main.N8Click(Sender: TObject);
begin
  F_changepereson:=TF_changepereson.Create(Self);
   with F_changepereson do
   begin
     dxCurrencyEdit1.Text:=dm.qrykr.FieldValues['chinsepage'];
     dxCurrencyEdit2.Text:=dm.qrykr.FieldValues['englishpage'];
     dxCurrencyEdit3.Text:=dm.qrykr.FieldValues['sendoutside'];
     dxCurrencyEdit4.Text:=dm.qrykr.FieldValues['sendinside'];
     dxCurrencyEdit5.Text:=DM.qrykr.FieldValues['sendprive'];
     dxCurrencyEdit6.Text:=dm.qrykr.FieldValues['resivd'];
     dxCurrencyEdit7.Text:=dm.qrykr.FieldValues['A4'];
     dxCurrencyEdit8.Text:=dm.qrykr.FieldValues['B5'];
     dxCurrencyEdit9.Text:=dm.qrykr.FieldValues['K16'];
     dxCurrencyEdit10.Text:=dm.qrykr.FieldValues['B4'];
     dxCurrencyEdit11.Text:=dm.qrykr.FieldValues['K8'];
     dxCurrencyEdit12.Text:=dm.qrykr.FieldValues['A3'];
     dxCurrencyEdit13.Text:=dm.qrykr.FieldValues['sacn'];
     dxCurrencyEdit14.Text:=dm.qrykr.FieldValues['print1'];
     dxCurrencyEdit15.Text:=dm.qrykr.FieldValues['chinacall'];
     dxCurrencyEdit16.Text:=dm.qrykr.FieldValues['nationcall'];
     dxCurrencyEdit17.Text:=dm.qrykr.FieldValues['hgcall'];
     dxCurrencyEdit18.Text:=dm.qrykr.FieldValues['intenet'];
     dxCurrencyEdit19.Text:=dm.qrykr.FieldValues['land'];
     dxCurrencyEdit20.Text:=dm.qrykr.FieldValues['neibuje'];
     dm.prs:=dm.qrykr.fieldbyname('id').AsInteger;
   end;
   F_changepereson.ShowModal;
   FreeAndNil(F_changepereson);
end;

//部门信息修改
procedure Tf_main.N7Click(Sender: TObject);
begin
   F_changeinformation:=TF_changeinformation.Create(Self);
    with F_changeinformation do
    begin
     dxDBCurrencyEdit1.Value:=dm.ADOq1.fieldbyname('npage').AsInteger;
     dxDBCurrencyEdit2.Value:=DM.ADOq1.fieldbyname('wpage').AsInteger;
     dbcbb1.Text:=DM.ADOq1.fieldbyname('department').AsString;
     dxDBCurrencyEdit3.Value:=DM.ADOq1.fieldbyname('B5').AsInteger;
     dxDBCurrencyEdit4.Value:=DM.ADOq1.fieldbyname('K16').AsInteger;
     dxDBCurrencyEdit5.Value:=DM.ADOq1.fieldbyname('A4').AsInteger;
     dxDBCurrencyEdit6.Value:=DM.ADOq1.fieldbyname('B4').AsInteger;
     dxDBCurrencyEdit7.Value:=DM.ADOq1.fieldbyname('K8').AsInteger;
     dxDBCurrencyEdit8.Value:=DM.ADOq1.fieldbyname('A3').AsInteger;
     dxDBCurrencyEdit9.Value:=DM.ADOq1.fieldbyname('A42').AsInteger;
     dxDBCurrencyEdit10.Value:=DM.ADOq1.fieldbyname('K82').AsInteger;
     dxDBCurrencyEdit11.Value:=DM.ADOq1.fieldbyname('LABAN').AsInteger;
     dxDBCurrencyEdit12.Value:=DM.ADOq1.fieldbyname('SENDOUTSIDE').AsInteger;
     dxDBCurrencyEdit13.Value:=DM.ADOq1.fieldbyname('SENDINSIDE').AsInteger;
     dxDBCurrencyEdit14.Value:=DM.ADOq1.fieldbyname('sendprive').AsInteger;
     dxDBCurrencyEdit15.Value:=DM.ADOq1.fieldbyname('resivdpage').AsInteger;
     dxDBCurrencyEdit16.Value:=DM.ADOq1.fieldbyname('nationcall').AsInteger;
     dxDBCurrencyEdit17.Value:=DM.ADOq1.fieldbyname('chinacall').AsInteger;
     dxDBCurrencyEdit18.Value:=DM.ADOq1.fieldbyname('hgcall').AsInteger;
     DM.intid:=DM.ADOq1.Fields[0].AsInteger;
    end;
   F_changeinformation.ShowModal;
   FreeAndNil(F_changeinformation);
end;
//部门信息修改
procedure Tf_main.r2DblClick(Sender: TObject);
begin
 F_changeinformation:=TF_changeinformation.Create(Self);
  with F_changeinformation do
  begin
     dxDBCurrencyEdit1.Value:=dm.ADOq1.fieldbyname('npage').AsInteger;
     dxDBCurrencyEdit2.Value:=DM.ADOq1.fieldbyname('wpage').AsInteger;
     dbcbb1.Text:=DM.ADOq1.fieldbyname('department').AsString;
     dxDBCurrencyEdit3.Value:=DM.ADOq1.fieldbyname('B5').AsInteger;
     dxDBCurrencyEdit4.Value:=DM.ADOq1.fieldbyname('K16').AsInteger;
     dxDBCurrencyEdit5.Value:=DM.ADOq1.fieldbyname('A4').AsInteger;
     dxDBCurrencyEdit6.Value:=DM.ADOq1.fieldbyname('B4').AsInteger;
     dxDBCurrencyEdit7.Value:=DM.ADOq1.fieldbyname('K8').AsInteger;
     dxDBCurrencyEdit8.Value:=DM.ADOq1.fieldbyname('A3').AsInteger;
     dxDBCurrencyEdit9.Value:=DM.ADOq1.fieldbyname('A42').AsInteger;
     dxDBCurrencyEdit10.Value:=DM.ADOq1.fieldbyname('K82').AsInteger;
     dxDBCurrencyEdit11.Value:=DM.ADOq1.fieldbyname('LABAN').AsInteger;
     dxDBCurrencyEdit12.Value:=DM.ADOq1.fieldbyname('SENDOUTSIDE').AsInteger;
     dxDBCurrencyEdit13.Value:=DM.ADOq1.fieldbyname('SENDINSIDE').AsInteger;
     dxDBCurrencyEdit14.Value:=DM.ADOq1.fieldbyname('sendprive').AsInteger;
     dxDBCurrencyEdit15.Value:=DM.ADOq1.fieldbyname('resivdpage').AsInteger;
     dxDBCurrencyEdit16.Value:=DM.ADOq1.fieldbyname('nationcall').AsInteger;
     dxDBCurrencyEdit17.Value:=DM.ADOq1.fieldbyname('chinacall').AsInteger;
     dxDBCurrencyEdit18.Value:=DM.ADOq1.fieldbyname('hgcall').AsInteger;
     DM.intid:=DM.ADOq1.Fields[0].AsInteger;

   end;
    F_changeinformation.ShowModal;
   FreeAndNil(F_changeinformation);
end;
//客人信息修改
procedure Tf_main.r3DblClick(Sender: TObject);
begin
  F_changepereson:=TF_changepereson.Create(Self);
   with F_changepereson do
   begin
     dxCurrencyEdit1.Text:=dm.qrykr.FieldValues['chinsepage'];
     dxCurrencyEdit2.Text:=dm.qrykr.FieldValues['englishpage'];
     dxCurrencyEdit3.Text:=dm.qrykr.FieldValues['sendoutside'];
     dxCurrencyEdit4.Text:=dm.qrykr.FieldValues['sendinside'];
     dxCurrencyEdit5.Text:=DM.qrykr.FieldValues['sendprive'];
     dxCurrencyEdit6.Text:=dm.qrykr.FieldValues['resivd'];
     dxCurrencyEdit7.Text:=dm.qrykr.FieldValues['A4'];
     dxCurrencyEdit8.Text:=dm.qrykr.FieldValues['B5'];
     dxCurrencyEdit9.Text:=dm.qrykr.FieldValues['K16'];
     dxCurrencyEdit10.Text:=dm.qrykr.FieldValues['B4'];
     dxCurrencyEdit11.Text:=dm.qrykr.FieldValues['K8'];
     dxCurrencyEdit12.Text:=dm.qrykr.FieldValues['A3'];
     dxCurrencyEdit13.Text:=dm.qrykr.FieldValues['sacn'];
     dxCurrencyEdit14.Text:=dm.qrykr.FieldValues['print1'];
     dxCurrencyEdit15.Text:=dm.qrykr.FieldValues['chinacall'];
     dxCurrencyEdit16.Text:=dm.qrykr.FieldValues['nationcall'];
     dxCurrencyEdit17.Text:=dm.qrykr.FieldValues['hgcall'];
     dxCurrencyEdit18.Text:=dm.qrykr.FieldValues['intenet'];
     dxCurrencyEdit19.Text:=dm.qrykr.FieldValues['land'];
     dm.prs:=dm.qrykr.fieldbyname('id').AsInteger;
   end;
   F_changepereson.ShowModal;
   FreeAndNil(F_changepereson);
end;

procedure Tf_main.Timer1Timer(Sender: TObject);
begin
  statusBar1.Panels[1].Text:='当前时间：'+formatdatetime('yyyy "年" m "月" d "日 " dddd'  +'hh:mm:ss',now);
end;

procedure Tf_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.ADOq1.Close;
  dm.qrykr.Close;
end;

procedure Tf_main.N9Click(Sender: TObject);
begin
    frmserchls:=Tfrmserchls.Create(Self);
    frmserchls.ShowModal;
    FreeAndNil(frmserchls);
end;

procedure Tf_main.N15Click(Sender: TObject);
begin
   N5Click(Sender);
end;

procedure Tf_main.N16Click(Sender: TObject);
begin
   N8Click(Sender);
end;

procedure Tf_main.N17Click(Sender: TObject);
begin
   N6Click(Sender);    
end;

procedure Tf_main.N18Click(Sender: TObject);
begin
   N2Click(Sender);
end;

procedure Tf_main.N19Click(Sender: TObject);
begin
   N7Click(Sender);
end;

procedure Tf_main.N20Click(Sender: TObject);
begin
  N3Click(Sender);
end;

procedure Tf_main.N22Click(Sender: TObject);
begin
  F_sumvalues:=TF_sumvalues.Create(Self);
  F_sumvalues.ShowModal;
  FreeAndNil(F_sumvalues);

end;

procedure Tf_main.N21Click(Sender: TObject);
begin
  //日报表生成
  F_rbb:=TF_rbb.Create(Self);
  F_rbb.ShowModal;
  FreeAndNil(F_rbb);
end;

end.


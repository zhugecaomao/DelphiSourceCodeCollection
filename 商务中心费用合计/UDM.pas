unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB,IniFiles, frxClass, frxDBSet,Messages,Dialogs;

type
  TDM = class(TDataModule)
    adocon1: TADOConnection;
    ADOq1: TADOQuery;
    ADOTEMP: TADOQuery;
    qryadoq2: TADOQuery;
    qrypsw: TADOQuery;
    qrykr: TADOQuery;
    qry1: TADOQuery;
    qrytemp: TADOQuery;
    MONEYREPORT: TfrxDBDataset;
    qryREPORT: TADOQuery;
    qryKERENREPORT: TADOQuery;
    frxKERENREPORT: TfrxDBDataset;
    qryadoq2t_time: TDateTimeField;
    qryadoq2npage: TBCDField;
    qryadoq2wpage: TBCDField;
    qryadoq2B5: TBCDField;
    qryadoq2k16: TBCDField;
    qryadoq2A4: TBCDField;
    qryadoq2B4: TBCDField;
    qryadoq2K8: TBCDField;
    qryadoq2A3: TBCDField;
    qryadoq2A42: TBCDField;
    qryadoq2K82: TBCDField;
    qryadoq2LABAN: TBCDField;
    qryadoq2chinacall: TBCDField;
    qryadoq2hgcall: TBCDField;
    qryadoq2nationcall: TBCDField;
    qryadoq2SENDOUTSIDE: TBCDField;
    qryadoq2sendinside: TBCDField;
    qryadoq2sendprive: TBCDField;
    qryadoq2resivdpage: TBCDField;
    qryadoq2department: TStringField;
    ADObmls: TADOQuery;
    ADOkrls: TADOQuery;
    ADOSzz: TADOStoredProc;
    ADOSzz2: TADOStoredProc;
    ADOSje: TADOStoredProc;
    ADOSje2: TADOStoredProc;
    ADOCODE: TADOQuery;
    ADOq1id: TAutoIncField;
    ADOq1t_time: TDateTimeField;
    ADOq1npage: TBCDField;
    ADOq1wpage: TBCDField;
    ADOq1B5: TBCDField;
    ADOq1k16: TBCDField;
    ADOq1A4: TBCDField;
    ADOq1B4: TBCDField;
    ADOq1K8: TBCDField;
    ADOq1A3: TBCDField;
    ADOq1A42: TBCDField;
    ADOq1K82: TBCDField;
    ADOq1LABAN: TBCDField;
    ADOq1chinacall: TBCDField;
    ADOq1hgcall: TBCDField;
    ADOq1nationcall: TBCDField;
    ADOq1SENDOUTSIDE: TBCDField;
    ADOq1sendinside: TBCDField;
    ADOq1sendprive: TBCDField;
    ADOq1resivdpage: TBCDField;
    ADOq1department: TStringField;
    ADOq1lx: TStringField;
    ADOq1hjje: TBCDField;
    ADOTJ: TADOQuery;
    ADOalllname: TADOQuery;
    ADOl_assist: TADOQuery;
    ADOl_assistID: TIntegerField;
    ADOl_assistPYNAME: TStringField;
    ADOl_assistZSNAME: TStringField;
    ADOl_assistJE: TBCDField;
    ADOl_assistrq: TDateTimeField;
    ADOl_assistbm: TStringField;
    ADOl_assistdm: TIntegerField;
    ADOHZ: TADOStoredProc;
    qrytime: TADOQuery;
    qrytimextsj: TStringField;
    qrypswid: TAutoIncField;
    qrypswczydm: TStringField;
    qrypswczyxm: TStringField;
    qrypswczykl: TStringField;
    ADOrbsl: TADOStoredProc;
    ADOSrbbje: TADOStoredProc;
    ADOSrbbjechinsepage: TCurrencyField;
    ADOSrbbjeprint1: TCurrencyField;
    ADOSrbbjesendprive: TCurrencyField;
    ADOSrbbjesendinside: TCurrencyField;
    ADOSrbbjesendoutside: TCurrencyField;
    ADOSrbbjefyj3: TCurrencyField;
    ADOSrbbjefyj5: TCurrencyField;
    ADOSrbbjechinacall: TCurrencyField;
    ADOSrbbjenationcall: TCurrencyField;
    ADOSrbbjehgcall: TCurrencyField;
    ADOSrbbjeresivd: TCurrencyField;
    ADOSrbbjesacn: TCurrencyField;
    ADOSrbbjeintenet: TCurrencyField;
    ADOSrbbjeland: TCurrencyField;
    spbmsl: TADOStoredProc;
    spbmslbmzsl: TIntegerField;
    spbmhjje: TADOStoredProc;
    ADOrbslfy3: TIntegerField;
    ADOrbslfy5: TIntegerField;
    ADOrbslsendprive: TIntegerField;
    ADOrbslchinsepage: TIntegerField;
    ADOrbslprint1: TIntegerField;
    ADOrbslsendinside: TIntegerField;
    ADOrbslsendoutside: TIntegerField;
    ADOrbslresivd: TIntegerField;
    ADOrbslsacn: TIntegerField;
    ADOrbslchinacall: TIntegerField;
    ADOrbslnationcall: TIntegerField;
    ADOrbslhgcall: TIntegerField;
    ADOrbslintenet: TIntegerField;
    ADOrbslland: TIntegerField;
    sptjjechinsepage: TCurrencyField;
    sptjjeprint1: TCurrencyField;
    sptjjefyj3: TCurrencyField;
    sptjjefyj5: TCurrencyField;
    sptjjeSENDOUTSIDE: TCurrencyField;
    sptjjesendinside: TCurrencyField;
    sptjjesendprive: TCurrencyField;
    sptjjeresivd: TCurrencyField;
    sptjjesacn: TCurrencyField;
    sptjjenationcall: TCurrencyField;
    sptjjehgcall: TCurrencyField;
    sptjjechinacall: TCurrencyField;
    sptjjeintenet: TCurrencyField;
    sptjjeland: TCurrencyField;
    sptjje: TADOStoredProc;
    Qwpsz: TADOQuery;
    Qwpszbm: TStringField;
    Qwpszmc: TStringField;
    Qwpszdanja: TBCDField;
    qrycount: TADOQuery;
    qrylymx: TADOQuery;
    qrylymxid: TAutoIncField;
    qrylymxbm: TStringField;
    qrylymxmc: TStringField;
    qrylymxdanja: TBCDField;
    qrylymxshuliang: TBCDField;
    qrylymxwubh: TStringField;
    qrylymxlx: TStringField;
    qrylymxrq: TDateTimeField;
    spbqjc: TADOStoredProc;
    spbqjcbqdt: TIntegerField;
    spbqjcbqmxp: TIntegerField;
    spbqjcbqyp5: TIntegerField;
    spsqjc: TADOStoredProc;
    spbqly: TADOStoredProc;
    spbqlybqjcdt: TIntegerField;
    spbqlybqjcyp5: TIntegerField;
    spbqlybqjcmxp: TIntegerField;
    spxs: TADOStoredProc;
    spxsbqxsdt: TIntegerField;
    spxsbqxsyp5: TIntegerField;
    spxsbqxsmxp: TIntegerField;
    spbqje: TADOStoredProc;
    spsqjcsqjcdt: TIntegerField;
    spsqjcsqjcyp5: TIntegerField;
    spsqjcsqjcmxp: TIntegerField;
    spbmhjjenpage: TCurrencyField;
    spbmhjjefyje: TCurrencyField;
    spbmhjjea42: TCurrencyField;
    spbmhjjek82: TBCDField;
    spbmhjjelaban: TBCDField;
    spbmhjjecz: TBCDField;
    spbmhjjecha: TBCDField;
    ADOq1CZY: TStringField;
    ADOq1XTSJ: TStringField;
    qrybmyj: TADOQuery;
    qryforpepole: TADOQuery;
    spjsgzr: TADOStoredProc;
    qrydatereport: TADOQuery;
    sprbbmx: TADOStoredProc;
    spbmrbbmx: TADOStoredProc;
    spbmrbbmxdzs: TIntegerField;
    spbmrbbmxdzj: TCurrencyField;
    spbmrbbmxfys1: TIntegerField;
    spbmrbbmxfyj1: TCurrencyField;
    spbmrbbmxsws: TIntegerField;
    spbmrbbmxswj: TCurrencyField;
    spbmrbbmxdys: TIntegerField;
    spbmrbbmxdyj: TCurrencyField;
    spbmrbbmxfys: TIntegerField;
    spbmrbbmxfyj: TCurrencyField;
    spbmrbbmxsms: TCurrencyField;
    spbmrbbmxsmj: TCurrencyField;
    spbmrbbmxsns: TCurrencyField;
    spbmrbbmxsnj: TCurrencyField;
    spbmrbbmxgncs: TCurrencyField;
    spbmrbbmxgncj: TCurrencyField;
    spbmrbbmxints: TCurrencyField;
    spbmrbbmxintj: TCurrencyField;
    qrydatereportid: TAutoIncField;
    qrydatereportmc: TStringField;
    qrydatereportshuliang: TBCDField;
    qrydatereportje: TBCDField;
    qrydatereportrq: TDateTimeField;
    qrydatereportlx: TStringField;
    qrybbdate: TADOQuery;
    qrybbdateid: TAutoIncField;
    qrybbdatemc: TStringField;
    qrybbdateshuliang: TBCDField;
    qrybbdateje: TBCDField;
    qrybbdaterq: TDateTimeField;
    qrybbdatelx: TStringField;
    spbqjebqjedt: TBCDField;
    spbqjebqjeyp5: TBCDField;
    spbqjebqjcmxp: TBCDField;
    qrydatereportnamemx: TStringField;
    qrybbdatenamemx: TStringField;
    qryczjl: TADOQuery;
    sphjjeyj: TADOStoredProc;
    sphjjeyjSQHJ: TIntegerField;
    sphjjeyjBQHJ: TIntegerField;
    sphjjeyjBQXS: TIntegerField;
    sphjjeyjbqje: TIntegerField;
    sphjjeyjBQJC: TIntegerField;
    spjsbmgz: TADOStoredProc;
    qrykrid: TAutoIncField;
    qrykrchinsepage: TBCDField;
    qrykrenglishpage: TBCDField;
    qrykrA4: TBCDField;
    qrykrK16: TBCDField;
    qrykrB5: TBCDField;
    qrykrA3: TBCDField;
    qrykrK8: TBCDField;
    qrykrB4: TBCDField;
    qrykrsendoutside: TBCDField;
    qrykrsendinside: TBCDField;
    qrykrsendprive: TBCDField;
    qrykrresivd: TBCDField;
    qrykrprint1: TBCDField;
    qrykrsacn: TBCDField;
    qrykrnationcall: TBCDField;
    qrykrhgcall: TBCDField;
    qrykrchinacall: TBCDField;
    qrykrintenet: TBCDField;
    qrykrland: TBCDField;
    qrykrpreson: TStringField;
    qrykrneibuje: TBCDField;
    qrykrrq: TDateTimeField;
    qrykrlx: TStringField;
    qrykrCZY: TStringField;
    qrykrXTSJ: TStringField;
    ADOQbm: TADOQuery;
    ADOQbmid: TAutoIncField;
    ADOQbmmc: TStringField;
    ADOQbmshuliang: TBCDField;
    ADOQbmje: TBCDField;
    ADOQbmrq: TDateTimeField;
    ADOQbmlx: TStringField;
    ADOQbmnamemx: TStringField;
    Qbdanjia: TADOQuery;
    Qjkiage: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    intid,prs,hm,sl:Integer;
    hma,hname,pyn,bmh:string;
    bmmc:string;
   function  gzr:TDateTime;
    { Public declarations }
  end;

var
  DM: TDM;
  myinifile:TIniFile;
implementation



{$R *.dfm}
function TDM.gzr:TDateTime;
begin
  Result:=Date+1;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
{ar
  filename,servername,database,userid,paswrod:string; }
begin
 {  filename:=ExtractFilePath(ParamStr(0))+'swzx.ini';
   myinifile:=TIniFile.Create(filename);

   servername:=myinifile.ReadString('dbconfig','server','');
   database:=myinifile.ReadString('dbconfig','database','');
   userid:=myinifile.ReadString('dbconfig','uid','');
   paswrod:=myinifile.ReadString('dbconfig','pwd','');
    if (servername='') or (database='')or(userid='') then
   begin
    MessageDlg('配置文件配置错误！请重新配置',mtWarning,[mbCancel],0);
    Exit
   end
   else
     adocon1.ConnectionString:='Provider=SQLOLEDB.1;Password='+paswrod+';Persist Security Info=True;User ID='+userid+';Initial Catalog='+database+';Data Source='+servername;
     Try
        Try
           adocon1.Connected:=True;
           MessageDlg('配置文件配联接成功！',mtinformation,[mbok],0);
           adocon1.Open;
       except
           MessageDlg('配置文件错误！',mtError,[mbCancel],0);
        end;
     Finally
          adocon1.Connected:=False;
     end;
    myinifile.Free; }
 end;
end.

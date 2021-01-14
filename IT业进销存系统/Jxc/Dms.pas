unit Dms;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, JxcS_TLB, StdVcl, Provider, Db, ADODB, Forms, Dialogs;

type

  TGetValueType = (gtOld, gtNew, gtCur);

  TDatas = class(TRemoteDataModule, Idatas)
    Tmpf: TADOQuery;
    Cn: TADOConnection;
    AppUserGroup: TADOQuery;
    AppUserGroupgName: TStringField;
    AppUserGroupgMemo: TStringField;
    AppUser: TADOQuery;
    AppUserID: TIntegerField;
    AppUseruCode: TStringField;
    AppUseruName: TStringField;
    AppUseruPassword: TStringField;
    AppUsergName: TStringField;
    AppGroupDesktopClass: TADOQuery;
    AppGroupDesktopClassgName: TStringField;
    AppGroupDesktopClasscName: TStringField;
    Tmpl: TADOQuery;
    Tmp: TADOQuery;
    pAppUserGroup: TDataSetProvider;
    pAppUser: TDataSetProvider;
    pAppGroupDesktopClass: TDataSetProvider;
    pTmp: TDataSetProvider;
    pTmpf: TDataSetProvider;
    pTmpl: TDataSetProvider;
    AppSelect: TADOQuery;
    AppSelectDATASET: TStringField;
    AppSelectFIELDNAME: TStringField;
    AppSelectAUTOUPDATE: TBooleanField;
    AppSelectDATASELECT: TMemoField;
    AppSelectDefaultRow: TIntegerField;
    Cn1: TADOConnection;
    AppLog: TADOQuery;
    AppLoguName: TStringField;
    AppLogcName: TStringField;
    AppLogCZ: TStringField;
    AppLogRQ: TDateField;
    AppLogSJ: TStringField;
    pAppLog: TDataSetProvider;
    Dq: TADOQuery;
    pDq: TDataSetProvider;
    AppMenu: TADOQuery;
    AppMenumName: TStringField;
    AppMenumCaption: TStringField;
    AppMenumLevel: TIntegerField;
    AppMenumIndex: TIntegerField;
    AppMenumIsParent: TBooleanField;
    pAppMenu: TDataSetProvider;
    Kh: TADOQuery;
    pKh: TDataSetProvider;
    DqID: TIntegerField;
    DqMC: TStringField;
    Gys: TADOQuery;
    pGys: TDataSetProvider;
    Zh: TADOQuery;
    pZh: TDataSetProvider;
    KhID: TIntegerField;
    KhBH: TStringField;
    KhMC: TStringField;
    KhQC: TStringField;
    KhLXR: TStringField;
    KhDH: TStringField;
    KhCZ: TStringField;
    KhDZ: TStringField;
    KhYB: TStringField;
    KhWZ: TStringField;
    KhKHYH: TStringField;
    KhYHZH: TStringField;
    KhNSH: TStringField;
    KhQCJE: TFloatField;
    KhXYED: TFloatField;
    KhZT: TBooleanField;
    KhBZ: TStringField;
    GysID: TIntegerField;
    GysBH: TStringField;
    GysMC: TStringField;
    GysQC: TStringField;
    GysLXR: TStringField;
    GysDH: TStringField;
    GysCZ: TStringField;
    GysDZ: TStringField;
    GysYB: TStringField;
    GysWZ: TStringField;
    GysDY: TStringField;
    GysKHYH: TStringField;
    GysYHZH: TStringField;
    GysNSH: TStringField;
    GysQCJE: TFloatField;
    GysZT: TBooleanField;
    GysBZ: TStringField;
    KhDY: TStringField;
    Sfkfs: TADOQuery;
    pSfkfs: TDataSetProvider;
    Srzclb: TADOQuery;
    pSrzclb: TDataSetProvider;
    Ck: TADOQuery;
    pCk: TDataSetProvider;
    ZhID: TIntegerField;
    ZhMC: TStringField;
    ZhKHYH: TStringField;
    ZhYHZH: TStringField;
    ZhYHL: TBooleanField;
    KhDQID: TIntegerField;
    SfkfsID: TIntegerField;
    SfkfsMC: TStringField;
    SfkfsZHID: TIntegerField;
    SrzclbID: TIntegerField;
    SrzclbMC: TStringField;
    SrzclbSRL: TBooleanField;
    SrzclbBZ: TStringField;
    ZhaYHL: TStringField;
    SrzclbaSRL: TStringField;
    Hplb: TADOQuery;
    pHplb: TDataSetProvider;
    Cyjsdw: TADOQuery;
    pCyjsdw: TDataSetProvider;
    Hphsff: TADOQuery;
    pHphsff: TDataSetProvider;
    Bm: TADOQuery;
    pBm: TDataSetProvider;
    CkID: TIntegerField;
    CkMC: TStringField;
    CkWZ: TStringField;
    CkBZ: TStringField;
    HplbID: TIntegerField;
    HplbMC: TStringField;
    HplbBZ: TStringField;
    CyjsdwMC: TStringField;
    CkXH: TIntegerField;
    Yglb: TADOQuery;
    pYglb: TDataSetProvider;
    Yg: TADOQuery;
    pYg: TDataSetProvider;
    BmMC: TStringField;
    YglbID: TIntegerField;
    YglbMC: TStringField;
    YgID: TIntegerField;
    YgBH: TStringField;
    YgXM: TStringField;
    YgXB: TStringField;
    YgBMID: TIntegerField;
    YgYGLBID: TIntegerField;
    YgCSRQ: TDateField;
    YgXL: TStringField;
    YgDH: TStringField;
    YgSFZH: TStringField;
    YgBP: TStringField;
    YgJG: TStringField;
    YgYB: TStringField;
    YgZZ: TStringField;
    YgZW: TStringField;
    YgRZRQ: TDateField;
    YgYWYBZ: TBooleanField;
    YgJSFF: TIntegerField;
    YgLZ: TBooleanField;
    YgBZ: TStringField;
    YgaYWYBZ: TStringField;
    YgaJSFF: TStringField;
    YgaLZ: TStringField;
    KhaDQMC: TStringField;
    SfkfsaZHMC: TStringField;
    YgaBMMC: TStringField;
    YgaYGLBMC: TStringField;
    YgJBGZ: TFloatField;
    Hp: TADOQuery;
    pHp: TDataSetProvider;
    Qtkcbdlx: TADOQuery;
    pQtkcbdlx: TDataSetProvider;
    HpCkXx: TADOQuery;
    pHpCkXx: TDataSetProvider;
    HphsffID: TIntegerField;
    HphsffMC: TStringField;
    HphsffLB: TIntegerField;
    QtkcbdlxID: TIntegerField;
    QtkcbdlxMC: TStringField;
    QtkcbdlxRKL: TBooleanField;
    QtkcbdlxTHBZ: TBooleanField;
    HpID: TIntegerField;
    HpBH: TStringField;
    HpHPLBID: TIntegerField;
    HpPM: TStringField;
    HpDW: TStringField;
    HpHPHSFFID: TIntegerField;
    HpHPSXID: TIntegerField;
    HpJJ: TFloatField;
    HpJJJ: TFloatField;
    HpQCJE: TFloatField;
    HpSX: TFloatField;
    HpXX: TFloatField;
    HpZT: TBooleanField;
    HpaHPLBMC: TStringField;
    HpaHPSX: TStringField;
    HpaZT: TStringField;
    HpSjXx: TADOQuery;
    pHpSjXx: TDataSetProvider;
    HpCkXxMC: TStringField;
    HpSjXxMC: TStringField;
    HpSjXxSJ: TFloatField;
    Hpkc: TADOQuery;
    pHpkc: TDataSetProvider;
    Hpsj: TADOQuery;
    pHpsj: TDataSetProvider;
    Cgddzb: TADOQuery;
    pCgddzb: TDataSetProvider;
    HpkcCKID: TIntegerField;
    HpkcHPID: TIntegerField;
    HpsjSJZLID: TIntegerField;
    HpsjHPID: TIntegerField;
    HpsjSJ: TFloatField;
    BmID: TIntegerField;
    Cgdd: TADOQuery;
    pCgdd: TDataSetProvider;
    CgddzbDJBH: TStringField;
    CgddzbRQ: TDateField;
    CgddzbGYSID: TIntegerField;
    CgddzbJHRQ: TDateField;
    CgddzbJHDD: TStringField;
    CgddzbYWY: TStringField;
    CgddzbJE: TFloatField;
    CgddzbZT: TBooleanField;
    CgddzbBZ: TStringField;
    CgddzbCZY: TStringField;
    CgddzbaGYSMC: TStringField;
    CgddzbaGYSBH: TStringField;
    CgddZBID2: TIntegerField;
    CgddHPID: TIntegerField;
    CgddSL: TFloatField;
    CgddDJ: TFloatField;
    CgddNSL: TFloatField;
    pAppSelect: TDataSetProvider;
    HpaZKCL: TFloatField;
    HpkcQCS: TFloatField;
    HpkcJCS: TFloatField;
    HpCkXxJCS: TFloatField;
    CgddaBH: TStringField;
    CgddaPM: TStringField;
    CgddaDW: TStringField;
    CgddzbID: TIntegerField;
    CgddHH: TIntegerField;
    HpITMP: TIntegerField;
    CgddzbaZT: TStringField;
    CgddRQ: TDateField;
    Cgshzb: TADOQuery;
    Cgsh: TADOQuery;
    CgddHelp: TADOQuery;
    CgshzbID: TIntegerField;
    CgshzbDJBH: TStringField;
    CgshzbRQ: TDateField;
    CgshzbGYSID: TIntegerField;
    CgshzbCKID: TIntegerField;
    CgshzbFPLX: TIntegerField;
    CgshzbYWY: TStringField;
    CgshzbJE: TFloatField;
    CgshzbBZ: TStringField;
    CgshzbCZY: TStringField;
    CgshzbaGYSBH: TStringField;
    CgshzbaGYSMC: TStringField;
    CgshzbaCKMC: TStringField;
    CgshzbaFPLX: TStringField;
    CgshZBID2: TIntegerField;
    CgshHH: TIntegerField;
    CgshRQ: TDateField;
    CgshCKID: TIntegerField;
    CgshHPID: TIntegerField;
    CgshSL: TFloatField;
    CgshDJ: TFloatField;
    CgshNSL: TFloatField;
    CgshDDID: TIntegerField;
    CgshaBH: TStringField;
    CgshaPM: TStringField;
    CgshaDW: TStringField;
    pCgshzb: TDataSetProvider;
    pCgsh: TDataSetProvider;
    pCgddHelp: TDataSetProvider;
    CgddaSHSL: TFloatField;
    Cgfkzb: TADOQuery;
    pCgfkzb: TDataSetProvider;
    CgddHelpID: TIntegerField;
    CgddHelpDJBH: TStringField;
    CgddHelpJE: TFloatField;
    CgddHelpJHRQ: TDateField;
    CgddHelpaGYSMC: TStringField;
    CgddHelpRQ: TDateField;
    KhYXJE: TFloatField;
    GysaSJJE: TFloatField;
    GysYXJE: TFloatField;
    KhITMP: TIntegerField;
    GysITMP: TIntegerField;
    KhQMJE: TFloatField;
    GysQMJE: TFloatField;
    KhaSJJE: TFloatField;
    CgddaMSSL: TFloatField;
    Cgfk: TADOQuery;
    pCgfk: TDataSetProvider;
    ADOQuery3: TADOQuery;
    DataSetProvider3: TDataSetProvider;
    CgfkzbID: TIntegerField;
    CgfkzbDJBH: TStringField;
    CgfkzbRQ: TDateField;
    CgfkzbGYSID: TIntegerField;
    CgfkzbFKLX: TIntegerField;
    CgfkzbSFKFSID: TSmallintField;
    CgfkzbZHID: TSmallintField;
    CgfkzbPH: TStringField;
    CgfkzbJE: TFloatField;
    CgfkzbJEA: TFloatField;
    CgfkzbJEB: TFloatField;
    CgfkzbBZ: TStringField;
    CgfkzbCZY: TStringField;
    CgfkzbaFKLX: TStringField;
    CgfkzbaGYSBH: TStringField;
    CgfkzbaGYSMC: TStringField;
    CgfkzbaSFKFSMC: TStringField;
    CgfkzbaZHMC: TStringField;
    CgfkZBID2: TIntegerField;
    CgfkHH: TIntegerField;
    CgfkDDID: TIntegerField;
    CgfkJE: TFloatField;
    CgfkaDDBH: TStringField;
    CgfkaDDRQ: TDateField;
    CgfkaDDJE: TFloatField;
    CgfkaYFJE: TFloatField;
    CgfkaMFJE: TFloatField;
    CgshzbYFJE: TFloatField;
    CgfkzbSYJY: TBooleanField;
    CgddHelpaGYSBH: TStringField;
    CgfkRQ: TDateField;
    Cgthzb: TADOQuery;
    Cgth: TADOQuery;
    pCgthzb: TDataSetProvider;
    pCgth: TDataSetProvider;
    CgthzbID: TIntegerField;
    CgthzbDJBH: TStringField;
    CgthzbRQ: TDateField;
    CgthzbGYSID: TIntegerField;
    CgthzbaGYSBH: TStringField;
    CgthzbaGYSMC: TStringField;
    CgthzbCKID: TIntegerField;
    CgthzbaCKMC: TStringField;
    CgthzbTHLX: TIntegerField;
    CgthzbaTHLX: TStringField;
    CgthzbSFKFSID: TSmallintField;
    CgthzbaSFKFSMC: TStringField;
    CgthzbZHID: TSmallintField;
    CgthzbaZHMC: TStringField;
    CgthzbPH: TStringField;
    CgthzbYWY: TStringField;
    CgthzbJE: TFloatField;
    CgthzbBZ: TStringField;
    CgthzbCZY: TStringField;
    CgthZBID2: TIntegerField;
    CgthHH: TIntegerField;
    CgthRQ: TDateField;
    CgthCKID: TIntegerField;
    CgthHPID: TIntegerField;
    CgthaBH: TStringField;
    CgthaPM: TStringField;
    CgthaDW: TStringField;
    CgthSL: TFloatField;
    CgthDJ: TFloatField;
    CgthNSL: TFloatField;
    Xsddzb: TADOQuery;
    pXsddzb: TDataSetProvider;
    Xsdd: TADOQuery;
    pXsdd: TDataSetProvider;
    XsddzbID: TIntegerField;
    XsddzbDJBH: TStringField;
    XsddzbRQ: TDateField;
    XsddzbGYSID: TIntegerField;
    XsddzbaKHBH: TStringField;
    XsddzbaKHMC: TStringField;
    XsddzbJHRQ: TDateField;
    XsddzbJHDD: TStringField;
    XsddzbYWY: TStringField;
    XsddzbJE: TFloatField;
    XsddzbZT: TBooleanField;
    XsddzbaZT: TStringField;
    XsddzbBZ: TStringField;
    XsddzbCZY: TStringField;
    XsddZBID2: TIntegerField;
    XsddHH: TIntegerField;
    XsddRQ: TDateField;
    XsddHPID: TIntegerField;
    XsddaBH: TStringField;
    XsddaPM: TStringField;
    XsddaDW: TStringField;
    XsddSL: TFloatField;
    XsddDJ: TFloatField;
    XsddNSL: TFloatField;
    XsddaYTSL: TFloatField;
    XsddaMTSL: TFloatField;
    Xskdzb: TADOQuery;
    Xskd: TADOQuery;
    pXskdzb: TDataSetProvider;
    pXskd: TDataSetProvider;
    XskdzbID: TIntegerField;
    XskdzbDJBH: TStringField;
    XskdzbRQ: TDateField;
    XskdzbKHID: TIntegerField;
    XskdzbaKHBH: TStringField;
    XskdzbaKHMC: TStringField;
    XskdzbCKID: TIntegerField;
    XskdzbaCKMC: TStringField;
    XskdzbFPLX: TIntegerField;
    XskdzbaFPLX: TStringField;
    XskdzbYWY: TStringField;
    XskdzbSKQX: TIntegerField;
    XskdzbJHDD: TStringField;
    XskdzbJE: TFloatField;
    XskdzbYSJE: TFloatField;
    XskdzbBZ: TStringField;
    XskdzbCZY: TStringField;
    XskdZBID2: TIntegerField;
    XskdHH: TIntegerField;
    XskdRQ: TDateField;
    XskdCKID: TIntegerField;
    XskdHPID: TIntegerField;
    XskdaBH: TStringField;
    XskdaPM: TStringField;
    XskdaDW: TStringField;
    XskdSL: TFloatField;
    XskdCBDJ: TFloatField;
    XskdNSL: TFloatField;
    XskdDDID: TIntegerField;
    XsddHelp: TADOQuery;
    pXsddHelp: TDataSetProvider;
    XsddHelpID: TIntegerField;
    XsddHelpDJBH: TStringField;
    XsddHelpRQ: TDateField;
    XsddHelpJE: TFloatField;
    XsddHelpJHRQ: TDateField;
    XsddHelpaKHBH: TStringField;
    XsddHelpaKHMC: TStringField;
    Xsskzb: TADOQuery;
    pXsskzb: TDataSetProvider;
    Xssk: TADOQuery;
    pXssk: TDataSetProvider;
    XsskzbID: TIntegerField;
    XsskzbDJBH: TStringField;
    XsskzbRQ: TDateField;
    XsskzbKHID: TIntegerField;
    XsskzbaKHBH: TStringField;
    XsskzbaKHMC: TStringField;
    XsskzbFKLX: TIntegerField;
    XsskzbaFKLX: TStringField;
    XsskzbSFKFSID: TSmallintField;
    XsskzbaSFKFSMC: TStringField;
    XsskzbZHID: TSmallintField;
    XsskzbaZHMC: TStringField;
    XsskzbPH: TStringField;
    XsskzbSYJY: TBooleanField;
    XsskzbJE: TFloatField;
    XsskzbJEA: TFloatField;
    XsskzbJEB: TFloatField;
    XsskzbBZ: TStringField;
    XsskzbCZY: TStringField;
    XsskZBID2: TIntegerField;
    XsskHH: TIntegerField;
    XsskRQ: TDateField;
    XsskDDID: TIntegerField;
    XsskaDDBH: TStringField;
    XsskaSKQX: TDateField;
    XsskaDDJE: TFloatField;
    XsskaYSJE: TFloatField;
    XsskaMSJE: TFloatField;
    XsskJE: TFloatField;
    XskdzbFKLX: TIntegerField;
    XskdzbaFKLX: TStringField;
    XskdzbSFKFSID: TSmallintField;
    XskdzbaSFKFSMC: TStringField;
    XskdzbZHID: TSmallintField;
    XskdzbaZHMC: TStringField;
    XskdzbPH: TStringField;
    Xsthzb: TADOQuery;
    Xsth: TADOQuery;
    pXsthzb: TDataSetProvider;
    pXsth: TDataSetProvider;
    XsthzbID: TIntegerField;
    XsthzbDJBH: TStringField;
    XsthzbRQ: TDateField;
    XsthzbKHID: TIntegerField;
    XsthzbaKHBH: TStringField;
    XsthzbaKHMC: TStringField;
    XsthzbCKID: TIntegerField;
    XsthzbaCKMC: TStringField;
    XsthzbTHLX: TIntegerField;
    XsthzbaTHLX: TStringField;
    XsthzbSFKFSID: TSmallintField;
    XsthzbaSFKFSMC: TStringField;
    XsthzbZHID: TSmallintField;
    XsthzbaZHMC: TStringField;
    XsthzbPH: TStringField;
    XsthzbYWY: TStringField;
    XsthzbJE: TFloatField;
    XsthzbBZ: TStringField;
    XsthzbCZY: TStringField;
    XsthZBID2: TIntegerField;
    XsthHH: TIntegerField;
    XsthRQ: TDateField;
    XsthCKID: TIntegerField;
    XsthHPID: TIntegerField;
    XsthaBH: TStringField;
    XsthaPM: TStringField;
    XsthaDW: TStringField;
    XsthSL: TFloatField;
    XsthDJ: TFloatField;
    XsthNSL: TFloatField;
    CgshzbXSLX: TIntegerField;
    CgshzbaXSLX: TStringField;
    CgshzbSFKFSID: TSmallintField;
    CgshzbaSFKFSMC: TStringField;
    CgshzbZHID: TSmallintField;
    CgshzbaZHMC: TStringField;
    CgshzbPH: TStringField;
    Llzb: TADOQuery;
    Ll: TADOQuery;
    LlzbID: TIntegerField;
    LlzbDJBH: TStringField;
    LlzbRQ: TDateField;
    LlzbCKID: TIntegerField;
    LlzbaCKMC: TStringField;
    LlzbJSR: TStringField;
    LlzbJE: TFloatField;
    LlzbBZ: TStringField;
    LlzbCZY: TStringField;
    LlZBID2: TIntegerField;
    LlHH: TIntegerField;
    LlRQ: TDateField;
    LlCKID: TIntegerField;
    LlHPID: TIntegerField;
    LlaBH: TStringField;
    LlaPM: TStringField;
    LlaDW: TStringField;
    LlSL: TFloatField;
    LlDJ: TFloatField;
    pLl: TDataSetProvider;
    pLlzb: TDataSetProvider;
    Tlzb: TADOQuery;
    Tl: TADOQuery;
    pTl: TDataSetProvider;
    pTlzb: TDataSetProvider;
    TlzbID: TIntegerField;
    TlzbDJBH: TStringField;
    TlzbRQ: TDateField;
    TlzbCKID: TIntegerField;
    TlzbaCKMC: TStringField;
    TlzbJSR: TStringField;
    TlzbJE: TFloatField;
    TlzbBZ: TStringField;
    TlzbCZY: TStringField;
    TlZBID2: TIntegerField;
    TlHH: TIntegerField;
    TlRQ: TDateField;
    TlCKID: TIntegerField;
    TlHPID: TIntegerField;
    TlaBH: TStringField;
    TlaPM: TStringField;
    TlaDW: TStringField;
    TlSL: TFloatField;
    TlDJ: TFloatField;
    Cpjczb: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    DateField1: TDateField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    Cpjc: TADOQuery;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    DateField2: TDateField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    pCpjc: TDataSetProvider;
    pCpjczb: TDataSetProvider;
    CpjczbPH: TStringField;
    Kcpdzb: TADOQuery;
    Kcpd: TADOQuery;
    pKcpd: TDataSetProvider;
    pKcpdzb: TDataSetProvider;
    KcpdzbID: TIntegerField;
    KcpdzbDJBH: TStringField;
    KcpdzbRQ: TDateField;
    KcpdzbCKID: TIntegerField;
    KcpdzbaCKMC: TStringField;
    KcpdzbJE: TFloatField;
    KcpdzbBZ: TStringField;
    KcpdzbCZY: TStringField;
    KcpdZBID2: TIntegerField;
    KcpdHH: TIntegerField;
    KcpdRQ: TDateField;
    KcpdCKID: TIntegerField;
    KcpdHPID: TIntegerField;
    KcpdaBH: TStringField;
    KcpdaPM: TStringField;
    KcpdaDW: TStringField;
    KcpdSL: TFloatField;
    KcpdDJ: TFloatField;
    Chtjzb: TADOQuery;
    Chtj: TADOQuery;
    pChtj: TDataSetProvider;
    pChtjzb: TDataSetProvider;
    ChtjzbID: TIntegerField;
    ChtjzbDJBH: TStringField;
    ChtjzbRQ: TDateField;
    ChtjzbJE: TFloatField;
    ChtjzbBZ: TStringField;
    ChtjzbCZY: TStringField;
    ChtjZBID2: TIntegerField;
    ChtjHH: TIntegerField;
    ChtjRQ: TDateField;
    ChtjHPID: TIntegerField;
    ChtjaBH: TStringField;
    ChtjaPM: TStringField;
    ChtjaDW: TStringField;
    ChtjSL: TFloatField;
    ChtjDJ: TFloatField;
    ChtjDJ2: TFloatField;
    Ckdbzb: TADOQuery;
    Ckdb: TADOQuery;
    pCkdb: TDataSetProvider;
    pCkdbzb: TDataSetProvider;
    CkdbzbID: TIntegerField;
    CkdbzbDJBH: TStringField;
    CkdbzbRQ: TDateField;
    CkdbzbDCCID: TIntegerField;
    CkdbzbaDCCMC: TStringField;
    CkdbzbDRCID: TIntegerField;
    CkdbzbaDRCMC: TStringField;
    CkdbzbJE: TFloatField;
    CkdbzbBZ: TStringField;
    CkdbzbCZY: TStringField;
    CkdbZBID2: TIntegerField;
    CkdbHH: TIntegerField;
    CkdbRQ: TDateField;
    CkdbDCCID: TIntegerField;
    CkdbDRCID: TIntegerField;
    CkdbHPID: TIntegerField;
    CkdbaBH: TStringField;
    CkdbaPM: TStringField;
    CkdbaDW: TStringField;
    CkdbSL: TFloatField;
    CkdbDJ: TFloatField;
    Qtkcbdzb: TADOQuery;
    Qtkcbd: TADOQuery;
    pQtkcbd: TDataSetProvider;
    pQtkcbdzb: TDataSetProvider;
    QtkcbdZBID2: TIntegerField;
    QtkcbdHH: TIntegerField;
    QtkcbdRQ: TDateField;
    QtkcbdCKID: TIntegerField;
    QtkcbdHPID: TIntegerField;
    QtkcbdaBH: TStringField;
    QtkcbdaPM: TStringField;
    QtkcbdaDW: TStringField;
    QtkcbdSL: TFloatField;
    QtkcbdDJ: TFloatField;
    QtkcbdTHSL: TFloatField;
    QtkcbdCRLX: TIntegerField;
    QtkcbdzbID: TIntegerField;
    QtkcbdzbDJBH: TStringField;
    QtkcbdzbRQ: TDateField;
    QtkcbdzbCKID: TIntegerField;
    QtkcbdzbaCKMC: TStringField;
    QtkcbdzbQTKCBDLXID: TIntegerField;
    QtkcbdzbaQTKCBDLXMC: TStringField;
    QtkcbdzbCRLX: TIntegerField;
    QtkcbdzbaCRLX: TStringField;
    QtkcbdzbaTH: TStringField;
    QtkcbdzbXGXX: TStringField;
    QtkcbdzbJE: TFloatField;
    QtkcbdzbBZ: TStringField;
    QtkcbdzbCZY: TStringField;
    Fykzzb: TADOQuery;
    IntegerField7: TIntegerField;
    StringField3: TStringField;
    DateField3: TDateField;
    SmallintField1: TSmallintField;
    StringField13: TStringField;
    SmallintField2: TSmallintField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField17: TStringField;
    FloatField4: TFloatField;
    StringField18: TStringField;
    StringField19: TStringField;
    Fykz: TADOQuery;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    DateField4: TDateField;
    pFykzzb: TDataSetProvider;
    pFykz: TDataSetProvider;
    SrzclbBH: TStringField;
    FykzSRZCLBID: TIntegerField;
    FykzZY: TStringField;
    FykzaBH: TStringField;
    FykzaMC: TStringField;
    FykzJE: TFloatField;
    Qtsrzb: TADOQuery;
    IntegerField8: TIntegerField;
    StringField9: TStringField;
    DateField5: TDateField;
    SmallintField3: TSmallintField;
    StringField10: TStringField;
    SmallintField4: TSmallintField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField16: TStringField;
    FloatField5: TFloatField;
    StringField20: TStringField;
    StringField21: TStringField;
    Qtsr: TADOQuery;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    DateField6: TDateField;
    IntegerField11: TIntegerField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    FloatField6: TFloatField;
    pQtsrzb: TDataSetProvider;
    pQtsr: TDataSetProvider;
    Yhckqk: TADOQuery;
    IntegerField14: TIntegerField;
    DateField7: TDateField;
    SmallintField6: TSmallintField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField7: TFloatField;
    StringField30: TStringField;
    StringField31: TStringField;
    pYhckqk: TDataSetProvider;
    YhckqkZHID: TSmallintField;
    YhckqkaZHMC: TStringField;
    XskdHelp: TADOQuery;
    pXskdHelp: TDataSetProvider;
    XskdHelpID: TIntegerField;
    XskdHelpDJBH: TStringField;
    XskdHelpRQ: TDateField;
    XskdHelpaXSLX: TStringField;
    XskdHelpJE: TFloatField;
    XskdHelpaKHBH: TStringField;
    XskdHelpaKHMC: TStringField;
    CgshHelp: TADOQuery;
    pCgshHelp: TDataSetProvider;
    CgshHelpID: TIntegerField;
    CgshHelpDJBH: TStringField;
    CgshHelpRQ: TDateField;
    CgshHelpaCGLX: TStringField;
    CgshHelpJE: TFloatField;
    CgshHelpaGYSBH: TStringField;
    CgshHelpaGYSMC: TStringField;
    Thgc: TADOQuery;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    DateField8: TDateField;
    IntegerField19: TIntegerField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField32: TStringField;
    FloatField8: TFloatField;
    pThgc: TDataSetProvider;
    Sjzl: TADOQuery;
    SjzlID: TIntegerField;
    SjzlXH: TSmallintField;
    SjzlMC: TStringField;
    SjzlBZ: TStringField;
    pSjzl: TDataSetProvider;
    HpQCJQJ: TFloatField;
    XskdDJ: TFloatField;
    XsthCBDJ: TFloatField;
    ThgcDJ: TFloatField;
    HpJQJ: TFloatField;
    ZhQCJE: TFloatField;
    ZhQMJE: TFloatField;
    ZhITMP: TIntegerField;
    CgshzbSKQX: TIntegerField;
    CgshzbYFJE2: TFloatField;
    XskdzbYSJE2: TFloatField;
    CgshzbYFJE3: TFloatField;
    XskdzbYSJE3: TFloatField;
    {-Common Begin-}
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure CnWillExecute(Connection: TADOConnection;
      var CommandText: WideString; var CursorType: TCursorType;
      var LockType: TADOLockType; var CommandType: TCommandType;
      var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
      const Command: _Command; const Recordset: _Recordset);
    procedure pAppUserGroupAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TClientDataSet;
      UpdateKind: TUpdateKind);
    procedure pAppUserAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TClientDataSet;
      UpdateKind: TUpdateKind);
    procedure pCgddzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pHpAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCgshzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCgshAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pKhAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pGysAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pSjzlAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCkAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCgfkzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCgfkAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCgthzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCgthAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pXsddzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pXskdzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pXskdAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pXsskzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pXsskAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pXsthzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pXsthAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pLlzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pLlAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pTlzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pTlAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCpjczbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCpjcAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pKcpdzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pKcpdAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pChtjzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pChtjAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCkdbzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pCkdbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pQtkcbdzbAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TClientDataSet;
      UpdateKind: TUpdateKind);
    procedure pQtkcbdAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pFykzzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pQtsrzbAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pZhAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
    procedure pYhckqkAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
  private
    { Private declarations }
    procedure SetFieldValue(strSql:string; Ds: TDataSet; strFields: string);
    procedure SqlExec(strSql: string);
    function CheckRecord(strSql: string):Boolean;  //检查是否有符合条件的记录
    function GetFieldValue(strSql: string):Variant;  //返回sql语句的字段值（一个）
    function IsModify(DeltaDS: TClientDataSet; strFieldName: string): boolean;
    function GetCurValue(DeltaDS: TClientDataSet; strFieldName: string): Variant;
    function GetValue(DeltaDS: TClientDataSet; strFieldName: string;
      GetValueType: TGetValueType): string;
    //Set JQJ
    procedure SetJQJ(strHPID: string; SL, DJ: double; Kind: string);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure SetFilter(Filter: OleVariant); safecall;
  public
    { Public declarations }
  end;

implementation

uses Variants, Mains, ComFun;

{$R *.DFM}

{-Common Begin-}

//RemoteDataModuleCreate
procedure TDatas.RemoteDataModuleCreate(Sender: TObject);
begin
  Cn.ConnectionString := 'Data Source=' + ExtractFilePath(Application.ExeName) + 'Data.Mdb';
end;

//UpdateRegistry
class procedure TDatas.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

//SetFilter
procedure TDatas.SetFilter(Filter: OleVariant);
var
  DataSet : TDataSet;
begin
  DataSet := TDataSet( Self.FindComponent( VarToStr(Filter[0]) ) );
  DataSet.Filter := VarToStr(Filter[1]);
  DataSet.Filtered := DataSet.Filter <> '';
end;

//strFields:要赋值的字段列表，用';'分开
procedure TDatas.SetFieldValue(strSql: string; Ds: TDataSet;
  strFields: string);
var
  strFieldName: string;
  i: integer;
begin
  Tmp.Close;
  Tmp.SQL.Text := strSql;
  Tmp.Open;
  i := 0;
  while strFields <> '' do
  begin
    if Pos(';', strFields) <> 0 then
    begin
      strFieldName := copy(strFields, 1, Pos(';', strFields)-1);
      strFields := copy(strFields, Pos(';', strFields)+1, length(strFields));
    end else
    begin
      strFieldName := strFields;
      strFields := '';
    end;
    ds.FieldByName(strFieldName).Value := Tmp.Fields[i].Value;
    inc(i);
  end;
  Tmp.Close;
end;

//执行SQL语句
procedure TDatas.SqlExec(strSql: string);
begin
  with Tmp do
  begin
    Close;
    Sql.Text := strSql;
    ExecSQL;
    Close;
  end;
end;

//检查是否有符合条件的记录
function TDatas.CheckRecord(strSql: string): Boolean;
begin
  with Tmp do
  begin
    Close;
    Sql.Text := strSql;
    Open;
    Result := not IsEmpty;
    Close;
  end;
end;

//返回sql语句的字段值（一个）
function TDatas.GetFieldValue(strSql: string): Variant;
begin
  with Tmp do
  begin
    Sql.Text := strSql;
		Open;
		if not IsEmpty then
			Result := Fields[0].Value
		else
			Result := null;
		Close;
	end;
end;

//判断某字段是否有修改过
function TDatas.IsModify(DeltaDS: TClientDataSet;
  strFieldName: string): boolean;
begin
  result := (not VarIsEmpty(DeltaDS.FieldByName(strFieldName).NewValue)) and
    (DeltaDS.FieldByName(strFieldName).NewValue <>
    DeltaDS.FieldByName(strFieldName).OLdValue);
end;

//返回当前值
function TDatas.GetCurValue(DeltaDS: TClientDataSet;
  strFieldName: string): Variant;
begin
  if IsModify(DeltaDS, strFieldName) then
    result := DeltaDS.FieldByName(strFieldName).NewValue
  else
    result := DeltaDS.FieldByName(strFieldName).OldValue;
end;

//返回旧值、新值或当前值（返回字符型）
function TDatas.GetValue(DeltaDS: TClientDataSet; strFieldName: string;
  GetValueType: TGetValueType): string;
var
  v: Variant;
begin
  case GetValueType of
    gtOld: v := DeltaDS.FieldByName(strFieldName).OldValue;
    gtNew: v := DeltaDS.FieldByName(strFieldName).NewValue;
    gtCur: v := GetCurValue(DeltaDS, strFieldName);
  end;
  if DeltaDS.FieldByName(strFieldName) is TStringField then
  begin
    if VarIsEmpty(v) or (v = null) then
      Result := ''
    else
      Result := VarToStr(v);
  end
  else if DeltaDS.FieldByName(strFieldName) is TNumericField then
  begin
    if VarIsEmpty(v) or (v = null) then
      Result := '0'
    else
      Result := VarToStr(v);
  end
  else
    result := VarToStr(v);
end;

//CnWillExecute
procedure TDatas.CnWillExecute(Connection: TADOConnection;
  var CommandText: WideString; var CursorType: TCursorType;
  var LockType: TADOLockType; var CommandType: TCommandType;
  var ExecuteOptions: TExecuteOptions; var EventStatus: TEventStatus;
  const Command: _Command; const Recordset: _Recordset);
begin
  if Copy(UpperCase(CommandText), 1, 6) = 'UPDATE' then
    if Pos('SET', UpperCase(CommandText)) = 0 then
    begin
      EventStatus := esCancel;
      frmMains.Memo1.Text := Copy('Not Execute: ' + CommandText + #13#10#13#10 + frmMains.Memo1.Text,1 , 10240);
      Exit;
    end;
  frmMains.Memo1.Text := Copy(CommandText + #13#10#13#10 + frmMains.Memo1.Text,1 , 10240);
end;

//pAppUserGroup.AfterUpdateRecord
procedure TDatas.pAppUserGroupAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukModify:
    if IsModify(DeltaDS, 'gName') then
    begin
      SqlExec('update AppUser set gName = ''' + DeltaDS.FieldByName('gName').NewValue + ''' ' +
        'where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('update AppGroupAction set gName = ''' + DeltaDS.FieldByName('gName').NewValue + ''' ' +
        'where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('update AppGroupDesktop set gName = ''' + DeltaDS.FieldByName('gName').NewValue + ''' ' +
        'where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('update AppGroupDesktopClass set gName = ''' + DeltaDS.FieldByName('gName').NewValue + ''' ' +
        'where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('update AppGroupField set gName = ''' + DeltaDS.FieldByName('gName').NewValue + ''' ' +
        'where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('update AppGroupMenu set gName = ''' + DeltaDS.FieldByName('gName').NewValue + ''' ' +
        'where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
    end;
  ukDelete:
    begin
      SqlExec('delete from AppUser where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('delete from AppGroupAction where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('delete from AppGroupDesktop where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('delete from AppGroupDesktopClass where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('delete from AppGroupField where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
      SqlExec('delete from AppGroupMenu where gName = ''' + DeltaDS.FieldByName('gName').OldValue + '''');
    end;
  end;
end;

//pAppUserAfter.UpdateRecord
procedure TDatas.pAppUserAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukDelete:
    begin
      SqlExec('delete from AppInCommonUse where uId = ' + IntToStr(DeltaDS.FieldByName('ID').OldValue));
      SqlExec('delete from AppSort where uId = ' + IntToStr(DeltaDS.FieldByName('ID').OldValue));
      SqlExec('delete from AppFilter where uId = ' + IntToStr(DeltaDS.FieldByName('ID').OldValue));
    end;
  end;
end;

{-Common End-}

//Set JQJ
procedure TDatas.SetJQJ(strHPID: string; SL, DJ: double; Kind: string);
var
  dblZKCL, dblOLDJ, dblJQJ: double;
begin
  dblZKCL := Str2Float(GetFieldValue('select sum(JCS) from HPKC where HPID = ' + strHPID));
  dblOLDJ := Str2Float(GetFieldValue('select JQJ from HP where ID = ' + strHPID));
  if Kind = '+' then
  begin
    //((现总数 + 处理数) * 现价 + 处理数 * 处理价) / (现总数 + 处理数)
    if dblZKCL <> 0 then
      dblJQJ := RoundPlus((RoundPlus(dblZKCL * dblOLDJ, 3) + RoundPlus(SL * DJ, 3)) / (dblZKCL + SL), 3)
    else
      dblJQJ := 0;
    SqlExec('update HP set JQJ = ' + Float2Str(dblJQJ) + ' where ID = ' + strHPID);
  end
  else
  begin
    //(现总数 * 现价 - 处理数 * 处理价) / (现总数 - 处理数)
    if dblZKCL - SL <> 0 then
      dblJQJ := RoundPlus((RoundPlus(dblZKCL * dblOLDJ, 3) - RoundPlus(SL * DJ, 3)) / (dblZKCL - SL), 3)
    else
      dblJQJ := 0;
    SqlExec('update HP set JQJ = ' + Float2Str(dblJQJ) + ' where ID = ' + strHPID);
  end;
end;

//客户
procedure TDatas.pKhAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      SqlExec('update KH set QMJE = ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ID', gtNew));
      SqlExec('insert into XSKDZB (ID, DJBH, KHID, JE, YSJE, XSLX, BZ) ' +
        'values(-' + GetValue(DeltaDS, 'ID', gtNew) + ', ''期初应收'', ' +
        GetValue(DeltaDS, 'ID', gtNew) + ', ' +
        GetValue(DeltaDS, 'QCJE', gtNew) + ', 0, 0, ''客户期初应收款'')');
    end;
  ukModify:
    if IsModify(DeltaDS, 'QCJE') then
    begin
      SqlExec('update KH set QMJE = QMJE - ' + GetValue(DeltaDS, 'QCJE', gtOld) +
        ' + ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ID', gtOld));
      if CheckRecord('select ID from XSKDZB where ID = -' + GetValue(DeltaDS, 'ID', gtCur)) then
        SqlExec('update XSKDZB set JE = ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
          'where ID = -' + GetValue(DeltaDS, 'ID', gtOld))
      else
        SqlExec('insert into XSKDZB (ID, DJBH, KHID, JE, YSJE, XSLX, BZ) ' +
          'values(-' + GetValue(DeltaDS, 'ID', gtCur) + ', ''期初应收'', ' +
          GetValue(DeltaDS, 'ID', gtCur) + ', ' +
          GetValue(DeltaDS, 'QCJE', gtNew) + ', 0, 0, ''客户期初应收款'')');
    end;
  ukDelete:
    SqlExec('delete from XSKDZB where ID = -' + GetValue(DeltaDS, 'ID', gtOld));
  end;
end;

//供应商
procedure TDatas.pGysAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      SqlExec('update GYS set QMJE = ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ID', gtNew));
      SqlExec('insert into CGSHZB (ID, DJBH, GYSID, JE, YFJE, CGLX, BZ) ' +
        'values(-' + GetValue(DeltaDS, 'ID', gtNew) + ', ''期初应付'', ' +
        GetValue(DeltaDS, 'ID', gtNew) + ', ' +
        GetValue(DeltaDS, 'QCJE', gtNew) + ', 0, 0, ''供应商期初应付款'')');
    end;
  ukModify:
    if IsModify(DeltaDS, 'QCJE') then
    begin
      SqlExec('update GYS set QMJE = QMJE - ' + GetValue(DeltaDS, 'QCJE', gtOld) +
        ' + ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ID', gtOld));
      if CheckRecord('select ID from CGSHZB where ID = -' + GetValue(DeltaDS, 'ID', gtCur)) then
        SqlExec('update CGSHZB set JE = ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
          'where ID = -' + GetValue(DeltaDS, 'ID', gtOld))
      else
        SqlExec('insert into CGSHZB (ID, DJBH, GYSID, JE, YFJE, CGLX, BZ) ' +
          'values(-' + GetValue(DeltaDS, 'ID', gtCur) + ', ''期初应付'', ' +
          GetValue(DeltaDS, 'ID', gtCur) + ', ' +
          GetValue(DeltaDS, 'QCJE', gtNew) + ', 0, 0, ''供应商期初应付款'')');
    end;
  ukDelete:
    SqlExec('delete from CGSHZB where ID = -' + GetValue(DeltaDS, 'ID', gtOld));
  end;
end;

//帐户
procedure TDatas.pZhAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update ZH set QMJE = ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'ID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'QCJE') then
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'QCJE', gtOld) +
        ' + ' + GetValue(DeltaDS, 'QCJE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ID', gtOld));
  end;
end;

//仓库
procedure TDatas.pCkAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('insert into HPKC (CKID, HPID, QCS, JCS) ' +
      'select ' + GetValue(DeltaDS, 'ID', gtNew) + ', ID, 0, 0 from HP');
  ukDelete:
    SqlExec('delete from HPKC where CKID = ' + GetValue(DeltaDS, 'ID', gtOld));
  end;
end;

//售价种类
procedure TDatas.pSjzlAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukDelete:
    SqlExec('delete from HPSJ where SJZLID = ' + GetValue(DeltaDS, 'ID', gtOld));
  end;
end;

//货品
procedure TDatas.pHpAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukDelete:
    begin
      SqlExec('delete from HPKC where HPID = ' + GetValue(DeltaDS, 'ID', gtOld));
      SqlExec('delete from HPSJ where HPID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//采购订单总表
procedure TDatas.pCgddzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukDelete:
    SqlExec('delete from CGDD where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
  end;
end;

//采购收货总表
procedure TDatas.pCgshzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //GYS
      SqlExec('update GYS set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'CGLX', gtNew) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'GYSID', gtNew));
      //ZH
      SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'CGLX', gtNew) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
    end;
  ukModify:
    begin
      //GYS
      if IsModify(DeltaDS, 'GYSID') or IsModify(DeltaDS, 'CGLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update GYS set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'CGLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'GYSID', gtOld));
        SqlExec('update GYS set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'CGLX', gtCur) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'GYSID', gtCur));
      end;
      //ZH
      if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'CGLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'CGLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
        SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'CGLX', gtCur) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
      end;
      //HP
      if IsModify(DeltaDS, 'CKID') then
      begin
        SqlExec('update CGSH J, HPKC K set K.JCS = K.JCS - J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
        SqlExec('update CGSH J, HPKC K set K.JCS = K.JCS + J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      end;
    end;
  ukDelete:
    begin
      //JQJ
      with Tmpl do
      begin
        Close;
        Sql.Text := 'select * from CGSH where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld);
        Open;
        while not Eof do
        begin
          SetJQJ(FieldByName('HPID').AsString, FieldByName('SL').AsFloat, FieldByName('DJ').AsFloat, '-');
          Next;
        end;
        Close;
      end;
      //GYS
      SqlExec('update GYS set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'CGLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'GYSID', gtOld));
      //ZH
      SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'CGLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      //HP
      SqlExec('update CGSH J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('delete from CGSH where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//采购收货
procedure TDatas.pCgshAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
var
  dblDj: Double;
begin
  case UpdateKind of
  ukInsert:
    begin
      //JQJ (必需在 SET JCS 之前)
      SetJQJ(GetValue(DeltaDS, 'HPID', gtNew), Str2Float(GetValue(DeltaDS, 'SL', gtNew)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtNew)), '+');
      //JCS
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
    end;
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') or IsModify(DeltaDS, 'DJ') then
    begin
      //JQJ
      SetJQJ(GetValue(DeltaDS, 'HPID', gtOld), Str2Float(GetValue(DeltaDS, 'SL', gtOld)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtOld)), '-');
      //OLD HP JCS
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      //JQJ
      SetJQJ(GetValue(DeltaDS, 'HPID', gtCur), Str2Float(GetValue(DeltaDS, 'SL', gtCur)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtCur)), '+');
      //NEW HP JCS
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    begin
      //JQJ (必需在 SET JCS 之前)
      SetJQJ(GetValue(DeltaDS, 'HPID', gtOld), Str2Float(GetValue(DeltaDS, 'SL', gtOld)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtOld)), '-');
      //JCS
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
    end;
  end;
  if UpdateKind in [ukInsert, ukModify] then
  begin
    dblDJ := GetCurValue(DeltaDS, 'DJ');
    if VarToFloat(GetFieldValue('select JJ from HP where ID = ' + GetValue(DeltaDS, 'HPID', gtCur))) <> dblDJ then
      SqlExec('update HP set JJ = ' + FloatToStr(dblDJ) + ', JJJ = JJ where ID = ' + GetValue(DeltaDS, 'HPID', gtCur));
  end;
end;

//采购付款总表
procedure TDatas.pCgfkzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //GYS
      SqlExec('update GYS set ' +
        'QMJE = QMJE - (' + GetValue(DeltaDS, 'JE', gtNew) + ' - ' + GetValue(DeltaDS, 'JEB', gtNew) + '), ' +
        'YXJE = YXJE + ' + GetValue(DeltaDS, 'JEB', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'GYSID', gtNew));
      //ZH
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
    end;
  ukModify:
    begin
      //GYS
      if IsModify(DeltaDS, 'GYSID') or IsModify(DeltaDS, 'JE') or
        IsModify(DeltaDS, 'JEB') then
      begin
        SqlExec('update GYS set ' +
          'QMJE = QMJE + (' + GetValue(DeltaDS, 'JE', gtOld) + ' - ' + GetValue(DeltaDS, 'JEB', gtOld) + '), ' +
          'YXJE = YXJE - ' + GetValue(DeltaDS, 'JEB', gtOld) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'GYSID', gtOld));
        SqlExec('update GYS set ' +
          'QMJE = QMJE - (' + GetValue(DeltaDS, 'JE', gtCur) + ' - ' + GetValue(DeltaDS, 'JEB', gtCur) + '), ' +
          'YXJE = YXJE + ' + GetValue(DeltaDS, 'JEB', gtCur) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'GYSID', gtCur));
      end;
      //ZH
      if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
        SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
      end;
    end;
  ukDelete:
    begin
      //CGSH.YFJE
      SqlExec('update CGFK J, CGSHZB S set S.YFJE = S.YFJE - J.JE ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.DDID = S.ID');
      //GYS
      SqlExec('update GYS set ' +
        'QMJE = QMJE + (' + GetValue(DeltaDS, 'JE', gtOld) + ' - ' + GetValue(DeltaDS, 'JEB', gtOld) + '), ' +
        'YXJE = YXJE - ' + GetValue(DeltaDS, 'JEB', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'GYSID', gtOld));
      //ZH
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('delete from CGFK where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//采购付款
procedure TDatas.pCgfkAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update CGSHZB set YFJE = YFJE + ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'DDID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'DDID') or IsModify(DeltaDS, 'JE') then
    begin
      SqlExec('update CGSHZB set YFJE = YFJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'DDID', gtOld));
      SqlExec('update CGSHZB set YFJE = YFJE + ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'DDID', gtCur));
    end;
  ukDelete:
    SqlExec('update CGSHZB set YFJE = YFJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'DDID', gtOld));
  end;
end;

//采购退货总表
procedure TDatas.pCgthzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //GYS
      SqlExec('update GYS set YXJE = YXJE + iif(' + GetValue(DeltaDS, 'THLX', gtNew) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'GYSID', gtNew));
      //ZH
      SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'THLX', gtNew) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
    end;
  ukModify:
    begin
      //GYS
      if IsModify(DeltaDS, 'GYSID') or IsModify(DeltaDS, 'THLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update GYS set YXJE = YXJE - iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'GYSID', gtOld));
        SqlExec('update GYS set YXJE = YXJE + iif(' + GetValue(DeltaDS, 'THLX', gtCur) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'GYSID', gtCur));
      end;
      //ZH
      if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'THLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
        SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'THLX', gtCur) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
      end;
      //HP
      if IsModify(DeltaDS, 'CKID') then
      begin
        SqlExec('update CGTH J, HPKC K set K.JCS = K.JCS + J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
        SqlExec('update CGTH J, HPKC K set K.JCS = K.JCS - J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      end;
    end;
  ukDelete:
    begin
      //HP
      SqlExec('update CGTH J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      //GYS
      SqlExec('update GYS set YXJE = YXJE - iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'GYSID', gtOld));
      //ZH
      SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('delete from CGTH where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//采购退货
procedure TDatas.pCgthAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') then
    begin
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
  end;
end;

//销售订单总表
procedure TDatas.pXsddzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukDelete:
    SqlExec('delete from XSDD where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
  end;
end;

//销售开单总表
procedure TDatas.pXskdzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //KH
      SqlExec('update KH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'XSLX', gtNew) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'KHID', gtNew));
      //ZH
      SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'XSLX', gtNew) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
    end;
  ukModify:
    begin
      //KH
      if IsModify(DeltaDS, 'KHID') or IsModify(DeltaDS, 'XSLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update KH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'XSLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'KHID', gtOld));
        SqlExec('update KH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'XSLX', gtCur) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'KHID', gtCur));
      end;
      //ZH
      if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'XSLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'XSLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
        SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'XSLX', gtCur) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
      end;
      //HP
      if IsModify(DeltaDS, 'CKID') then
      begin
        SqlExec('update XSKD J, HPKC K set K.JCS = K.JCS + J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
        SqlExec('update XSKD J, HPKC K set K.JCS = K.JCS - J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      end;
    end;
  ukDelete:
    begin
      //HP
      SqlExec('update XSKD J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      //KH
      SqlExec('update KH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'XSLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'KHID', gtOld));
      //ZH
      SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'XSLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('delete from XSKD where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//销售开单
procedure TDatas.pXskdAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') then
    begin
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
  end;
end;

//销售收款总表
procedure TDatas.pXsskzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //KH
      SqlExec('update KH set ' +
        'QMJE = QMJE - (' + GetValue(DeltaDS, 'JE', gtNew) + ' - ' + GetValue(DeltaDS, 'JEB', gtNew) + '), ' +
        'YXJE = YXJE + ' + GetValue(DeltaDS, 'JEB', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'KHID', gtNew));
      //ZH
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
    end;
  ukModify:
    begin
      //KH
      if IsModify(DeltaDS, 'KHID') or IsModify(DeltaDS, 'JE') or
        IsModify(DeltaDS, 'JEB') then
      begin
        SqlExec('update KH set ' +
          'QMJE = QMJE + (' + GetValue(DeltaDS, 'JE', gtOld) + ' - ' + GetValue(DeltaDS, 'JEB', gtOld) + '), ' +
          'YXJE = YXJE - ' + GetValue(DeltaDS, 'JEB', gtOld) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'KHID', gtOld));
        SqlExec('update KH set ' +
          'QMJE = QMJE - (' + GetValue(DeltaDS, 'JE', gtCur) + ' - ' + GetValue(DeltaDS, 'JEB', gtCur) + '), ' +
          'YXJE = YXJE + ' + GetValue(DeltaDS, 'JEB', gtCur) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'KHID', gtCur));
      end;
      //ZH
      if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
        SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
      end;
    end;
  ukDelete:
    begin
      SqlExec('update XSSK J, XSKDZB S set S.YSJE = S.YSJE - J.JE ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.DDID = S.ID');
      //KH
      SqlExec('update KH set ' +
        'QMJE = QMJE + (' + GetValue(DeltaDS, 'JE', gtOld) + ' - ' + GetValue(DeltaDS, 'JEB', gtOld) + '), ' +
        'YXJE = YXJE - ' + GetValue(DeltaDS, 'JEB', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'KHID', gtOld));
      //ZH
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('delete from XSSK where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//销售收款
procedure TDatas.pXsskAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update XSKDZB set YSJE = YSJE + ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'DDID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'DDID') or IsModify(DeltaDS, 'JE') then
    begin
      SqlExec('update XSKDZB set YSJE = YSJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'DDID', gtOld));
      SqlExec('update XSKDZB set YSJE = YSJE + ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'DDID', gtCur));
    end;
  ukDelete:
    SqlExec('update XSKDZB set YSJE = YSJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'DDID', gtOld));
  end;
end;

//销售退款总表
procedure TDatas.pXsthzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //KH
      SqlExec('update KH set YXJE = YXJE + iif(' + GetValue(DeltaDS, 'THLX', gtNew) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'KHID', gtNew));
      //ZH
      SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'THLX', gtNew) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtNew) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
    end;
  ukModify:
    begin
      //KH
      if IsModify(DeltaDS, 'KHID') or IsModify(DeltaDS, 'THLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update KH set YXJE = YXJE - iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'KHID', gtOld));
        SqlExec('update KH set YXJE = YXJE + iif(' + GetValue(DeltaDS, 'THLX', gtCur) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'KHID', gtCur));
      end;
      //ZH
      if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'THLX') or IsModify(DeltaDS, 'JE') then
      begin
        SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
        SqlExec('update ZH set QMJE = QMJE - iif(' + GetValue(DeltaDS, 'THLX', gtCur) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtCur) + ', 0) ' +
          'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
      end;
      //HP
      if IsModify(DeltaDS, 'CKID') then
      begin
        SqlExec('update XSTH J, HPKC K set K.JCS = K.JCS - J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
        SqlExec('update XSTH J, HPKC K set K.JCS = K.JCS + J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      end;
    end;
  ukDelete:
    begin
      //HP
      SqlExec('update XSTH J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      //KH
      SqlExec('update KH set YXJE = YXJE - iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 2, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'KHID', gtOld));
      //ZH
      SqlExec('update ZH set QMJE = QMJE + iif(' + GetValue(DeltaDS, 'THLX', gtOld) + ' = 1, ' + GetValue(DeltaDS, 'JE', gtOld) + ', 0) ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('delete from XSTH where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//销售退款
procedure TDatas.pXsthAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') then
    begin
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
  end;
end;

//领料总表
procedure TDatas.pLlzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukModify:
    if IsModify(DeltaDS, 'CKID') then
    begin
      SqlExec('update LL J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('update LL J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    begin
      SqlExec('update LL J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('delete from LL where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//领料
procedure TDatas.pLlAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') then
    begin
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
  end;
end;

//退料总表
procedure TDatas.pTlzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukModify:
    if IsModify(DeltaDS, 'CKID') then
    begin
      SqlExec('update TL J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('update TL J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    begin
      SqlExec('update TL J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('delete from TL where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//退料
procedure TDatas.pTlAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') then
    begin
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
  end;
end;

//产品进仓总表
procedure TDatas.pCpjczbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukModify:
    if IsModify(DeltaDS, 'CKID') then
    begin
      SqlExec('update CPJC J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('update CPJC J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    begin
      //JQJ
      with Tmpl do
      begin
        Close;
        Sql.Text := 'select * from CPJC where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld);
        Open;
        while not Eof do
        begin
          SetJQJ(FieldByName('HPID').AsString, FieldByName('SL').AsFloat, FieldByName('DJ').AsFloat, '-');
          Next;
        end;
        Close;
      end;
      //JCS
      SqlExec('update CPJC J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('delete from CPJC where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//产品进仓
procedure TDatas.pCpjcAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //JQJ (必需在 SET JCS 之前)
      SetJQJ(GetValue(DeltaDS, 'HPID', gtNew), Str2Float(GetValue(DeltaDS, 'SL', gtNew)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtNew)), '+');
      //JCS
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
    end;
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') or IsModify(DeltaDS, 'DJ') then
    begin
      //JQJ
      SetJQJ(GetValue(DeltaDS, 'HPID', gtOld), Str2Float(GetValue(DeltaDS, 'SL', gtOld)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtOld)), '-');
      //OLD HP JCS
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      //JQJ
      SetJQJ(GetValue(DeltaDS, 'HPID', gtCur), Str2Float(GetValue(DeltaDS, 'SL', gtCur)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtCur)), '+');
      //NEW HP JCS
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    begin
      //JQJ (必需在 SET JCS 之前)
      SetJQJ(GetValue(DeltaDS, 'HPID', gtOld), Str2Float(GetValue(DeltaDS, 'SL', gtOld)),
        Str2Float(GetValue(DeltaDS, 'DJ', gtOld)), '-');
      //JCS
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
    end;
  end;
end;

//库存盘点总表
procedure TDatas.pKcpdzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukModify:
    if IsModify(DeltaDS, 'CKID') then
    begin
      SqlExec('update KCPD J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('update KCPD J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    begin
      SqlExec('update KCPD J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('delete from KCPD where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//库存盘点
procedure TDatas.pKcpdAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') then
    begin
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
  end;
end;

//存货调价单总表
procedure TDatas.pChtjzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukDelete:
    begin
      SqlExec('update CHTJ J, HP K set K.JQJ = J.JDJ ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and J.HPID = K.ID');
      SqlExec('delete from CHTJ where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//存货调价单
procedure TDatas.pChtjAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HP set JQJ = ' + GetValue(DeltaDS, 'DJ', gtNew) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'HPID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'DJ') then
    begin
      SqlExec('update HP set JQJ = ' + GetValue(DeltaDS, 'JDJ', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'HPID', gtOld));
      SqlExec('update HP set JQJ = ' + GetValue(DeltaDS, 'DJ', gtCur) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'HPID', gtCur));
    end;
  ukDelete:
    SqlExec('update HP set JQJ = ' + GetValue(DeltaDS, 'JDJ', gtOld) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'HPID', gtOld));
  end;
end;

//仓库调拨总表
procedure TDatas.pCkdbzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukModify:
    begin
      if IsModify(DeltaDS, 'DCCID') then
      begin
        SqlExec('update CKDB J, HPKC K set K.JCS = K.JCS + J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'DCCID', gtOld));
        SqlExec('update CKDB J, HPKC K set K.JCS = K.JCS - J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'DCCID', gtCur));
      end;
      if IsModify(DeltaDS, 'DRCID') then
      begin
        SqlExec('update CKDB J, HPKC K set K.JCS = K.JCS - J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'DRCID', gtOld));
        SqlExec('update CKDB J, HPKC K set K.JCS = K.JCS + J.SL ' +
          'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
          'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'DRCID', gtCur));
      end;
    end;
  ukDelete:
    begin
      SqlExec('update CKDB J, HPKC K set K.JCS = K.JCS + J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'DCCID', gtOld));
      SqlExec('update CKDB J, HPKC K set K.JCS = K.JCS - J.SL ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'DRCID', gtOld));
      SqlExec('delete from CKDB where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//仓库调拨
procedure TDatas.pCkdbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DCCID', gtNew));
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtNew) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DRCID', gtNew));
    end;
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') then
    begin
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DCCID', gtCur));
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DRCID', gtCur));
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DCCID', gtCur));
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtCur) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DRCID', gtCur));
    end;
  ukDelete:
    begin
      SqlExec('update HPKC set JCS = JCS + ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DCCID', gtOld));
      SqlExec('update HPKC set JCS = JCS - ' + GetValue(DeltaDS, 'SL', gtOld) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'DRCID', gtOld));
    end;
  end;
end;

//其它库存变动总表
procedure TDatas.pQtkcbdzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukModify:
    if IsModify(DeltaDS, 'CKID') or IsModify(DeltaDS, 'CRLX') then
    begin
      SqlExec('update QTKCBD J, HPKC K set K.JCS = K.JCS ' + iif(GetValue(DeltaDS, 'CRLX', gtOld) = '1', '+', '-') + ' (J.SL - J.THSL) ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('update QTKCBD J, HPKC K set K.JCS = K.JCS ' + iif(GetValue(DeltaDS, 'CRLX', gtCur) = '1', '-', '+') + ' (J.SL - J.THSL) ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    begin
      SqlExec('update QTKCBD J, HPKC K set K.JCS = K.JCS ' + iif(GetValue(DeltaDS, 'CRLX', gtOld) = '1', '+', '-') + ' (J.SL - J.THSL) ' +
        'where J.ZBID = ' + GetValue(DeltaDS, 'ID', gtOld) + ' and ' +
        'J.HPID = K.HPID and K.CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
      SqlExec('delete from QTKCBD where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
      SqlExec('delete from THGC where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//其它库存变动总表
procedure TDatas.pQtkcbdAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update HPKC set JCS = JCS ' + iif(GetValue(DeltaDS, 'CRLX', gtNew) = '1', '-', '+') + Float2Str((DeltaDS.FieldByName('SL').NewValue - DeltaDS.FieldByName('THSL').NewValue)) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtNew) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'HPID') or IsModify(DeltaDS, 'SL') or IsModify(DeltaDS, 'THSL') then
    begin
      SqlExec('update HPKC set JCS = JCS ' + iif(GetValue(DeltaDS, 'CRLX', gtCur) = '1', '+', '-') + Float2Str((DeltaDS.FieldByName('SL').OldValue - DeltaDS.FieldByName('THSL').OldValue)) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
      SqlExec('update HPKC set JCS = JCS ' + iif(GetValue(DeltaDS, 'CRLX', gtCur) = '1', '-', '+') + Float2Str(GetCurValue(DeltaDS, 'SL') - GetCurValue(DeltaDS, 'THSL')) + ' ' +
        'where HPID = ' + GetValue(DeltaDS, 'HPID', gtCur) + ' and ' +
        'CKID = ' + GetValue(DeltaDS, 'CKID', gtCur));
    end;
  ukDelete:
    SqlExec('update HPKC set JCS = JCS ' + iif(GetValue(DeltaDS, 'CRLX', gtOld) = '1', '+', '-') + Float2Str((DeltaDS.FieldByName('SL').OldValue - DeltaDS.FieldByName('THSL').OldValue)) + ' ' +
      'where HPID = ' + GetValue(DeltaDS, 'HPID', gtOld) + ' and ' +
      'CKID = ' + GetValue(DeltaDS, 'CKID', gtOld));
  end;
end;

//费用开支总表
procedure TDatas.pFykzzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'JE') then
    begin
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
    end;
  ukDelete:
    begin
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('delete from FYKZ where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;


//其它收入总表
procedure TDatas.pQtsrzbAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
      'where ID = ' + GetValue(DeltaDS, 'ZHID', gtNew));
  ukModify:
    if IsModify(DeltaDS, 'ZHID') or IsModify(DeltaDS, 'JE') then
    begin
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtCur));
    end;
  ukDelete:
    begin
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZHID', gtOld));
      SqlExec('delete from QTSR where ZBID = ' + GetValue(DeltaDS, 'ID', gtOld));
    end;
  end;
end;

//银行存款／取款
procedure TDatas.pYhckqkAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  case UpdateKind of
  ukInsert:
    begin
      //ZCZH
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZCZHID', gtNew));
      //ZRZH
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtNew) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZRZHID', gtNew));
    end;
  ukModify:
    if IsModify(DeltaDS, 'ZCZHID') or IsModify(DeltaDS, 'ZRZHID') or IsModify(DeltaDS, 'JE') then
    begin
      //ZCZH
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZCZHID', gtOld));
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZCZHID', gtCur));
      //ZRZH
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZRZHID', gtOld));
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtCur) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZRZHID', gtCur));
    end;
  ukDelete:
    begin
      //ZCZH
      SqlExec('update ZH set QMJE = QMJE + ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZCZHID', gtOld));
      //ZRZH
      SqlExec('update ZH set QMJE = QMJE - ' + GetValue(DeltaDS, 'JE', gtOld) + ' ' +
        'where ID = ' + GetValue(DeltaDS, 'ZRZHID', gtOld));
    end;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TDatas,
    Class_Datas, ciMultiInstance, tmApartment);


end.

unit Dm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect,Variants;

type
  TData = class(TDataModule)
    Cn: TDCOMConnection;
    Tmp: TClientDataSet;
    Tmpf: TClientDataSet;
    Tmpl: TClientDataSet;
    AppUserGroup: TClientDataSet;
    AppUserGroupgName: TStringField;
    AppUserGroupgMemo: TStringField;
    AppUser: TClientDataSet;
    AppUseruCode: TStringField;
    AppUseruName: TStringField;
    AppUsergName: TStringField;
    AppUserID: TIntegerField;
    sAppUser: TDataSource;
    AppGroupDesktopClass: TClientDataSet;
    AppGroupDesktopClassgName: TStringField;
    AppGroupDesktopClasscName: TStringField;
    sAppGroupDesktopClass: TDataSource;
    sAppUserGroup: TDataSource;
    AppSelect: TClientDataSet;
    AppSelectDATASET: TStringField;
    AppSelectFIELDNAME: TStringField;
    AppSelectAUTOUPDATE: TBooleanField;
    AppSelectDATASELECT: TMemoField;
    AppSelectDefaultRow: TIntegerField;
    sAppSelect: TDataSource;
    AppLog: TClientDataSet;
    AppLoguName: TStringField;
    AppLogcName: TStringField;
    AppLogCZ: TStringField;
    AppLogRQ: TDateField;
    AppLogSJ: TStringField;
    sAppLog: TDataSource;
    Dq: TClientDataSet;
    sDq: TDataSource;
    AppMenu: TClientDataSet;
    AppMenumName: TStringField;
    AppMenumCaption: TStringField;
    AppMenumLevel: TIntegerField;
    AppMenumIndex: TIntegerField;
    AppMenumIsParent: TBooleanField;
    sAppMenu: TDataSource;
    Kh: TClientDataSet;
    sKh: TDataSource;
    DqID: TIntegerField;
    DqMC: TStringField;
    Gys: TClientDataSet;
    sGys: TDataSource;
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
    KhDY: TStringField;
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
    Zh: TClientDataSet;
    sZh: TDataSource;
    Sfkfs: TClientDataSet;
    sSfkfs: TDataSource;
    ZhID: TIntegerField;
    ZhMC: TStringField;
    ZhYHL: TBooleanField;
    ZhKHYH: TStringField;
    ZhYHZH: TStringField;
    KhDQID: TIntegerField;
    Srzclb: TClientDataSet;
    sSrzclb: TDataSource;
    SfkfsID: TIntegerField;
    SfkfsMC: TStringField;
    SfkfsZHID: TIntegerField;
    Hplb: TClientDataSet;
    sHplb: TDataSource;
    SrzclbID: TIntegerField;
    SrzclbMC: TStringField;
    SrzclbSRL: TBooleanField;
    SrzclbBZ: TStringField;
    ZhaYHL: TStringField;
    SrzclbaSRL: TStringField;
    Sjzl: TClientDataSet;
    sSjzl: TDataSource;
    Cyjsdw: TClientDataSet;
    sCyjsdw: TDataSource;
    Hphsff: TClientDataSet;
    sHphsff: TDataSource;
    Ck: TClientDataSet;
    sCk: TDataSource;
    Bm: TClientDataSet;
    sBm: TDataSource;
    CkID: TIntegerField;
    CkMC: TStringField;
    CkWZ: TStringField;
    CkBZ: TStringField;
    HplbID: TIntegerField;
    HplbMC: TStringField;
    HplbBZ: TStringField;
    SjzlID: TIntegerField;
    SjzlMC: TStringField;
    SjzlBZ: TStringField;
    CyjsdwMC: TStringField;
    CkXH: TIntegerField;
    SjzlXH: TIntegerField;
    Yglb: TClientDataSet;
    sYglb: TDataSource;
    Yg: TClientDataSet;
    sYg: TDataSource;
    BmID: TIntegerField;
    BmMC: TStringField;
    YglbID: TIntegerField;
    YglbMC: TStringField;
    Hp: TClientDataSet;
    sHp: TDataSource;
    YgID: TIntegerField;
    YgBH: TStringField;
    YgXM: TStringField;
    YgXB: TStringField;
    YgBMID: TIntegerField;
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
    YgJBGZ: TFloatField;
    YgYWYBZ: TBooleanField;
    YgJSFF: TIntegerField;
    YgLZ: TBooleanField;
    YgBZ: TStringField;
    YgcBMMC: TStringField;
    YgcYGLBMC: TStringField;
    KhaDQMC: TStringField;
    SfkfsaZHMC: TStringField;
    YgaBMMC: TStringField;
    YgYGLBID: TIntegerField;
    YgaYGLBMC: TStringField;
    YgaJSFF: TStringField;
    YgaYWYBZ: TStringField;
    YgaLZ: TStringField;
    Qtkcbdlx: TClientDataSet;
    sQtkcbdlx: TDataSource;
    HpCkXx: TClientDataSet;
    sHpCkXx: TDataSource;
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
    HpaHPLBMC: TStringField;
    HpPM: TStringField;
    HpDW: TStringField;
    HpHPHSFFID: TIntegerField;
    HpHPSXID: TIntegerField;
    HpaHPSX: TStringField;
    HpJJ: TFloatField;
    HpJJJ: TFloatField;
    HpQCJE: TFloatField;
    HpSX: TFloatField;
    HpXX: TFloatField;
    HpaZT: TStringField;
    HpcHPLBMC: TStringField;
    HpSjXx: TClientDataSet;
    sHpSjXx: TDataSource;
    HpCkXxMC: TStringField;
    HpSjXxMC: TStringField;
    HpSjXxSJ: TFloatField;
    Hpkc: TClientDataSet;
    Hpsj: TClientDataSet;
    Cgddzb: TClientDataSet;
    sCgddzb: TDataSource;
    Cgdd: TClientDataSet;
    sCgdd: TDataSource;
    CgddzbID: TIntegerField;
    CgddzbDJBH: TStringField;
    CgddzbRQ: TDateField;
    CgddzbGYSID: TIntegerField;
    CgddzbaGYSBH: TStringField;
    CgddzbaGYSMC: TStringField;
    CgddzbJHRQ: TDateField;
    CgddzbJHDD: TStringField;
    CgddzbYWY: TStringField;
    CgddzbJE: TFloatField;
    CgddzbZT: TBooleanField;
    CgddzbBZ: TStringField;
    CgddzbCZY: TStringField;
    Cgfkzb: TClientDataSet;
    CgddZBID2: TIntegerField;
    CgddHPID: TIntegerField;
    CgddSL: TFloatField;
    CgddDJ: TFloatField;
    CgddNSL: TFloatField;
    HpZT: TBooleanField;
    HpaZKCL: TFloatField;
    HpkcCKID: TIntegerField;
    HpkcHPID: TIntegerField;
    HpkcQCS: TFloatField;
    HpkcJCS: TFloatField;
    HpCkXxJCS: TFloatField;
    CgddcJE: TFloatField;
    HpsjSJZLID: TIntegerField;
    HpsjHPID: TIntegerField;
    HpsjSJ: TFloatField;
    sCgfkzb: TDataSource;
    CgddaBH: TStringField;
    CgddaPM: TStringField;
    CgddaDW: TStringField;
    GysHelp: TClientDataSet;
    sGysHelp: TDataSource;
    HpHelp: TClientDataSet;
    sHpHelp: TDataSource;
    CgddHH: TIntegerField;
    HpITMP: TIntegerField;
    CgddzbaZT: TStringField;
    CgddRQ: TDateField;
    Cgsh: TClientDataSet;
    CgshZBID2: TIntegerField;
    CgshHH: TIntegerField;
    CgshRQ: TDateField;
    CgshCKID: TIntegerField;
    CgshaBH: TStringField;
    CgshaPM: TStringField;
    CgshaDW: TStringField;
    CgshSL: TFloatField;
    CgshDJ: TFloatField;
    CgshNSL: TFloatField;
    CgshcJE: TFloatField;
    CgshDDID: TIntegerField;
    Cgshzb: TClientDataSet;
    CgshzbID: TIntegerField;
    CgshzbDJBH: TStringField;
    CgshzbRQ: TDateField;
    CgshzbGYSID: TIntegerField;
    CgshzbaGYSBH: TStringField;
    CgshzbaGYSMC: TStringField;
    CgshzbCKID: TIntegerField;
    CgshzbaCKMC: TStringField;
    CgshzbFPLX: TIntegerField;
    CgshzbaFPLX: TStringField;
    CgshzbYWY: TStringField;
    CgshzbJE: TFloatField;
    CgshzbBZ: TStringField;
    CgshzbCZY: TStringField;
    sCgshzb: TDataSource;
    sCgsh: TDataSource;
    CgshcDDBH: TStringField;
    CgddHelp: TClientDataSet;
    sCgddHelp: TDataSource;
    CgddaSHSL: TFloatField;
    CgddHelpID: TIntegerField;
    CgddHelpDJBH: TStringField;
    CgddHelpJE: TFloatField;
    CgddHelpJHRQ: TDateField;
    CgddHelpaGYSMC: TStringField;
    CgddHelpRQ: TDateField;
    CgddaMSSL: TFloatField;
    KhYXJE: TFloatField;
    GysYXJE: TFloatField;
    GysaSJJE: TFloatField;
    KhITMP: TIntegerField;
    GysQMJE: TFloatField;
    GysITMP: TIntegerField;
    KhQMJE: TFloatField;
    KhaSJJE: TFloatField;
    GysHelpID: TIntegerField;
    GysHelpBH: TStringField;
    GysHelpMC: TStringField;
    GysHelpQC: TStringField;
    GysHelpLXR: TStringField;
    GysHelpDH: TStringField;
    GysHelpCZ: TStringField;
    GysHelpDZ: TStringField;
    GysHelpYB: TStringField;
    GysHelpWZ: TStringField;
    GysHelpDY: TStringField;
    GysHelpKHYH: TStringField;
    GysHelpYHZH: TStringField;
    GysHelpNSH: TStringField;
    GysHelpQCJE: TFloatField;
    GysHelpYXJE: TFloatField;
    GysHelpQMJE: TFloatField;
    GysHelpaSJJE: TFloatField;
    GysHelpZT: TBooleanField;
    GysHelpBZ: TStringField;
    GysHelpITMP: TIntegerField;
    Cgfk: TClientDataSet;
    sCgfk: TDataSource;
    CgfkzbID: TIntegerField;
    CgfkzbDJBH: TStringField;
    CgfkzbRQ: TDateField;
    CgfkzbGYSID: TIntegerField;
    CgfkzbaGYSBH: TStringField;
    CgfkzbaGYSMC: TStringField;
    CgfkzbFKLX: TIntegerField;
    CgfkzbaFKLX: TStringField;
    CgfkzbSFKFSID: TSmallintField;
    CgfkzbaSFKFSMC: TStringField;
    CgfkzbZHID: TSmallintField;
    CgfkzbaZHMC: TStringField;
    CgfkzbPH: TStringField;
    CgfkzbJE: TFloatField;
    CgfkzbJEA: TFloatField;
    CgfkzbJEB: TFloatField;
    CgfkzbBZ: TStringField;
    CgfkzbCZY: TStringField;
    CgfkZBID2: TIntegerField;
    CgfkHH: TIntegerField;
    CgfkDDID: TIntegerField;
    CgfkaDDBH: TStringField;
    CgfkaDDRQ: TDateField;
    CgfkaDDJE: TFloatField;
    CgfkaYFJE: TFloatField;
    CgfkaMFJE: TFloatField;
    CgfkJE: TFloatField;
    CgfkzbSYJY: TBooleanField;
    CgddHelpaGYSBH: TStringField;
    CgshzbYFJE: TFloatField;
    CgfkRQ: TDateField;
    Cgth: TClientDataSet;
    Cgthzb: TClientDataSet;
    sCgthzb: TDataSource;
    sCgth: TDataSource;
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
    CgthcJE: TFloatField;
    Xsddzb: TClientDataSet;
    sXsddzb: TDataSource;
    Xsdd: TClientDataSet;
    sXsdd: TDataSource;
    XsddzbID: TIntegerField;
    XsddzbDJBH: TStringField;
    XsddzbRQ: TDateField;
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
    XsddNSL: TFloatField;
    XsddcJE: TFloatField;
    XsddaYTSL: TFloatField;
    XsddaMTSL: TFloatField;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    sKhHelp: TDataSource;
    KhHelp: TClientDataSet;
    KhHelpID: TIntegerField;
    KhHelpBH: TStringField;
    KhHelpMC: TStringField;
    KhHelpQC: TStringField;
    KhHelpDQID: TIntegerField;
    KhHelpaDQMC: TStringField;
    KhHelpcDQMC: TStringField;
    KhHelpLXR: TStringField;
    KhHelpDH: TStringField;
    KhHelpCZ: TStringField;
    KhHelpDZ: TStringField;
    KhHelpYB: TStringField;
    KhHelpWZ: TStringField;
    KhHelpDY: TStringField;
    KhHelpKHYH: TStringField;
    KhHelpYHZH: TStringField;
    KhHelpNSH: TStringField;
    KhHelpQCJE: TFloatField;
    KhHelpYXJE: TFloatField;
    KhHelpQMJE: TFloatField;
    KhHelpaSJJE: TFloatField;
    KhHelpXYED: TFloatField;
    KhHelpZT: TBooleanField;
    KhHelpBZ: TStringField;
    KhHelpITMP: TIntegerField;
    HpHelpID: TIntegerField;
    HpHelpBH: TStringField;
    HpHelpHPLBID: TIntegerField;
    HpHelpaHPLBMC: TStringField;
    HpHelpcHPLBMC: TStringField;
    HpHelpPM: TStringField;
    HpHelpDW: TStringField;
    HpHelpHPHSFFID: TIntegerField;
    HpHelpHPSXID: TIntegerField;
    HpHelpaHPSX: TStringField;
    HpHelpaZKCL: TFloatField;
    HpHelpJJ: TFloatField;
    HpHelpJJJ: TFloatField;
    HpHelpJQJ: TFloatField;
    HpHelpSX: TFloatField;
    HpHelpXX: TFloatField;
    XsddzbKHID: TIntegerField;
    XsddzbaKHBH: TStringField;
    XsddzbaKHMC: TStringField;
    XsddHelp: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    DateField2: TDateField;
    StringField2: TStringField;
    StringField3: TStringField;
    sXsddHelp: TDataSource;
    Xsskzb: TClientDataSet;
    sXsskzb: TDataSource;
    Xssk: TClientDataSet;
    sXssk: TDataSource;
    Xskd: TClientDataSet;
    XskdZBID2: TIntegerField;
    XskdHH: TIntegerField;
    XskdRQ: TDateField;
    XskdCKID: TIntegerField;
    XskdHPID: TIntegerField;
    XskdaBH: TStringField;
    XskdaPM: TStringField;
    XskdaDW: TStringField;
    XskdSL: TFloatField;
    XskdDJ: TFloatField;
    XskdNSL: TFloatField;
    XskdcJE: TFloatField;
    XskdDDID: TIntegerField;
    XskdcDDBH: TStringField;
    sXskd: TDataSource;
    Xskdzb: TClientDataSet;
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
    XskdzbJHDD: TStringField;
    XskdzbSKQX: TIntegerField;
    XskdzbJE: TFloatField;
    XskdzbYFJE: TFloatField;
    XskdzbBZ: TStringField;
    XskdzbCZY: TStringField;
    sXskdzb: TDataSource;
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
    Xsth: TClientDataSet;
    Xsthzb: TClientDataSet;
    sXsthzb: TDataSource;
    sXsth: TDataSource;
    CgshHPID: TIntegerField;
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
    XsthcJE: TFloatField;
    CgshzbXSLX: TIntegerField;
    CgshzbaXSLX: TStringField;
    CgshzbSFKFSID: TSmallintField;
    CgshzbaSFKFSMC: TStringField;
    CgshzbZHID: TSmallintField;
    CgshzbaZHMC: TStringField;
    CgshzbPH: TStringField;
    Llzb: TClientDataSet;
    LlzbID: TIntegerField;
    LlzbDJBH: TStringField;
    LlzbRQ: TDateField;
    LlzbCKID: TIntegerField;
    LlzbaCKMC: TStringField;
    LlzbJSR: TStringField;
    LlzbJE: TFloatField;
    LlzbBZ: TStringField;
    LlzbCZY: TStringField;
    Ll: TClientDataSet;
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
    LlcJE: TFloatField;
    sLl: TDataSource;
    sLlzb: TDataSource;
    Tlzb: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    DateField3: TDateField;
    IntegerField3: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField2: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    Tl: TClientDataSet;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    DateField4: TDateField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    sTl: TDataSource;
    sTlzb: TDataSource;
    Cpjczb: TClientDataSet;
    Cpjc: TClientDataSet;
    sCpjc: TDataSource;
    sCpjczb: TDataSource;
    CpjczbID: TIntegerField;
    CpjczbDJBH: TStringField;
    CpjczbRQ: TDateField;
    CpjczbCKID: TIntegerField;
    CpjczbaCKMC: TStringField;
    CpjczbPH: TStringField;
    CpjczbJE: TFloatField;
    CpjczbBZ: TStringField;
    CpjczbCZY: TStringField;
    CpjcZBID2: TIntegerField;
    CpjcHH: TIntegerField;
    CpjcRQ: TDateField;
    CpjcCKID: TIntegerField;
    CpjcHPID: TIntegerField;
    CpjcaBH: TStringField;
    CpjcaPM: TStringField;
    CpjcaDW: TStringField;
    CpjcSL: TFloatField;
    CpjcDJ: TFloatField;
    CpjccJE: TFloatField;
    Kcpdzb: TClientDataSet;
    IntegerField8: TIntegerField;
    StringField12: TStringField;
    DateField5: TDateField;
    IntegerField9: TIntegerField;
    StringField13: TStringField;
    FloatField6: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    Kcpd: TClientDataSet;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    DateField6: TDateField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    sKcpd: TDataSource;
    sKcpdzb: TDataSource;
    Chtjzb: TClientDataSet;
    Chtj: TClientDataSet;
    sChtj: TDataSource;
    sChtjzb: TDataSource;
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
    ChtjJDJ: TFloatField;
    ChtjcJE: TFloatField;
    ChtjDJ: TFloatField;
    Ckdbzb: TClientDataSet;
    IntegerField14: TIntegerField;
    StringField14: TStringField;
    DateField7: TDateField;
    IntegerField15: TIntegerField;
    StringField20: TStringField;
    FloatField10: TFloatField;
    StringField22: TStringField;
    StringField23: TStringField;
    Ckdb: TClientDataSet;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    DateField8: TDateField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    sCkdb: TDataSource;
    sCkdbzb: TDataSource;
    CkdbzbCKID: TIntegerField;
    CkdbzbaCKMC: TStringField;
    CkdbCKID: TIntegerField;
    Qtkcbdzb: TClientDataSet;
    IntegerField20: TIntegerField;
    StringField21: TStringField;
    DateField9: TDateField;
    IntegerField21: TIntegerField;
    StringField27: TStringField;
    FloatField14: TFloatField;
    StringField29: TStringField;
    StringField30: TStringField;
    Qtkcbd: TClientDataSet;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    DateField10: TDateField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    sQtkcbd: TDataSource;
    sQtkcbdzb: TDataSource;
    QtkcbdSL: TFloatField;
    QtkcbdzbQTKCBDLXID: TIntegerField;
    QtkcbdzbaJCLX: TStringField;
    QtkcbdzbaTH: TStringField;
    QtkcbdzbXGXX: TStringField;
    QtkcbdzbaQTKCBDLXMC: TStringField;
    QtkcbdTHSL: TFloatField;
    QtkcbdzbCRLX: TIntegerField;
    QtkcbdCRLX: TIntegerField;
    Fykz: TClientDataSet;
    Fykzzb: TClientDataSet;
    sFykzzb: TDataSource;
    sFykz: TDataSource;
    SrzclbBH: TStringField;
    FykzZBID: TIntegerField;
    FykzHH: TIntegerField;
    FykzRQ: TDateField;
    FykzSRZCLBID: TIntegerField;
    FykzaBH: TStringField;
    FykzaMC: TStringField;
    FykzZY: TStringField;
    FykzJE: TFloatField;
    FykzzbID2: TIntegerField;
    FykzzbDJBH: TStringField;
    FykzzbRQ: TDateField;
    FykzzbSFKFSID: TSmallintField;
    FykzzbaSFKFSMC: TStringField;
    FykzzbZHID: TSmallintField;
    FykzzbaZHMC: TStringField;
    FykzzbPH: TStringField;
    FykzzbJSR: TStringField;
    FykzzbJE: TFloatField;
    FykzzbBZ: TStringField;
    FykzzbCZY: TStringField;
    SrzclbHelp: TClientDataSet;
    IntegerField26: TIntegerField;
    StringField28: TStringField;
    StringField34: TStringField;
    BooleanField1: TBooleanField;
    StringField35: TStringField;
    StringField36: TStringField;
    sSrzclbHelp: TDataSource;
    Qtsr: TClientDataSet;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    DateField11: TDateField;
    IntegerField29: TIntegerField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    FloatField15: TFloatField;
    Qtsrzb: TClientDataSet;
    IntegerField30: TIntegerField;
    StringField40: TStringField;
    DateField12: TDateField;
    SmallintField1: TSmallintField;
    StringField41: TStringField;
    SmallintField2: TSmallintField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    FloatField18: TFloatField;
    StringField45: TStringField;
    StringField46: TStringField;
    sQtsrzb: TDataSource;
    sQtsr: TDataSource;
    Yhckqk: TClientDataSet;
    sYhckqk: TDataSource;
    YhckqkID: TIntegerField;
    YhckqkJSR: TStringField;
    YhckqkZCZHID: TSmallintField;
    YhckqkaZCZHMC: TStringField;
    YhckqkZRZHID: TSmallintField;
    YhckqkaZRZHMC: TStringField;
    YhckqkPH: TStringField;
    YhckqkJE: TFloatField;
    YhckqkBZ: TStringField;
    YhckqkCZY: TStringField;
    YhckqkRQ: TDateField;
    XskdHelp: TClientDataSet;
    IntegerField31: TIntegerField;
    StringField47: TStringField;
    DateField13: TDateField;
    FloatField19: TFloatField;
    sXskdHelp: TDataSource;
    XskdHelpaKHBH: TStringField;
    XskdHelpaKHMC: TStringField;
    XskdHelpaXSLX: TStringField;
    XsSkgc: TClientDataSet;
    sXsSkgc: TDataSource;
    XsSkgcDJBH: TWideStringField;
    XsSkgcRQ: TDateField;
    XsSkgcZJE: TFloatField;
    XsSkgcBCJE: TFloatField;
    CgFkgc: TClientDataSet;
    WideStringField1: TWideStringField;
    DateField14: TDateField;
    BCDField1: TFloatField;
    BCDField2: TFloatField;
    sCgFkgc: TDataSource;
    CgshHelp: TClientDataSet;
    sCgshHelp: TDataSource;
    CgshHelpID: TIntegerField;
    CgshHelpDJBH: TStringField;
    CgshHelpRQ: TDateField;
    CgshHelpJE: TFloatField;
    CgshHelpaCGLX: TStringField;
    CgshHelpaGYSBH: TStringField;
    CgshHelpaGYSMC: TStringField;
    Thgc: TClientDataSet;
    IntegerField32: TIntegerField;
    IntegerField33: TIntegerField;
    DateField15: TDateField;
    IntegerField36: TIntegerField;
    StringField48: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    FloatField20: TFloatField;
    sThgc: TDataSource;
    QtkcbdHpHelp: TClientDataSet;
    sQtkcbdHpHelp: TDataSource;
    QtkcbdHpHelpaBH: TWideStringField;
    QtkcbdHpHelpaPM: TWideStringField;
    QtkcbdHpHelpaDW: TWideStringField;
    CnBb: TDCOMConnection;
    HpQCJQJ: TFloatField;
    XsddDJ: TFloatField;
    XskdCBDJ: TFloatField;
    XsthCBDJ: TFloatField;
    ThgcDJ: TFloatField;
    HpJQJ: TFloatField;
    ZhQCJE: TFloatField;
    ZhQMJE: TFloatField;
    ZhITMP: TIntegerField;
    XsThgc: TClientDataSet;
    WideStringField2: TWideStringField;
    sXsThgc: TDataSource;
    XsThgcRQ: TDateField;
    XsThgcSL: TFloatField;
    XsThgcDJ: TFloatField;
    XsThgcNSL: TFloatField;
    XsThgcJE: TFloatField;
    XsThgcBH: TWideStringField;
    XsThgcPM: TWideStringField;
    XsThgcDW: TWideStringField;
    CgshzbFKQX: TIntegerField;
    CgshzbYFJE2: TFloatField;
    XskdzbYSJE: TFloatField;
    CgshzbYFJE3: TFloatField;
    XskdzbYSJE2: TFloatField;
    {-Common Begin-}
    procedure ReconcileError(DataSet: TClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure AppMenumCaptionGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ZeroToEmpty(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SetID(DataSet: TDataSet);
    {-Common End-}
    procedure ConverHphsff(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure NSLGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    { ------------------------------------------------------------------------ }
    procedure ZhYHLGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SrzclbSRLGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure YgJSFFGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QtkcbdlxRKLGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QtkcbdlxTHBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CgddCalcFields(DataSet: TDataSet);
    procedure CgshCalcFields(DataSet: TDataSet);
    procedure CgfkzbBeforeOpen(DataSet: TDataSet);
    procedure CgthzbBeforeOpen(DataSet: TDataSet);
    procedure CgshzbBeforeOpen(DataSet: TDataSet);
    procedure LlzbBeforeOpen(DataSet: TDataSet);
    procedure LlCalcFields(DataSet: TDataSet);
    procedure ChtjCalcFields(DataSet: TDataSet);
    procedure QtkcbdzbBeforeOpen(DataSet: TDataSet);
    procedure FykzzbBeforeOpen(DataSet: TDataSet);
    procedure YhckqkBeforeOpen(DataSet: TDataSet);
    procedure SfkfsBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Data: TData;

implementation

uses RecError, Common;

{$R *.DFM}

{-Common Begin-}

//DataModuleCreate
procedure TData.DataModuleCreate(Sender: TObject);
var
  i: integer;
begin
  Cn.Connected := True;
  CnBb.Connected := True;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TNumericField then
      with TNumericField(Components[i]) do
        if (DisplayFormat <> '') and (EditFormat = '') then
          EditFormat := StringReplace(DisplayFormat, ',', '', [rfReplaceAll]);
end;

//ReconcileError
procedure TData.ReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
//  Action := HandleReconcileError(DataSet, UpdateKind, E);
  Action := ComReconcileError(DataSet, UpdateKind, E);
end;

//零值变空字符串
procedure TData.ZeroToEmpty(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender is TNumericField then
    if TField(Sender).AsFloat = 0 then
      Text := ''
    else
      Text := FormatFloat(TFloatField(Sender).DisplayFormat, TField(Sender).Value);
end;

//AppMenumCaptionGetText
procedure TData.AppMenumCaptionGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var
  i : integer;
begin
  Text := AppMenu.FieldByName('mCaption').AsString;
  for i := 1 to AppMenu.FieldByName('mLevel').AsInteger do
    Text := '    ' + Text;
  Text := Copy(Text, 1, 50);
end;

//SetID
procedure TData.SetID(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert] then
    SetFieldValue('select iif(isnull(max(ID)), 1, max(ID)+1) from ' +
      DataSet.Name + ' where ID > 0', DataSet, 'ID');
end;

{-Common End-}

//货品核算方法
procedure TData.ConverHphsff(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  case Sender.AsInteger of
    1: Text := '库存商品';
    2: Text := '服务/劳务';
    3: Text := '其它收入';
    4: Text := '其它支出';
    5: Text := '折扣';
  end;
end;

//税率
procedure TData.NSLGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := Sender.AsString + '%';
end;

{ ---------------------------------------------------------------------------- }

//帐户
procedure TData.ZhYHLGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := '银行存款类'
  else
    Text := '现金类';
end;

//收入支出类别
procedure TData.SrzclbSRLGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := '收入类'
  else
    Text := '支出类';
end;

//其它库存变动类型
procedure TData.QtkcbdlxRKLGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := '入库类'
  else
    Text := '出库类';
end;

procedure TData.QtkcbdlxTHBZGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsBoolean then
    Text := '需要'
  else
    Text := '不需要';
end;

//员工
procedure TData.YgJSFFGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  case Sender.AsInteger of
    1: Text := '月薪';
    2: Text := '计件';
  end;
end;

//采购订单
procedure TData.CgddCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('cJE').AsFloat := DataSet.FieldByName('SL').AsFloat *
                                        DataSet.FieldByName('DJ').AsFloat *
                                        (1 + DataSet.FieldByName('NSL').AsFloat / 100);
end;

//采购收货
procedure TData.CgshCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('cJE').AsFloat := DataSet.FieldByName('SL').AsFloat *
                                        DataSet.FieldByName('DJ').AsFloat *
                                        (1 + DataSet.FieldByName('NSL').AsFloat / 100);
  if DataSet.FieldByName('DDID').AsInteger = 0 then
    DataSet.FieldByName('cDDBH').AsString := ''
  else if DataSet.FieldByName('cDDBH').AsString = '' then
    DataSet.FieldByName('cDDBH').AsString := VarToStr(GetFieldValue('select DJBH from CGDDZB where ID = ' + DataSet.FieldByName('DDID').AsString));
end;

procedure TData.CgshzbBeforeOpen(DataSet: TDataSet);
begin
  if not SFKFS.Active then
    SFKFS.Active := True;
  if not CK.Active then
    CK.Active := True;
end;

//采购付款
procedure TData.CgfkzbBeforeOpen(DataSet: TDataSet);
begin
  if not SFKFS.Active then
    SFKFS.Active := True;
end;

//采购退款
procedure TData.CgthzbBeforeOpen(DataSet: TDataSet);
begin
  if not SFKFS.Active then
    SFKFS.Active := True;
  if not CK.Active then
    CK.Active := True;
end;

//领料
procedure TData.LlzbBeforeOpen(DataSet: TDataSet);
begin
  if not CK.Active then
    CK.Active := True;
end;

procedure TData.LlCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('cJE').AsFloat := DataSet.FieldByName('SL').AsFloat *
                                        DataSet.FieldByName('DJ').AsFloat;
end;

//存库调价
procedure TData.ChtjCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('cJE').AsFloat := DataSet.FieldByName('SL').AsFloat *
                                        (DataSet.FieldByName('DJ').AsFloat - DataSet.FieldByName('JDJ').AsFloat);
end;

//其它库存变动
procedure TData.QtkcbdzbBeforeOpen(DataSet: TDataSet);
begin
  if not CK.Active then
    CK.Active := True;
  if not QTKCBDLX.Active then
    QTKCBDLX.Active := True;
end;

//费用开支
procedure TData.FykzzbBeforeOpen(DataSet: TDataSet);
begin
  if not SFKFS.Active then
    SFKFS.Active := True;
end;

//银行存款/取款
procedure TData.YhckqkBeforeOpen(DataSet: TDataSet);
begin
  if not ZH.Active then
    ZH.Active := True;
end;

//收付款方式
procedure TData.SfkfsBeforeOpen(DataSet: TDataSet);
begin
  if not ZH.Active then
    ZH.Active := True;
end;

end.

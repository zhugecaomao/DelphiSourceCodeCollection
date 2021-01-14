
program STK0311;

uses
  Forms,
  ulogin,
  utilities,
  uDM in 'uDM.pas' {DM: TDataModule},
  US_FM in 'Template\baseform\US_FM.pas' {S_Form},
  uS_DB in 'Template\baseform\US_DB.pas' {S_DB},
  US_MD in 'Template\baseform\US_MD.pas' {S_MasterDetail},
  US_EDIT in 'Template\baseform\US_EDIT.pas' {S_SingleDBEdit},
  US_GRID in 'Template\baseform\US_GRID.pas' {S_SingleDBGrid},
  US_MD_ITEM in 'Template\baseform\US_MD_ITEM.pas' {S_MasterDetail_With_Item},
  US_MD_GRID in 'Template\baseform\US_MD_GRID.pas' {S_MasterDetail_WithGrid},
  US_EDIT_GRID in 'Template\baseform\US_EDIT_GRID.pas' {S_SingleDBEdit_WithGrid},
  uFM_SYS in 'uFM_SYS.pas' {FM_SYS},
  uFM_PSW in 'uFM_PSW.pas' {FM_PSW},
  uFM_USR in 'uFM_USR.pas' {FM_USR},
  uFM_Main in 'uFM_Main.pas' {FM_Main},
  uFM_1010 in 'uFM_1010.pas',
  uFM_5010 in 'uFM_5010.pas' {FM_5010},
  uFM_1030 in 'uFM_1030.pas' {FM_1030},
  uFM_1040 in 'uFM_1040.pas',
  uFM_1060 in 'uFM_1060.pas' {FM_1060},
  uFM_1050 in 'uFM_1050.pas' {FM_1050},
  uFM_1100 in 'uFM_1100.pas' {FM_1100},
  uFM_1090 in 'uFM_1090.pas' {FM_1090},
  uFM_1070 in 'uFM_1070.pas' {FM_1070},
  uFM_1080 in 'uFM_1080.pas' {FM_1080},
  uFM_2040 in 'uFM_2040.pas' {FM_2040},
  uFM_2030 in 'uFM_2030.pas' {FM_2030},
  uFM_2010 in 'uFM_2010.pas' {FM_2010},
  uFM_2020 in 'uFM_2020.pas' {FM_2020},
  uFM_2160 in 'uFM_2160.pas' {FM_2160},
  uFM_2070 in 'uFM_2070.pas' {FM_2070},
  uFM_2080 in 'uFM_2080.pas' {FM_2080},
  uFM_2120 in 'uFM_2120.pas' {FM_2120},
  uFM_2121 in 'uFM_2121.pas' {FM_2121},
  uFM_2151 in 'uFM_2151.pas' {FM_2151},
  uFM_2150 in 'uFM_2150.pas' {FM_2150},
  uFM_2090 in 'uFM_2090.pas' {FM_2090},
  uFM_2100 in 'uFM_2100.pas' {FM_2100},
  uFM_2110 in 'uFM_2110.pas' {FM_2110},
  uFM_2130 in 'uFM_2130.pas' {FM_2130},
  uFM_2140 in 'uFM_2140.pas' {FM_2140},
  uFM_2050 in 'uFM_2050.pas' {FM_2050},
  uFM_2060 in 'uFM_2060.pas' {FM_2060},
  uRP_2160 in 'uRP_2160.pas' {RP_2160: TQuickRep},
  uFM_4014 in 'uFM_4014.pas' {FM_4014},
  uFM_4010A in 'uFM_4010A.pas' {FM_4010A},
  uFM_4011 in 'uFM_4011.pas' {FM_4011},
  uFM_4012 in 'uFM_4012.pas' {FM_4012},
  uFM_4013 in 'uFM_4013.pas' {FM_4013},
  uFM_4010 in 'uFM_4010.pas' {FM_4010},
  uFM_3020 in 'uFM_3020.pas' {FM_3020},
  uFM_3040 in 'uFM_3040.pas' {FM_3040},
  uFM_5070 in 'uFM_5070.pas' {FM_5070},
  uFM_5090 in 'uFM_5090.pas' {FM_5090},
  uFM_3100 in 'uFM_3100.pas' {FM_3100},
  uFM_3120 in 'uFM_3120.pas' {FM_3120},
  uFM_3010 in 'uFM_3010.pas' {FM_3010},
  uFM_3090 in 'uFM_3090.pas' {FM_3090},
  uFM_4020 in 'uFM_4020.pas' {FM_4020},
  uRP_3090 in 'uRP_3090.pas' {RP_3090: TQuickRep},
  uFM_5060 in 'uFM_5060.pas' {FM_5060},
  uRp_5080 in 'uRp_5080.pas' {Rp_5080: TQuickRep},
  uRp_3110 in 'uRp_3110.pas' {Rp_3110: TQuickRep},
  uRp_3020 in 'uRp_3020.pas' {Rp_3020: TQuickRep},
  uFM_3021 in 'uFM_3021.pas' {FM_3021},
  uRP_3050 in 'uRP_3050.pas' {RP_3050: TQuickRep},
  uRP_3050A in 'uRP_3050A.pas' {RP_3050A: TQuickRep},
  uRP_3010 in 'uRP_3010.pas' {RP_3010: TQuickRep},
  uRP_4020 in 'uRP_4020.pas' {RP_4020: TQuickRep},
  uFM_1091 in 'uFM_1091.pas' {FM_1091},
  uRp_4010A in 'uRp_4010A.pas' {Rp_4010A: TQuickRep},
  uRp_4010B in 'uRp_4010B.pas' {Rp_4010B: TQuickRep},
  uRp_4011A in 'uRp_4011A.pas' {Rp_4011A: TQuickRep},
  uRp_4011B in 'uRp_4011B.pas' {Rp_4011B: TQuickRep},
  uRp_4012A in 'uRp_4012A.pas' {Rp_4012A: TQuickRep},
  uRp_4012B in 'uRp_4012B.pas' {Rp_4012B: TQuickRep},
  uRp_4013A in 'uRp_4013A.pas' {Rp_4013A: TQuickRep},
  uRp_4013B in 'uRp_4013B.pas' {Rp_4013B: TQuickRep},
  uRp_4014A in 'uRp_4014A.pas' {Rp_4014A: TQuickRep},
  uRp_4014B in 'uRp_4014B.pas' {Rp_4014B: TQuickRep},
  uFM_1011 in 'uFM_1011.pas' {FM_1011},
  uFM_1020 in 'uFM_1020.pas' {FM_1020},
  uFM_3060 in 'uFM_3060.pas' {FM_3060},
  uFM_3080 in 'uFM_3080.pas' {FM_3080},
  uFM_3050 in 'uFM_3050.pas' {FM_3050},
  uRp_3060 in 'uRp_3060.pas' {Rp_3060: TQuickRep},
  uRp_1010 in 'uRp_1010.pas' {Rp_1010: TQuickRep},
  uRp_5010 in 'uRp_5010.pas' {Rp_5010: TQuickRep},
  uRp_1020 in 'uRp_1020.pas' {Rp_1020: TQuickRep},
  uRp_1030 in 'uRp_1030.pas' {Rp_1030: TQuickRep},
  uRp_1050 in 'uRp_1050.pas' {Rp_1050: TQuickRep},
  uRp_1060 in 'uRp_1060.pas' {Rp_1060: TQuickRep},
  uRp_1070 in 'uRp_1070.pas' {Rp_1070: TQuickRep},
  uRp_1080 in 'uRp_1080.pas' {Rp_1080: TQuickRep},
  uRp_1090 in 'uRp_1090.pas' {Rp_1090: TQuickRep},
  uRp_2010 in 'uRp_2010.pas' {Rp_2010: TQuickRep},
  uRp_2020 in 'uRp_2020.pas' {Rp_2020: TQuickRep},
  uRp_2100 in 'uRp_2100.pas' {Rp_2100: TQuickRep},
  uRp_2030 in 'uRp_2030.pas' {Rp_2030: TQuickRep},
  uRp_2040 in 'uRp_2040.pas' {Rp_2040: TQuickRep},
  uRp_2050 in 'uRp_2050.pas' {Rp_2050: TQuickRep},
  uRp_2060 in 'uRp_2060.pas' {Rp_2060: TQuickRep},
  uRP_2090 in 'uRP_2090.pas' {RP_2090: TQuickRep},
  uRP_2110 in 'uRP_2110.pas' {RP_2110: TQuickRep},
  uRP_2120 in 'uRP_2120.pas' {RP_2120: TQuickRep},
  uRP_2121 in 'uRP_2121.pas' {RP_2121: TQuickRep},
  uRP_2130 in 'uRP_2130.pas' {RP_2130: TQuickRep},
  uRP_2140 in 'uRP_2140.pas' {RP_2140: TQuickRep},
  uRP_2150 in 'uRP_2150.pas' {RP_2150: TQuickRep},
  uRP_2151 in 'uRP_2151.pas' {RP_2151: TQuickRep},
  uRP_2070 in 'uRP_2070.pas' {RP_2070: TQuickRep},
  uRP_2080 in 'uRP_2080.pas' {RP_2080: TQuickRep},
  uRp_1011 in 'uRp_1011.pas' {Rp_1011: TQuickRep},
  uFM_5010A in 'uFM_5010A.pas' {FM_5010A},
  uFM_1020A in 'uFM_1020A.pas' {FM_1020A},
  uRp_1020A in 'uRp_1020A.pas' {Rp_1020A: TQuickRep},
  uRp_5010A in 'uRp_5010A.pas' {Rp_5010A: TQuickRep},
  uFM_1020B in 'uFM_1020B.pas' {FM_1020B},
  uFM_5010B in 'uFM_5010B.pas' {FM_5010B},
  uFM_4030 in 'uFM_4030.pas' {FM_4030},
  uFM_4040 in 'uFM_4040.pas' {FM_4040},
  uFM_2180 in 'uFM_2180.pas' {FM_2180},
  uFM_2170 in 'uFM_2170.pas' {FM_2170},
  uRp_2180 in 'uRp_2180.pas' {Rp_2180: TQuickRep},
  uRp_2170 in 'uRp_2170.pas' {Rp_2170: TQuickRep},
  uFM_SCM in 'uFM_SCM.pas' {FM_SCM},
  uFM_SEP in 'uFM_SEP.pas' {FM_SEP},
  uFM_SES in 'uFM_SES.pas' {FM_SES},
  uFM_SPS in 'uFM_SPS.pas' {FM_SPS},
  uFM_SPD in 'uFM_SPD.pas' {FM_SPD},
  uFM_SEM in 'uFM_SEM.pas' {FM_SEM},
  uFM_SEG in 'uFM_SEG.pas' {FM_SEG},
  uFunction in 'uFunction.pas';
//  untCash in '..\..\..\delphiInsallComp\Public\untCash.pas',
//  Progress in '..\..\..\delphiInsallComp\Public\Progress.pas' {ProgressForm};

var
  LoginForm1 :  TLoginForm;
{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '进销存管理系统';
  Application.CreateForm(TDM, DM);
  DM.DB.Connected:=False;
  DM.DB.Params.Values['USERNAME']:='sa';
  DM.DB.Params.Values['PASSWORD']:='';
  DM.DB.LoginPrompt:=False;
  DM.DB.DatabaseName:='STK0311'; //STK0311是数据库别名。DB.AliasName可以不设

  LoginForm1 := TLoginForm.Create(Application);
  LoginForm1.Exec := True;
  LoginForm1.DataBaseName := 'STK0311';
  LoginForm1.TableName:='TUser';
  LoginForm1.KeyFields:='NM';
  LoginForm1.NameField:='NM';
  LoginForm1.RightField:='PW';
  LoginForm1.PassWordField:='PW';

  if LoginForm1.RunL then begin //执行使用者登录的动作
     GlobalUser_Level := LoginForm1.UserRight;
     GlobalUser := LoginForm1.UserName;
     Application.CreateForm(TFM_Main, FM_Main);
     Application.Run;
  end else
     Application.Terminate;

end.

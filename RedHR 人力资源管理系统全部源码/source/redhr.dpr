program redhr;

uses
  Forms,
  fmain in 'main\fmain.pas' {Main},
  addman in 'main\addman.pas' {faddman},
  fzglx in 'main\fzglx.pas' {zglx},
  Fbranch in 'main\Fbranch.pas' {bran},
  Fchangepost in 'main\Fchangepost.pas' {changepost},
  Fpostedit in 'main\Fpostedit.pas' {postedit},
  Feditpost in 'main\Feditpost.pas' {editpost},
  Fcorpmessage in 'main\Fcorpmessage.pas' {corpmessage},
  Frepstaffinfo in 'Report\Frepstaffinfo.pas' {RepStaffinfo},
  Fbranmessage in 'main\Fbranmessage.pas' {branmessage},
  Fshowpic in 'main\Fshowpic.pas' {showpic},
  Fspic in 'main\Fspic.pas' {spic},
  Fpayedit in 'main\Fpayedit.pas' {payedit},
  Flogo in 'main\Flogo.pas' {logo},
  EncryptIt in 'main\EncryptIt.pas',
  Fmess in 'main\Fmess.pas' {mess},
  Flogin in 'main\Flogin.pas' {Login},
  cardin_form in 'main\cardin_form.pas' {cardin},
  Unit_utils in 'main\Unit_utils.pas',
  Fconfig in 'main\Fconfig.pas' {config},
  Fchartbm in 'Report\Fchartbm.pas' {chartbm},
  Flistico in 'main\Flistico.pas' {listico},
  Fbrmess in 'main\Fbrmess.pas' {Brmess},
  Fpaycalculate in 'main\Fpaycalculate.pas' {paycalculate},
  Ftrain in 'main\Ftrain.pas' {train},
  Ftrainresult in 'main\Ftrainresult.pas' {trainresult},
  Fcontract in 'main\Fcontract.pas' {contract},
  Fsearch in 'main\Fsearch.pas' {search},
  Fweal in 'main\Fweal.pas' {weal},
  Fcutline in 'main\Fcutline.pas' {cutline},
  Fperson in 'main\Fperson.pas' {person},
  Feditper in 'main\Feditper.pas' {editper},
  Finper in 'main\Finper.pas' {inper},
  Fpworks in 'main\Fpworks.pas' {pworks},
  Fptools in 'main\Fptools.pas' {ptools},
  Fstatools in 'main\Fstatools.pas' {statools};

{$R *.res}

begin
  Application.Initialize;
  logo:=tlogo.create(application);
  logo.Label1.Caption:='正在读入数据，请稍後...';
  logo.Label1.Visible:=true;
  logo.Show;
  logo.Refresh;
  logo.Image1.Enabled:=false;
  Application.Title := 'RedHr-Office';
  Application.CreateForm(TMain, Main);
  logo.Hide;
  logo.Free;
  Application.Run;
end.

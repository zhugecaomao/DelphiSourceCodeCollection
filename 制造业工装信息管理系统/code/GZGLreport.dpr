program GZGLreport;

uses
  Forms,
  GZGL_print_YBB in 'GZGL_print_YBB.pas' {FrmGZGL_Print_YBB},
  GZGL_DModule in 'GZGL_DModule.pas' {dmd: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmGZGL_Print_YBB, FrmGZGL_Print_YBB);
  Application.CreateForm(Tdmd, dmd);
  Application.Run;
end.

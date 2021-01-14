program ProjectGZDAGL;

uses
  Forms,
  gzdagl_ in 'gzdagl_.pas' {Form_main},
  gzdagl_department_ in 'gzdagl_department_.pas' {Form_department},
  gzdagl_DM_ in 'gzdagl_DM_.pas' {DMgzdagl: TDataModule},
  gzdagl_employee_ in 'gzdagl_employee_.pas' {Form_employee},
  gzdagl_gongzi_ in 'gzdagl_gongzi_.pas' {Form_gongzi},
  gzdagl_query_ in 'gzdagl_query_.pas' {Form_query},
  gzdagl_yg_print_ in 'gzdagl_yg_print_.pas' {Form_yg_print},
  gzdagl_yggongzi_print_ in 'gzdagl_yggongzi_print_.pas' {Form_yggongzi_print},
  gzdagl_ygbt_print_ in 'gzdagl_ygbt_print_.pas' {Form_ygbt_print},
  gzdagl_sum_ in 'gzdagl_sum_.pas' {Form_sum};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TForm_sum, Form_sum);
  Application.CreateForm(TForm_query, Form_query);
  Application.CreateForm(TForm_yg_print, Form_yg_print);
  Application.CreateForm(TForm_gongzi, Form_gongzi);
  Application.CreateForm(TForm_employee, Form_employee);
  Application.CreateForm(TForm_department, Form_department);
  Application.CreateForm(TDMgzdagl, DMgzdagl);
  Application.CreateForm(TForm_yggongzi_print, Form_yggongzi_print);
  Application.CreateForm(TForm_ygbt_print, Form_ygbt_print);
  Application.Run;
end.

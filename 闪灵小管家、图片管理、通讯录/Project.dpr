program Project;

uses
  Forms,
  main in 'main.pas' {main_form},
  login in 'login.pas' {login_form},
  config in 'config.pas' {config_form},
  manage in 'manage.pas' {manage_form},
  user_add in 'user_add.pas' {add_user},
  pass in 'pass.pas' {repass},
  baker in 'baker.pas' {baker_form},
  notebook in 'notebook.pas' {notebook_form},
  cateloge_set in 'cateloge_set.pas' {set_cateloge},
  info in 'info.pas' {info_form},
  notice in 'notice.pas' {notice_form},
  pic in 'pic.pas' {pic_Form},
  pic_add in 'pic_add.pas' {add_pic},
  photo_cateloge in 'photo_cateloge.pas' {cateloge_photo},
  edit_photo_note in 'edit_photo_note.pas' {photo_note_edit},
  modify_pic_file in 'modify_pic_file.pas' {modify_pic},
  pic_print in 'pic_print.pas' {print_form: TQuickRep},
  link in 'link.pas' {link_Form},
  md_link in 'md_link.pas' {add_link},
  person in 'person.pas' {person_form},
  per_rep in 'per_rep.pas' {person_report: TQuickRep},
  salary in 'salary.pas' {salary_form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmain_form, main_form);
  Application.Run;
end.

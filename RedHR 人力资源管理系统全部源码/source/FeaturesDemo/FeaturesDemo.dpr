program FeaturesDemo;

uses
  Forms,
  FeatureChild in 'FeatureChild.pas' {FeatureChildForm},
  FeaturesMain in 'FeaturesMain.pas' {FeaturesMainForm},
  FeatureModify in 'FeatureModify.pas' {FeatureModifyForm},
  Flogo in 'Flogo.pas' {logo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RedHr-Office';
  Application.CreateForm(TFeaturesMainForm, FeaturesMainForm);
  Application.CreateForm(Tlogo, logo);
  FeaturesMainForm.NewSheet;
  Application.Run;
end.

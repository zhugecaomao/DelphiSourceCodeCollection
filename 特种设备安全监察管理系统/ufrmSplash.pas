unit ufrmSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, dxfLabel;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    labVersion: TdxfLabel;
    labTip: TLabel;
    Panel2: TPanel;
    imgLogo: TImage;
    labAppName: TdxfLabel;
    Panel3: TPanel;
    labCopyright: TdxfLabel;
  private
    procedure SetSplashTip(const Value: string);
    procedure SetVersion(const Value: string);
    procedure SetAppName(const Value: string);
    procedure SetCopyright(const Value: string);
    { Private declarations }
  public
    procedure pubp_ShowAsDialog;
    property AppName: string write SetAppName;
    property Version: string write SetVersion;
    property Copyright: string write SetCopyright;
    property SplashTip: string write SetSplashTip;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

{ TfrmSplash }

procedure TfrmSplash.pubp_ShowAsDialog;
begin
  BorderStyle := bsDialog;
  BorderIcons := [biSystemMenu];
  labTip.Visible := False;
end;

procedure TfrmSplash.SetAppName(const Value: string);
begin
  Caption := '¹ØÓÚ ' + Value;
  labAppName.Caption := Value;
end;

procedure TfrmSplash.SetCopyright(const Value: string);
begin
  labCopyright.Caption := Value + ' ';
  labCopyright.AutoSize := True;
end;

procedure TfrmSplash.SetSplashTip(const Value: string);
begin
  labTip.Caption := Value;
end;

procedure TfrmSplash.SetVersion(const Value: string);
begin
  labVersion.Caption := Format('Version %s', [Value]);
end;

end.

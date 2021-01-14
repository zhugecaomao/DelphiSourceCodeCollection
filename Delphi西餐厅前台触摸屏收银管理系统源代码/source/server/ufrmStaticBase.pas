unit ufrmStaticBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmStaticBase = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbtnClose: TBitBtn;
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure prop_IniInterFace; virtual;
    procedure prop_IniData; virtual;
  public
    procedure pubp_Ini;
  end;

var
  frmStaticBase: TfrmStaticBase;

implementation

{$R *.dfm}

{ TfrmStaticBase }

procedure TfrmStaticBase.prop_IniData;
begin

end;

procedure TfrmStaticBase.prop_IniInterFace;
begin
  Position := poScreenCenter;
  FormStyle := fsMdiChild;
  WindowState := wsMaximized;
end;

procedure TfrmStaticBase.pubp_Ini;
begin
  prop_IniData;
  prop_IniInterFace;
end;

procedure TfrmStaticBase.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStaticBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.

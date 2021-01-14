unit DLLForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmDLL = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmDLL: TfrmDLL;

  procedure SynAPP(App:THandle);stdcall;
  procedure ShowForm;stdcall;

implementation

uses Math;

{$R *.dfm}

procedure SynAPP(App:THandle );stdcall;
begin
  Application.Handle := App;
end;

procedure ShowForm;stdcall;
begin
  try
    frmDLL := TfrmDLL.Create (Application);
    try
      frmDLL.ShowModal;
    finally
      frmDLL.Free;
    end;
  except
    on E: Exception do
      MessageDlg ('Error in DLLForm: ' +
        E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmDLL.Button1Click(Sender: TObject);
begin
  Color := RandomRange(0,255 * 255 * 255 ); 
end;

end.

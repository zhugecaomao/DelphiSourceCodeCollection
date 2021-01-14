{-----------------------------------------------------------------------------
 Demo Name: URI Demo
 Author:    < unknown - please contact me to claim credit! - Allen O'Neill >
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:17:04
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:


}

unit main;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls,
  SysUtils, Classes;

type
  TfrmDemo = class(TForm)
    edtURI: TEdit;
    edtProtocol: TEdit;
    edtHost: TEdit;
    edtPort: TEdit;
    lblProtocol: TLabel;
    lblHost: TLabel;
    lblPort: TLabel;
    lblPath: TLabel;
    lblDocument: TLabel;
    edtPath: TEdit;
    edtDocument: TEdit;
    btnDoIt: TButton;
    lblURI: TLabel;
    lblInstructions: TLabel;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemo: TfrmDemo;

implementation
uses IdURI;

{$R *.DFM}

procedure TfrmDemo.btnDoItClick(Sender: TObject);
var URI : TIdURI;
begin
  URI := TIdURI.Create(edtURI.Text);
  try
    edtProtocol.Text := URI.Protocol;
    edtHost.Text := URI.Host;
    edtPort.Text := URI.Port;
    edtPath.Text := URI.Path;
    edtDocument.Text := URI.Document;
  finally
    URI.Free;
  end;
end;

end.

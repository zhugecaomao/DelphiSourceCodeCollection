{-----------------------------------------------------------------------------
 Demo Name: Main
 Author:    <unknown - contact me to claim credit! - Allen O'Neill>
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 01:29:39
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Simple demo using the MappedPort component.

}

unit Main;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls,
  SysUtils, Classes, IdBaseComponent, IdComponent, IdTCPServer, IdMappedPortTCP;


type
  TForm1 = class(TForm)
    Memo1: TMemo;
    IdMappedPortTCP1 : TIdMappedPortTCP;
  private
  public
  end;

var
  Form1: TForm1;

implementation
{$R *.DFM}

end.

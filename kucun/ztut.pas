unit ztut;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ExtCtrls, jpeg,shellapi, ImgList, XPMan, DB,
  ADODB,registry,inifiles, Psock, NMFtp;
type
  Tztfm = class(TForm)
    Panel1: TPanel;
    NMFTP1: TNMFTP;
    ftpado: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ztfm: Tztfm;

implementation

uses mainut, xyriut, dataut;

{$R *.dfm}

end.

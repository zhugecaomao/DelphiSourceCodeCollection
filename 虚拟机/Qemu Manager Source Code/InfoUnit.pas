unit InfoUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,IniFiles,  TntComCtrls, TntDBGrids, TntStdCtrls, TntMenus, TntDialogs,TntForms;

type
  TInfo = class(TTNTForm)
    Button1: TTNTButton;
    Disable: TTNTCheckBox;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    TntLabel3: TTntLabel;
    TntLabel4: TTntLabel;
    TntLabel5: TTntLabel;
    TntLabel6: TTntLabel;
    TntLabel7: TTntLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Info: TInfo;

implementation
uses MainUnit;
{$R *.DFM}

procedure TInfo.Button1Click(Sender: TObject);
Var QIni : TIniFile;
begin
If Disable.Checked = True Then
   Begin
   QINI := TINIFile.Create(ExtractFilePath(ParamStr(0))+'qman.ini');
   With QIni Do
       Begin
       writeString('General','No Info','1');
       End;
  QIni.Free;
   End;
Close
end;

end.

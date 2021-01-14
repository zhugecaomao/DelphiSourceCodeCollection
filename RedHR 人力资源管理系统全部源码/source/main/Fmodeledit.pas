unit Fmodeledit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxSSheet, ComCtrls;

type
  Tmodeledit = class(TForm)
    cxSpreadSheetBook1: TcxSpreadSheetBook;
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modeledit: Tmodeledit;

implementation

{$R *.dfm}

end.

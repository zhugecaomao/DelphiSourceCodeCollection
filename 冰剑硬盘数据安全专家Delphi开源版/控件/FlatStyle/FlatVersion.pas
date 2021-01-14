unit FlatVersion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TVersionForm = class(TForm)
    OKBtn: TButton;
    About: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VersionForm: TVersionForm;

implementation

{$R *.dfm}

end.

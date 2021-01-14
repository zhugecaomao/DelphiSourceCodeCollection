unit OwnBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TOwnBookForm = class(TForm)
    Bevel1: TBevel;
    ListView1: TListView;
    Button2: TButton;
    StaticText1: TStaticText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OwnBookForm: TOwnBookForm;

implementation

{$R *.dfm}

end.

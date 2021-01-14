unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TNewPicForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditWidth: TEdit;
    EditHeight: TEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewPicForm: TNewPicForm;

implementation

{$R *.dfm}

end.

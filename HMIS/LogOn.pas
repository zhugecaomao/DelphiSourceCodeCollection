unit LogOn;          //登录欢迎界面单元

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TF_LogOn = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LogOn: TF_LogOn;

implementation

{$R *.dfm}

end.

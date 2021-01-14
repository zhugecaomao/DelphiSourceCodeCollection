unit ZlfxTj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient, ComForm, IniFiles;

type
  TfrmZlfxTj = class(TfrmComForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    BT9: TPanel;
    BT1: TPanel;
    BT2: TPanel;
    BT3: TPanel;
    BT4: TPanel;
    BT5: TPanel;
    BT6: TPanel;
    BT7: TPanel;
    BT8: TPanel;
    HJ9: TPanel;
    HJ1: TPanel;
    HJ2: TPanel;
    HJ3: TPanel;
    HJ4: TPanel;
    HJ5: TPanel;
    HJ6: TPanel;
    HJ7: TPanel;
    HJ8: TPanel;
    BL9: TPanel;
    BL1: TPanel;
    BL2: TPanel;
    BL3: TPanel;
    BL4: TPanel;
    BL5: TPanel;
    BL6: TPanel;
    BL7: TPanel;
    BL8: TPanel;
    Bevel1: TBevel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZlfxTj: TfrmZlfxTj;

implementation

uses ComFun;

{$R *.DFM}

procedure TfrmZlfxTj.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

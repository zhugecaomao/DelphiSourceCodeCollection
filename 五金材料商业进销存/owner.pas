unit owner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Mask, KvLabel, DosMove, RegControls;

type
  TfrmOwner = class(TForm)
    Label1: TKvLabel;
    DBEdit1: TDBEdit;
    Label2: TKvLabel;
    DBEdit2: TDBEdit;
    Label3: TKvLabel;
    DBEdit3: TDBEdit;
    Label4: TKvLabel;
    DBEdit4: TDBEdit;
    Label5: TKvLabel;
    DBEdit5: TDBEdit;
    Label6: TKvLabel;
    DBEdit6: TDBEdit;
    Label7: TKvLabel;
    DBEdit7: TDBEdit;
    Label8: TKvLabel;
    DBEdit8: TDBEdit;
    Label9: TKvLabel;
    DBEdit9: TDBEdit;
    Label10: TKvLabel;
    DBMemo1: TDBMemo;
    Bevel1: TBevel;
    DosMove1: TDosMove;
    RegForm1: TRegForm;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOwner: TfrmOwner;

implementation

uses data;

{$R *.DFM}

procedure TfrmOwner.FormCreate(Sender: TObject);
begin
  if not dm.DB.connected then dm.db.connected := true;
  with dm.qryOwner do
  begin
    if not active then open;
    if recordcount <= 0 then append;
    edit;
  end;
end;

procedure TfrmOwner.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not dm.DB.connected then dm.db.connected := true;
  with dm.qryOwner do
  begin
    if not active then open;
    if Modified then
    begin
      post;
    end;
  end;
  Action := cafree;
end;

end.

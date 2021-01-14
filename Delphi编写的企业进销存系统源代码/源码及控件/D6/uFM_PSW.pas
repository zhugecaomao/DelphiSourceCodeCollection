unit uFM_PSW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Buttons;

type
  TFM_PSW = class(TForm)
    Qry1: TQuery;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Edit3: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
   // procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_PSW: TFM_PSW;

implementation

uses utilities;

{$R *.DFM}

procedure TFM_PSW.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFM_PSW.BitBtn2Click(Sender: TObject);
begin
  if CompareStr(edit2.text,edit3.text) <>0 then begin
     R_OkMessage(['»∑»œ√‹¬Î¥ÌŒÛ!'],'',MB_ICONERROR);
     abort; end;

  QryExec(Qry1,'select PW from Tuser where NM='+''''+GlobalUser+'''');
  if CompareStr(Qry1.FieldByName('PW').asstring,edit1.text)<>0 then
     R_OkMessage(['æ…√‹¬Î¥ÌŒÛ!'],'',MB_ICONERROR)
  else begin
     QryExec(Qry1,'update TUser set PW='+''''+edit3.text+''''+' where NM='+''''+GlobalUser+'''',false);
     R_OkMessage(['√‹¬Î–ﬁ∏ƒ≥…π¶!'],'',MB_ICONINFORMATION);
     close;
  end;
end;

end.








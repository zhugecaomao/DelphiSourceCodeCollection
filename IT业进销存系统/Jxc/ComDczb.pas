unit ComDczb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComDcrq, ActnList, Menus, ComCtrls, DBCtrls, ToolWin, ExtCtrls, StdCtrls,
  Grids, DBGrids, ComDj;

type
  TfrmComDczb = class(TfrmComDcrq)
    aView: TAction;
    smnView: TMenuItem;
    procedure aViewExecute(Sender: TObject);
    procedure pnlDetailExit(Sender: TObject);
    procedure SetButton;override;
    procedure LoadEditForm(strState:string);override;
  private
    { Private declarations }
  public
    { Public declarations }
    frmDj:TfrmComDj;
  end;

var
  frmComDczb: TfrmComDczb;

implementation

{$R *.DFM}

//SetButton
procedure TfrmComDczb.SetButton;
begin
  inherited;
  if dbgCur = DBGrid1 then
    aView.Enabled := (aView.Tag = 0) and not (dsJbzl.IsEmpty)
  else
    aView.Enabled := False;
  if aModify.Enabled then
  begin
    aModify.ShortCut := VK_RETURN;
    aView.ShortCut := 0;
  end else
  begin
    aModify.ShortCut := 0;
    aView.ShortCut := VK_RETURN;
  end;
end;

//LoadEditForm
procedure TfrmComDczb.LoadEditForm(strState: string);
begin
  frmDj.strState := strState;
  frmDj.ShowModal;
  frmDj.Free;
  SetButton;
  dsAfterScroll(dsJbzl);
end;

//aView.Execute
procedure TfrmComDczb.aViewExecute(Sender: TObject);
begin
  LoadEditForm('V');
end;

//pnlDetail.Exit
procedure TfrmComDczb.pnlDetailExit(Sender: TObject);
begin
  inherited;
  DBGrid1.SetFocus;
end;

end.

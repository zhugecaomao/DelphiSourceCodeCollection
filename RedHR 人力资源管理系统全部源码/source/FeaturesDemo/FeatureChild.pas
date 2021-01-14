unit FeatureChild;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxSSheet, Grids, StdCtrls, cxControls;

type
  TFeatureChildForm = class(TForm)
    cxSpreadBook: TcxSpreadSheetBook;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxSpreadBookSheetPopupMenu(Sender: TObject; X, Y: Integer);
    procedure cxSpreadBookEditing(Sender: TcxSSBookSheet; const ACol,
      ARow: Integer; var CanEdit: Boolean);
    procedure cxSpreadBookEndEdit(Sender: TObject);
  private
    FIsEditorMode: Boolean;
  public
    procedure SetSelection;
    property IsEditorMode: Boolean read FIsEditorMode write FIsEditorMode;
  end;

implementation

{$R *.dfm}

uses
  FeaturesMain;

procedure TFeatureChildForm.SetSelection;
begin
  if Assigned(cxSpreadBook.OnSetSelection) then
    cxSpreadBook.OnSetSelection(cxSpreadBook, cxSpreadBook.ActiveSheet);
end;

procedure TFeatureChildForm.FormActivate(Sender: TObject);
begin
  SetSelection;
end;

procedure TFeatureChildForm.FormCreate(Sender: TObject);
begin
  SetSelection;
end;

procedure TFeatureChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MainForm.MDIChildCount > 1 then
  begin
    Application.MainForm.Next;
    Action := caFree;
  end;
end;

procedure TFeatureChildForm.cxSpreadBookSheetPopupMenu(Sender: TObject; X,
  Y: Integer);
begin
  FeaturesMainForm.pmSheetPopup.Popup(X, Y);
end;

procedure TFeatureChildForm.cxSpreadBookEditing(Sender: TcxSSBookSheet;
  const ACol, ARow: Integer; var CanEdit: Boolean);
begin
  FIsEditorMode := True;
end;

procedure TFeatureChildForm.cxSpreadBookEndEdit(Sender: TObject);
begin
  FIsEditorMode := False;
end;

end.

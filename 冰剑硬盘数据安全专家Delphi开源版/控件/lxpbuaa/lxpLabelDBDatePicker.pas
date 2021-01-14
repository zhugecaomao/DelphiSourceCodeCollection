unit lxpLabelDBDatePicker;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ComCtrls, StdCtrls,
  lxpDBDatePicker;

type
  TlxpLabelDBDatePicker = class(TlxpDBDatePicker)
  private
    FLabel: TLabel;
    FLabelSpacing: Integer;
    OldOnActivate: TNotifyEvent;
    procedure SetLabelSpacing(const Value: Integer);
    procedure GetDisplayLabel(Sender: TObject);
  protected
    procedure SetParent(AParent: TWinControl); override;
    procedure CMVisiblechanged(var Message: TMessage);
      message CM_VISIBLECHANGED;
    procedure CMEnabledchanged(var Message: TMessage);
      message CM_ENABLEDCHANGED;
    procedure CMBidimodechanged(var Message: TMessage);
      message CM_BIDIMODECHANGED;
    procedure CMFontchanged(var Message: TMessage);
      message CM_FONTCHANGED;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
  public
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
    constructor Create(AOwner: TComponent); override;
  published
    property DisplayLabel: TLabel read FLabel;
    property LabelSpacing: Integer read FLabelSpacing write SetLabelSpacing;
  end;

procedure Register;

implementation

uses Forms;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpLabelDBDatePicker]);
end;

{ TlxpLabelDBDatePicker }

constructor TlxpLabelDBDatePicker.Create(AOwner: TComponent);
begin
  inherited;
  FLabel := TLabel.Create(Self);
  FLabel.FreeNotification(Self);
  FLabel.Caption := 'DisplayLabel';
  FLabelSpacing := 3;
end;

procedure TlxpLabelDBDatePicker.SetLabelSpacing(const Value: Integer);
begin
  if Value <> FLabelSpacing then
  begin
    FLabelSpacing := Value;
    FLabel.Left := Left - (FLabelSpacing + FLabel.Width);
  end;
end;

procedure TlxpLabelDBDatePicker.SetParent(AParent: TWinControl);
begin
  inherited;
  FLabel.Parent := AParent;
end;

procedure TlxpLabelDBDatePicker.CMBidimodechanged(var Message: TMessage);
begin
  inherited;
  FLabel.BiDiMode := BiDiMode;
end;

procedure TlxpLabelDBDatePicker.CMEnabledchanged(var Message: TMessage);
begin
  inherited;
  FLabel.Enabled := Enabled;
end;

procedure TlxpLabelDBDatePicker.CMFontchanged(var Message: TMessage);
begin
  inherited;
  FLabel.Font.Assign(Font);
end;

procedure TlxpLabelDBDatePicker.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  FLabel.Visible := Visible;
end;

procedure TlxpLabelDBDatePicker.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
begin
  inherited;
  if FLabel <> nil then with FLabel do
  begin
    Top := ATop + (AHeight - Height) div 2;
    Left := ALeft - (FLabelSpacing + Width);
  end;
end;  


procedure TlxpLabelDBDatePicker.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FLabel) then
    FLabel := nil;
end;

procedure TlxpLabelDBDatePicker.Loaded;
begin
  inherited;
  {if Field <> nil then
    FLabel.Caption := Field.DisplayLabel;}
  if Owner.InheritsFrom(TForm) then with TForm(Owner) do
  begin
    OldOnActivate := OnActivate;
    OnActivate := GetDisplayLabel;
  end;
end;

procedure TlxpLabelDBDatePicker.GetDisplayLabel(Sender: TObject);
begin
  if Assigned(OldOnActivate) then OldOnActivate(Sender);
  if Field <> nil then
    FLabel.Caption := Field.DisplayLabel;      
end;

end.

unit FlatSound;

interface

{$I FlatStyle.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MMSystem, FlatUtils;

type
  TSoundEvent = (seBtnClick, seMenu, seMenuClick, seMoveIntoBtn, sePanelExpand);

type
  TFlatSound = class(TVersionComponent)
  private
    FEvent: TSoundEvent;
  public
    procedure Play;
    procedure PlayThis(ThisEvent: TSoundEvent);
    constructor Create(AOwner: TComponent); override;
  published
    property Event: TSoundEvent read FEvent write FEvent;
  end;

const
  Flags = SND_RESOURCE or SND_SYNC;

implementation

{$R FlatSound.res}

constructor TFlatSound.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Event := seBtnClick;
end;

procedure TFlatSound.Play;
begin
  case FEvent of
    seBtnClick:    PlaySound('ENC_001',0,Flags);
    seMenu:        PlaySound('ENC_002',0,Flags);
    seMenuClick:   PlaySound('ENC_003',0,Flags);
    seMoveIntoBtn: PlaySound('ENC_004',0,Flags);
    sePanelExpand: PlaySound('ENC_005',0,Flags);
  end;
end;

procedure TFlatSound.PlayThis(ThisEvent: TSoundEvent);
begin
  case ThisEvent of
    seBtnClick:    PlaySound('ENC_001',0,Flags);
    seMenu:        PlaySound('ENC_002',0,Flags);
    seMenuClick:   PlaySound('ENC_003',0,Flags);
    seMoveIntoBtn: PlaySound('ENC_004',0,Flags);
    sePanelExpand: PlaySound('ENC_005',0,Flags);
  end;
end;

end.

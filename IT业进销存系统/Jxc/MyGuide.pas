unit MyGuide;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, MyLabel, ComCtrls, MyIcon32;

type
  TfrmMyGuide = class(TForm)
    Panel7: TPanel;
    Image2: TImage;
    labXS: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    labCG: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    labCK: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    labXJ: TLabel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    labXT: TLabel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    pnlTop2: TPanel;
    pnlTop1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    fraIcon321: TfraMyIcon32;
    Panel1: TPanel;
    Shape4: TShape;
    Label1: TLabel;
    Shape5: TShape;
    Image4: TImage;
    fraMyLabel1: TfraMyLabel;
    fraMyLabel2: TfraMyLabel;
    fraMyLabel3: TfraMyLabel;
    fraMyLabel4: TfraMyLabel;
    fraMyLabel5: TfraMyLabel;
    Panel8: TPanel;
    Shape6: TShape;
    Shape7: TShape;
    Image5: TImage;
    Label6: TLabel;
    fraMyLabel6: TfraMyLabel;
    fraMyLabel7: TfraMyLabel;
    fraMyLabel8: TfraMyLabel;
    fraMyLabel9: TfraMyLabel;
    fraMyLabel10: TfraMyLabel;
    fraMyLabel11: TfraMyLabel;
    fraMyIcon321: TfraMyIcon32;
    fraMyIcon322: TfraMyIcon32;
    fraMyIcon323: TfraMyIcon32;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    fraMyIcon324: TfraMyIcon32;
    Panel9: TPanel;
    Shape8: TShape;
    Label4: TLabel;
    Shape9: TShape;
    Image6: TImage;
    fraMyLabel12: TfraMyLabel;
    fraMyLabel13: TfraMyLabel;
    fraMyLabel15: TfraMyLabel;
    fraMyLabel16: TfraMyLabel;
    Panel10: TPanel;
    Shape10: TShape;
    Shape11: TShape;
    Image7: TImage;
    Label5: TLabel;
    fraMyLabel17: TfraMyLabel;
    fraMyLabel18: TfraMyLabel;
    fraMyLabel19: TfraMyLabel;
    fraMyLabel20: TfraMyLabel;
    fraMyLabel21: TfraMyLabel;
    fraMyLabel22: TfraMyLabel;
    fraMyIcon325: TfraMyIcon32;
    fraMyIcon326: TfraMyIcon32;
    fraMyIcon327: TfraMyIcon32;
    fraMyIcon328: TfraMyIcon32;
    Panel12: TPanel;
    Shape12: TShape;
    Label7: TLabel;
    Shape13: TShape;
    Image8: TImage;
    fraMyLabel14: TfraMyLabel;
    fraMyLabel23: TfraMyLabel;
    fraMyLabel24: TfraMyLabel;
    Panel13: TPanel;
    Shape14: TShape;
    Shape15: TShape;
    Image9: TImage;
    Label8: TLabel;
    fraMyLabel26: TfraMyLabel;
    fraMyLabel27: TfraMyLabel;
    fraMyLabel28: TfraMyLabel;
    fraMyLabel29: TfraMyLabel;
    fraMyLabel30: TfraMyLabel;
    fraMyIcon329: TfraMyIcon32;
    fraMyIcon3210: TfraMyIcon32;
    fraMyIcon3211: TfraMyIcon32;
    fraMyIcon3212: TfraMyIcon32;
    fraMyIcon3213: TfraMyIcon32;
    fraMyIcon3214: TfraMyIcon32;
    fraMyIcon3215: TfraMyIcon32;
    Panel14: TPanel;
    Shape16: TShape;
    Label9: TLabel;
    Shape17: TShape;
    Image10: TImage;
    fraMyLabel25: TfraMyLabel;
    fraMyLabel34: TfraMyLabel;
    fraMyLabel35: TfraMyLabel;
    Panel15: TPanel;
    Shape18: TShape;
    Shape19: TShape;
    Image11: TImage;
    Label10: TLabel;
    fraMyLabel36: TfraMyLabel;
    fraMyLabel37: TfraMyLabel;
    fraMyLabel38: TfraMyLabel;
    fraMyIcon3217: TfraMyIcon32;
    fraMyIcon3218: TfraMyIcon32;
    Label2: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Image3: TImage;
    procedure LabelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure labXSMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TabSheetMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    slXM, slICON, slLABEL: TStringList;
  public
    { Public declarations }
  end;

var
  frmMyGuide: TfrmMyGuide;

implementation

uses Main;

{$R *.DFM}

procedure TfrmMyGuide.FormShow(Sender: TObject);
var
  i: integer;
begin
  PageControl1.TabHeight := 1;
  //slXM
  slXM := TStringList.Create;
  slXM.AddObject(labXS.Name, labXS);
  slXM.AddObject(labCG.Name, labCG);
  slXM.AddObject(labCK.Name, labCK);
  slXM.AddObject(labXJ.Name, labXJ);
  slXM.AddObject(labXT.Name, labXT);
  //slICON
  slICON := TStringList.Create;
  slLABEL := TStringList.Create;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TfraMyIcon32 then
      slICON.AddObject(Components[i].Name, Components[i]);
    if Components[i] is TfraMyLabel then
      slLABEL.AddObject(Components[i].Name, Components[i]);
  end;
  //Panel.Top
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) and (TPanel(Components[i]).Tag = 9) then
      TPanel(Components[i]).Top := Screen.Height - TPanel(Components[i]).Height - 196;
  //
  PageControl1.ActivePageIndex := 0;    
end;

procedure TfrmMyGuide.LabelClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to slXM.Count - 1 do
    TLabel(slXM.Objects[i]).Font.Color := clBlack;
  Image2.Top := TLabel(Sender).Top - 2;
  TLabel(Sender).Font.Color := clBlue;
  PageControl1.ActivePageIndex := TLabel(Sender).Tag - 1;
end;

procedure TfrmMyGuide.FormResize(Sender: TObject);
begin
  pnlTop1.Top := 0;
  pnlTop1.Left := 0;
  pnlTop1.Width := Width - 8;
  pnlTop2.Top := PageControl1.Top;
  pnlTop2.Left := 0;
  pnlTop2.Width := Width - 8;
end;

procedure TfrmMyGuide.labXSMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
//  TLabel(Sender).Font.Color := clBlue;
end;

procedure TfrmMyGuide.Panel7MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  i: integer;
begin
  for i := 0 to slXM.Count - 1 do
    if TLabel(slXM.Objects[i]).Top - 2 <> Image2.Top then
      TLabel(slXM.Objects[i]).Font.Color := clBlack;
end;

procedure TfrmMyGuide.TabSheetMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i: integer;
begin
  for i := 0 to slICON.Count - 1 do
    if TfraMyIcon32(slICON.Objects[i]).Label1.Font.Color = clBlue then
    begin
      TfraMyIcon32(slICON.Objects[i]).Shape1.Brush.Color := $00FFDFDF;
      TfraMyIcon32(slICON.Objects[i]).Shape1.Pen.Color := $00FFDFDF;
      TfraMyIcon32(slICON.Objects[i]).Label1.Font.Color := clNavy;
    end;
  for i := 0 to slLABEL.Count - 1 do
    if TfraMyLabel(slLABEL.Objects[i]).Label1.Font.Color = clBlue then
    begin
      TfraMyLabel(slLABEL.Objects[i]).Shape1.Brush.Color := clLime;
      TfraMyLabel(slLABEL.Objects[i]).Label1.Font.Color := clNavy;
    end;
end;

end.

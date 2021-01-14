unit Price_Chang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, XPMenu;

type
  Tfrm_Price_Chang = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    LabeledEdit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel7: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton10: TSpeedButton;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Price_Chang: Tfrm_Price_Chang;

implementation

{$R *.dfm}

procedure Tfrm_Price_Chang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Close;
end;

procedure Tfrm_Price_Chang.FormShow(Sender: TObject);
begin
    frm_Price_Chang.Left:=170;
    frm_Price_Chang.Top:=40;
    frm_Price_Chang.Width:=850;
    frm_Price_Chang.Height:=690;
end;

procedure Tfrm_Price_Chang.SpeedButton4Click(Sender: TObject);
begin
    Close;
end;

end.

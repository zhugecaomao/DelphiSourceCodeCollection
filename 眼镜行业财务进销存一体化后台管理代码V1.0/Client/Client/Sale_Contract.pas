unit Sale_Contract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, XPMenu;

type
  Tfrm_Sale_Contract = class(TForm)
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
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Panel6: TPanel;
    Panel10: TPanel;
    Cmd_Delete: TSpeedButton;
    Cmd_Add: TSpeedButton;
    StringGrid1: TStringGrid;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton10: TSpeedButton;
    LabeledEdit3: TLabeledEdit;
    SpeedButton6: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Sale_Contract: Tfrm_Sale_Contract;

implementation

uses Unt_PubStrGrid, func, untdatadm;

{$R *.dfm}

procedure Tfrm_Sale_Contract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=cafree;
end;

procedure Tfrm_Sale_Contract.SpeedButton4Click(Sender: TObject);
begin
    Close;
end;

end.

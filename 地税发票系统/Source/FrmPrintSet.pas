unit FrmPrintSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TPrintSet = class(TForm)
    bbtnOK: TButton;
    CancelBB: TButton;
    SetupBB: TButton;
    GroupBox1: TGroupBox;
    PrinterLabel: TLabel;
    GroupBox2: TGroupBox;
    CopiesLabel: TLabel;
    CopiesED: TEdit;
    CollateCK: TCheckBox;
    DuplexCK: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DestGB: TGroupBox;
    FileNameSB: TSpeedButton;
    Label1: TLabel;
    PrinterRB: TRadioButton;
    PreviewRB: TRadioButton;
    FileRB: TRadioButton;
    editFileName: TEdit;
    cboxFormat: TComboBox;
    TabSheet2: TTabSheet;
    RangeGB: TGroupBox;
    FromLabel: TLabel;
    SelectionLabel: TLabel;
    ToLabel: TLabel;
    SelectionED: TEdit;
    AllRB: TRadioButton;
    SelectionRB: TRadioButton;
    PagesRB: TRadioButton;
    FromED: TEdit;
    ToED: TEdit;
    dlogSave: TSaveDialog;
  private
    
  public
    
  end;

var
  PrintSet: TPrintSet;

implementation

{$R *.dfm}

end.

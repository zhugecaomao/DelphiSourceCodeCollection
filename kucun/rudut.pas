unit rudut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, ExtCtrls, QuickRpt, QRCtrls;

type
  Trkdyfm = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    ADOQuery: TADOQuery;
    QRMemo1: TQRMemo;
    inpl: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    clmcbox: TComboBox;
    clbhedit: TEdit;
    clplbox: TComboBox;
    sledit: TEdit;
    dwbox: TComboBox;
    zjeEdit: TEdit;
    jhdwbox: TComboBox;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    jhrbox: TComboBox;
    jsrbox: TComboBox;
    hwedit: TEdit;
    bgybox: TComboBox;
    djbhedit: TEdit;
    jyybox: TComboBox;
    jhrqbox: TDateTimePicker;
    rkrqbox: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rkdyfm: Trkdyfm;

implementation

{$R *.dfm}

end.

unit Unexam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, Mask, Grids, DBGrids;

type
  Ttikufrm = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tikufrm: Ttikufrm;

implementation

uses Undm;

{$R *.dfm}

procedure Ttikufrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
datamodule1.CDSExam.ApplyUpdates(-1);
action:=cafree;
end;

procedure Ttikufrm.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure Ttikufrm.BitBtn1Click(Sender: TObject);
begin
datamodule1.cDSExam.Insert;
end;

procedure Ttikufrm.BitBtn2Click(Sender: TObject);
begin
datamodule1.cDSExam.Delete;
end;

end.

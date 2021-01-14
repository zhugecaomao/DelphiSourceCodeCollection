unit Unitbbsmx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,adodb,db;

type
  Tfrmbbsmx = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lzt: TLabel;
    Panel3: TPanel;
    lfjname1: TLabel;
    Label2: TLabel;
    lfjname: TLabel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    mmemo: TMemo;
    Label4: TLabel;
    Save1: TSaveDialog;
    Label1: TLabel;
    Lsize: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbbsmx: Tfrmbbsmx;

implementation

uses  func;

{$R *.dfm}

procedure Tfrmbbsmx.SpeedButton1Click(Sender: TObject);
var
  s:string;
  fj:Tfilestream;
begin
  if (trim(lsize.Caption)='0.00KB')   then
  begin
    application.MessageBox('Ã»ÓÐ¸½¼þ£¡',pchar(application.Title),mb_iconinformation);
    exit;
  end;
  save1.FileName:=trim(lfjname.Caption);
  if save1.Execute then
  begin
    s:=trim(save1.FileName);
    fj:=Tfilestream.Create(s,fmCreate);
    //tblobfield(dm.cdsggb.FieldByName('fj')).SaveToStream(fj);
    fj.Free;
  end;
end;

procedure Tfrmbbsmx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

end.

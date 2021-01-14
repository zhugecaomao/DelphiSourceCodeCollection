unit report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, StdCtrls, ExtCtrls;

type
  TfrmReport = class(TForm)
    Label1: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit9: TEdit;
    Edit14: TEdit;
    Edit1: TEdit;
    Button1: TButton;
    Panel1: TPanel;
    Splitter1: TSplitter;
    ok_info: TMemo;
    all_info: TMemo;
    BitBtn6: TBitBtn;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport: TfrmReport;

implementation

{$R *.dfm}

uses main, function_1;

procedure TfrmReport.BitBtn6Click(Sender: TObject);
begin
  thread_run := false;
end;

procedure TfrmReport.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmReport.N4Click(Sender: TObject);
begin
 if (frmMain.open_port.Execute) then
   TMemo((PopupMenu1).PopupComponent).Lines.LoadFromFile(frmMain.open_port.FileName);

end;

procedure TfrmReport.N3Click(Sender: TObject);
begin
 if (frmMain.save_port.Execute ) then
   TMemo((PopupMenu1).PopupComponent).Lines.SaveToFile(frmMain.save_port.FileName);

end;

procedure TfrmReport.N1Click(Sender: TObject);
begin
 TMemo((PopupMenu1).PopupComponent).Lines.Clear;
 if (TMemo((PopupMenu1).PopupComponent) = all_info) then
   Edit9.Text := '0'
  else
   Edit1.Text := '0';

end;

procedure TfrmReport.FormShow(Sender: TObject);
begin
  report_show := true;
end;

procedure TfrmReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  report_show := false;
end;

end.

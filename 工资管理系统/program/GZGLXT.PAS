unit gzglxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Menus, ImgList, ToolWin, jpeg, StdCtrls;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N14: TMenuItem;
    N13: TMenuItem;
    C1: TMenuItem;
    N4: TMenuItem;
    P1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image2: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N5Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  czymc: String = '';
implementation

uses ygjbgzgl, ygfdgzgl, gzffglxt, gztzglxt, gzmxbb, xtdl3, rytj,rysc,
  tjyusc;

{$R *.dfm}

procedure TForm1.N2Click(Sender: TObject);
begin
  Application.CreateForm(TForm81,Form81);
  Form81.ShowModal;
  Form81.Free;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Application.CreateForm(TForm82,Form82);
  Form82.ShowModal;
  Form82.Free;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  Application.CreateForm(TForm83,Form83);
  Form83.ShowModal;
  Form83.Free;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  Application.CreateForm(TForm84,Form84);
  Form84.ShowModal;
  Form84.Free;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  Application.CreateForm(TForm85,Form85);
  Form85.ShowModal;
  Form85.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[5].Text := FormatDateTime('yyyy-mm-dd',Now);
  StatusBar1.Panels[7].Text := FormatDateTime('hh:mm:ss',Now);
  Application.CreateForm(TFormb,Formb);
  Formb.ShowModal;
  Formb.Free;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Application.CreateForm(TForm2,Form2);
  Form2.ShowModal;
  Form2.Free;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Application.CreateForm(TForm3,Form3);
  Form3.ShowModal;
  Form3.Free;
end;

procedure TForm1.TreeView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Escape then
    Close;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Application.CreateForm(TForm4,Form4);
  Form4.ShowModal;
  Form4.Free;
end;

procedure TForm1.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Sender is TLabel then
  begin
    TLabel(Sender).Font.Color := clRed;
    StatusBar1.Panels[1].Text := TLabel(Sender).Caption;
  end;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Num: Integer;
begin
    For Num := 0 to ControlCount-1 do
      if Controls[Num]is TLabel then
      begin
        if (TLabel(Controls[Num]).Name <>'Label9')and(TLabel(Controls[Num]).Name <>'Label10')and
          (TLabel(Controls[Num]).Name <>'Label11') then
            TLabel(Controls[Num]).Font.Color := clBlue;
      end;
end;

end.

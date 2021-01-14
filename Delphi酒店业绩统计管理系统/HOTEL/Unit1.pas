unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9,
  Unit10, ExtCtrls, StdCtrls, Buttons, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;
    N8: TMenuItem;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    N9: TMenuItem;
    N10: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation



{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Form2.ShowModal;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Form3.ShowModal;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
 if messagebox(self.Handle ,'确定退出本系统吗？','系统提示 ！',mb_yesno)=idyes then
  begin
     Application.Terminate;
  end
else   self.ModalResult:=mrNone;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if messagebox(self.Handle ,'确定退出本系统吗？','系统提示 ！',mb_yesno)=idyes then
  begin
     Application.Terminate;
  end
else   CanClose:=False;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
Form9.ShowModal;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
Form6.ShowModal;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
Form7.ShowModal;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Form2.ShowModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
Form3.ShowModal;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
Form5.ShowModal;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form6.ShowModal;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 if messagebox(self.Handle ,'确定退出本系统吗？','系统提示 ！',mb_yesno)=idyes then
  begin
     Application.Terminate;
  end
else   self.ModalResult:=mrNone;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
Form8.ShowModal;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
Form8.ShowModal;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
Form5.ShowModal;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
Form9.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    BitBtn1.DoubleBuffered:=true;
    BitBtn2.DoubleBuffered:=true;
    BitBtn3.DoubleBuffered:=true;
    BitBtn4.DoubleBuffered:=true;
    BitBtn5.DoubleBuffered:=true;
    BitBtn6.DoubleBuffered:=true;
    BitBtn7.DoubleBuffered:=true;
    Panel1.DoubleBuffered:=true;

    end;

end.

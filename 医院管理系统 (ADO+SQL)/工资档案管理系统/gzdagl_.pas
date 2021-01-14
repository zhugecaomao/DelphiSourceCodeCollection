unit gzdagl_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, ComCtrls, ToolWin;

type
  TForm_main = class(TForm)
    CoolBar1: TCoolBar;
    Label1: TLabel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    CoolBar3: TCoolBar;
    ImageList1: TImageList;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses gzdagl_department_, gzdagl_employee_, gzdagl_DM_, gzdagl_gongzi_,
  gzdagl_query_, gzdagl_sum_;

{$R *.dfm}

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
form_department.showmodal;
end;

procedure TForm_main.BitBtn2Click(Sender: TObject);
begin
form_employee.showmodal;
end;

procedure TForm_main.BitBtn3Click(Sender: TObject);
begin
form_gongzi.ShowModal;
end;

procedure TForm_main.BitBtn4Click(Sender: TObject);
begin
form_query.ShowModal;
end;

procedure TForm_main.BitBtn5Click(Sender: TObject);
begin
form_sum.ShowModal;
end;

procedure TForm_main.BitBtn6Click(Sender: TObject);
begin
close;

end;

end.

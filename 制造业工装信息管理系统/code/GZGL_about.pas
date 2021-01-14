unit GZGL_about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls;

type
  TFrmGZGL_about = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    LabINFO: TLabel;
    Lab_loading: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_about: TFrmGZGL_about;

implementation

{$R *.DFM}

procedure TFrmGZGL_about.Image1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmGZGL_about.Timer1Timer(Sender: TObject);
begin
  SELF.Free;
end;

procedure TFrmGZGL_about.FormCreate(Sender: TObject);
begin
  Labinfo.Caption:='开发：水石工作室'+#10#10
                  +'顾问：赵润文'+#13#13
                  +'测试：王创卫'+#13#13
                  +'程序：张长安'+#13#13
                  +'美工：张长安'+#13#13
                  +'电话：0917-8742679'+#13#13
                  +'信箱：water_stone421@sohu.com';


end;

end.

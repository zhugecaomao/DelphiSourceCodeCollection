unit testSampleShape;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SampleShape, ExtCtrls;

type
  TForm1 = class(TForm)
    Shape1: TShape;
    SampleShape1: TSampleShape;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  SampleShape1.Shape := sstRectangle ;
  SampleShape1.Repaint ;

  Shape1.Shape := stRectangle   ;
  Shape1.Repaint ;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SampleShape1.Shape := sstCircle    ;
  SampleShape1.Repaint ;

  Shape1.Shape := stCircle   ;
  Shape1.Repaint ;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SampleShape1.Shape := sstSquare  ;
  SampleShape1.Repaint ;

  Shape1.Shape := stSquare  ;
  Shape1.Repaint
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
SampleShape1.Shape := sstRoundRect  ;
  SampleShape1.Repaint ;

  Shape1.Shape := stRoundRect  ;
  Shape1.Repaint
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
SampleShape1.Shape := sstRoundSquare  ;
  SampleShape1.Repaint ;

  Shape1.Shape := stRoundSquare    ;
  Shape1.Repaint
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
SampleShape1.Shape := sstEllipse  ;
  SampleShape1.Repaint ;

  Shape1.Shape := stEllipse  ;
  Shape1.Repaint
end;

end.

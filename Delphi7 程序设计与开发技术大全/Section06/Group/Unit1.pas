unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    CheckBox1: TCheckBox;
    procedure ScrollBar1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
TabControl1.TabIndex :=ScrollBar1.Position;
PageControl1.TabIndex :=ScrollBar1.Position;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
RadioGroup2.ItemIndex:=3;
TabControl1.TabPosition :=tpTop;
PageControl1.TabPosition :=tpTop;
case RadioGroup1.ItemIndex of
  0:begin
    TabControl1.Style :=tsButtons ;
    PageControl1.Style :=tsButtons ;
    end;
  1:begin
    TabControl1.Style :=tsFlatButtons ;
    PageControl1.Style :=tsFlatButtons ;
    end;
  2:Begin
    TabControl1.Style :=tsTabs ;
    PageControl1.Style :=tsTabs ;
    RadioGroup2.Enabled:=True ;
    Exit;
    end;
end;

RadioGroup2.Enabled:=False ;

end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
case RadioGroup2.ItemIndex of
  0:begin
    TabControl1.TabPosition :=tpBottom ;
    PageControl1.TabPosition :=tpBottom ;
    CheckBox1.Enabled:=True;
    end;
  1:begin
    TabControl1.TabPosition :=tpLeft ;
    PageControl1.TabPosition :=tpLeft ;
    CheckBox1.Enabled:=False;
    end;
  2:begin
    TabControl1.TabPosition :=tpRight ;
    PageControl1.TabPosition :=tpRight ;
    CheckBox1.Enabled:=False;
    end;
  3:begin
    TabControl1.TabPosition :=tpTop ;
    PageControl1.TabPosition :=tpTop ;
    CheckBox1.Enabled:=True;
    end;
end;

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
TabControl1.MultiLine :=not TabControl1.MultiLine;
PageControl1.MultiLine :=not PageControl1.MultiLine;
end;

end.

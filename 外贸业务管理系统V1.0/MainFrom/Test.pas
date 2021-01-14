unit Test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, StdCtrls, frxClass, frxDesgn;

type
  TTest_Frm = class(TBaseFrm)
    Button1: TButton;
    frxReport1: TfrxReport;
    Button2: TButton;
    frxDesigner1: TfrxDesigner;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Test_Frm: TTest_Frm;

implementation

{$R *.dfm}

procedure TTest_Frm.Button1Click(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile('Report/Abin.fr3');
  //frxReport1.DesignPreviewPage:=true;
  frxReport1.ShowReport;
  frxReport1.Free;
end;

procedure TTest_Frm.Button2Click(Sender: TObject);
begin
  inherited;
  frxReport1.LoadFromFile('Report/Abin.fr3');
  frxReport1.DesignReport;

end;

end.

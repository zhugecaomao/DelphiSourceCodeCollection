unit FlatExcpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FlatBtns, FlatUtils, FlatBoxs, StdCtrls;

type
  TFieldForm = class(TForm)
    OutBtn: TFlatButton;
    CloseBtn: TFlatButton;
    AllBtn: TFlatButton;
    FieldBox: TFlatCheckListExt;
    CancelBtn: TFlatButton;
    procedure AllBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FieldForm: TFieldForm;

implementation

{$R *.dfm}

procedure TFieldForm.AllBtnClick(Sender: TObject);
begin
 FieldBox.CheckAll;
end;

procedure TFieldForm.CancelBtnClick(Sender: TObject);
begin
 FieldBox.CheckCancel;
end;

end.

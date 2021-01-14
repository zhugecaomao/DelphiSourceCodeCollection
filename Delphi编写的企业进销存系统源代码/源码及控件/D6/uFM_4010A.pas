unit uFM_4010A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFM_4010A = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_4010A: TFM_4010A;
  Function GetSeleChMan: string;

implementation


{$R *.DFM}

Function GetSeleChMan: string;
begin
  Result := '';
  FM_4010A := TFM_4010A.Create(Application);
  try
  if FM_4010A.ShowModal = mrOk then
    Result := FM_4010A.Edit1.Text;
  finally
    FM_4010A.Free;
  end;
end;

procedure TFM_4010A.FormCreate(Sender: TObject);
begin
  Width := 260; Left := 200; Top := 216; Height := 160;
  Edit1.Text := '';
end;

procedure TFM_4010A.BitBtn1Click(Sender: TObject);
begin
   if Edit1.text = '' then
    begin
     MessageDlg('请输入盘点人名!',mtInformation,[mbOk],0);
     Edit1.SetFocus;
    end
   else
    ModalResult := mrOk;
end;

end.

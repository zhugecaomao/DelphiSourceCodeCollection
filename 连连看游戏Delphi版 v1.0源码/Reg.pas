unit Reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel,
  Regest;

type
  TfmReg = class(TForm)
    RzURLLabel1: TRzURLLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Regedit(RegCode: FSn;RegSn: string);
  public
    { Public declarations }
  end;

var
  fmReg: TfmReg;

implementation

uses main;

{$R *.dfm}

procedure TfmReg.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmReg.Edit1Change(Sender: TObject);
begin
try
  try
  if trim(Edit1.Text) <> '' then
  begin
    GetRegCn(trim(Edit1.Text),FRegInfo);
    Edit2.Text := FRegInfo.RegCode[0]+'-'+FRegInfo.RegCode[1]+'-'
                +FRegInfo.RegCode[2]+'-'+FRegInfo.RegCode[3];
  end
  else
      Edit2.Text := '';
  except
  end;
except
end;
end;

procedure TfmReg.Button1Click(Sender: TObject);
var
  ASn: FSn;
begin
  if edit2.Text <> '' then
  begin
    ASn[0] := FRegInfo.RegCode[0];
    ASn[1] := FRegInfo.RegCode[1];
    ASn[2] := FRegInfo.RegCode[2];
    ASn[3] := FRegInfo.RegCode[3];
    Regedit(ASn,Edit3.Text);
    //DecRegCode(ASn);
    //Edit3.Text := ASn[0]+'-'+ASn[1]+'-'
                //+ASn[2]+'-'+ASn[3];
  end;
end;

procedure TfmReg.Regedit(RegCode: FSn;RegSn: string);
var
  File1: TFileStream;
  temstr: string;
begin
  DecRegCode(RegCode);
  temstr :=RegCode[0]+'-'+RegCode[1]+'-'+RegCode[2]+'-'+RegCode[3];
  if temstr = RegSn then
  begin
    FRegInfo.RegeditDate := Date;
    //FRegInfo.RegCode := RegSn;
    FRegInfo.RegSn[0] := RegCode[0];
    FRegInfo.RegSn[1] := RegCode[1];
    FRegInfo.RegSn[2] := RegCode[2];
    FRegInfo.RegSn[3] := RegCode[3];

    FRegInfo.Reged := true;

    File1 := TFileStream.Create(RegFileName,fmOpenReadWrite);
    WriteUserInfo(FRegInfo,FDecKey,TStream(File1),false);
    WriteUserInfo(FRegInfo,FDecKey,TStream(FParentFile),false);

    showmessage(' Success Registration');

    Close;

    File1.Free;
  end
  else
    showmessage(' invalid Regedit Code£¡');

end;

end.

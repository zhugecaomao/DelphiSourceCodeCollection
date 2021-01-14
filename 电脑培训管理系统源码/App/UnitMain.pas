unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, ComCtrls, MenuBar, ToolWin, StdCtrls,
  DsFancyButton, jpeg;

type
  TfrmMain = class(TBaseFrm)
    DsFancyButton1: TDsFancyButton;
    DsFancyButton2: TDsFancyButton;
    DsFancyButton3: TDsFancyButton;
    DsFancyButton4: TDsFancyButton;
    DsFancyButton5: TDsFancyButton;
    DsFancyButton6: TDsFancyButton;
    DsFancyButton7: TDsFancyButton;
    DsFancyButton8: TDsFancyButton;
    DsFancyButton9: TDsFancyButton;
    DsFancyButton10: TDsFancyButton;
    DsFancyButton11: TDsFancyButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DsFancyButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DsFancyButton5Click(Sender: TObject);
    procedure DsFancyButton6Click(Sender: TObject);
    procedure DsFancyButton7Click(Sender: TObject);
    procedure DsFancyButton3Click(Sender: TObject);
    procedure DsFancyButton2Click(Sender: TObject);
    procedure DsFancyButton1Click(Sender: TObject);
    procedure DsFancyButton8Click(Sender: TObject);
    procedure DsFancyButton9Click(Sender: TObject);
    procedure DsFancyButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses UnitData, UnitDM;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
sPath:=ExtractFilePath(Application.ExeName);
CreateIni(sPath+'data.ini');

Application.Title:='百特培训综合管理系统 1.0';
Caption:='【'+Application.Title+'】';
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  inherited;
DestroyIni;
end;

procedure TfrmMain.DsFancyButton4Click(Sender: TObject);
begin
  inherited;
DM.actOtherExecute(Sender);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  inherited;
if FileExists(sPath+'BackGround.bmp') then
begin
Image1.Picture.LoadFromFile(sPath+'BackGround.bmp');
Image1.Update;
end;


sIme:=ini.ReadString('参数','输入法','');
sCompanyName:=ini.ReadString('参数','公司名称','');
sCompanyPhone:=ini.ReadString('参数','公司电话','');
sCompanyAddress:=ini.ReadString('参数','公司地址','');

DM.actLoginExecute(Sender);
end;

procedure TfrmMain.DsFancyButton5Click(Sender: TObject);
begin
  inherited;
DM.actOperatorExecute(Sender);
end;

procedure TfrmMain.DsFancyButton6Click(Sender: TObject);
begin
  inherited;
DM.actPersonExecute(Sender);
end;

procedure TfrmMain.DsFancyButton7Click(Sender: TObject);
begin
  inherited;
DM.actComeExecute(Sender);
end;

procedure TfrmMain.DsFancyButton3Click(Sender: TObject);
begin
  inherited;
DM.actAdviceExecute(Sender);
end;

procedure TfrmMain.DsFancyButton2Click(Sender: TObject);
begin
  inherited;
DM.actWork_LogExecute(Sender);
end;

procedure TfrmMain.DsFancyButton1Click(Sender: TObject);
begin
  inherited;
DM.actDictExecute(Sender);
end;

procedure TfrmMain.DsFancyButton8Click(Sender: TObject);
begin
  inherited;
DM.actSearchWorkLogExecute(Sender);
end;

procedure TfrmMain.DsFancyButton9Click(Sender: TObject);
begin
  inherited;
DM.actSearchAdviceExecute(Sender);
end;

procedure TfrmMain.DsFancyButton10Click(Sender: TObject);
begin
  inherited;
DM.actSearchPersonExecute(Sender);
end;

end.

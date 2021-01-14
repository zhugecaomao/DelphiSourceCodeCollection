unit ufrmPsnLicnsPrtSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPsnLicnsPrtSet = class(TForm)
    scrbDetail: TScrollBox;
    Panel1: TPanel;
    Panel4: TPanel;
    bbtnClose: TBitBtn;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cboPrjPage: TComboBox;
    cboPrjLine: TComboBox;
    cboEngPage: TComboBox;
    cboEngLine: TComboBox;
    cboChkPage: TComboBox;
    cboChkLine: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    radYes: TRadioButton;
    radNo: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Fi_PrtFstFlag : Integer;
    Fi_PrtPrjId : Integer;
    Fi_PrtEngId : Integer;
    Fi_PrtChkId : Integer;
    function GetCurPrtFstFlag: Integer;
    function GetCurPrtPrjLine: Integer;
    function GetCurPrtEngLine: Integer;
    function GetCurPrtChkLine: Integer;

    procedure prip_IniData;
    procedure prip_IniInterface;
  public
    procedure pubp_Ini(Ac_Args: TStrings = nil);
    property CurPrtFstFlag: Integer read GetCurPrtFstFlag;
    property CurPrtPrjLine: Integer read GetCurPrtPrjLine;
    property CurPrtEngLine: Integer read GetCurPrtEngLine;
    property CurPrtChkLine: Integer read GetCurPrtChkLine;
  end;

var
  frmPsnLicnsPrtSet: TfrmPsnLicnsPrtSet;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmPsnLicnsPrtSet.prip_IniData;
begin
  // 判断是否打印首页
  if Fi_PrtFstFlag = 0 then
    radNo.Checked := True
  else
    radYes.Checked := True;
  // 判断缺省打印项目的页码和行数
  if Fi_PrtPrjId <> 0 then
  begin
    cboPrjPage.ItemIndex := Fi_PrtPrjId div 4 ;
    cboPrjLine.ItemIndex := (Fi_PrtPrjId mod 4) - 1;
    if (Fi_PrtPrjId mod 4) = 0 then cboPrjLine.ItemIndex := 3;
  end;
  // 判断缺省打印聘用的页码和行数
  if Fi_PrtEngId <> 0 then
  begin
    cboEngPage.ItemIndex := Fi_PrtEngId div 4 ;
    cboEngLine.ItemIndex := (Fi_PrtEngId mod 4) - 1;
    if (Fi_PrtEngId mod 4) = 0 then cboEngLine.ItemIndex := 3;
  end;
  // 判断缺省打印审查的页码和行数
  if Fi_PrtChkId <> 0 then
  begin
    cboChkPage.ItemIndex := Fi_PrtChkId div 4 ;
    cboChkLine.ItemIndex := (Fi_PrtChkId mod 4) - 1;
    if (Fi_PrtChkId mod 4) = 0 then cboChkLine.ItemIndex := 3;
  end;
end;

procedure TfrmPsnLicnsPrtSet.prip_IniInterface;
begin
  if Fi_PrtPrjId <> 0 then  //是打印项目时被调用
  begin
    cboPrjPage.Enabled := True;
    cboPrjLine.Enabled := True;
  end;

  if Fi_PrtEngId <> 0 then  //是打印聘用时被调用
  begin
    cboEngPage.Enabled := True;
    cboEngLine.Enabled := True;
  end;

  if Fi_PrtChkId <> 0 then  //是打印审查时被调用
  begin
    cboChkPage.Enabled := True;
    cboChkLine.Enabled := True;
  end;
end;

procedure TfrmPsnLicnsPrtSet.pubp_Ini(Ac_Args: TStrings);
begin
  if Ac_Args <> nil then
    with Ac_Args do
    begin
      if Count > 0 then Fi_PrtFstFlag := StrToInt(Strings[0]);
      if Count > 1 then Fi_PrtPrjId := StrToInt(Strings[1]);
      if Count > 2 then Fi_PrtEngId := StrToInt(Strings[2]);
      if Count > 3 then Fi_PrtChkId := StrToInt(Strings[3]);
    end;

  prip_IniData;
  prip_IniInterface;
end;

procedure TfrmPsnLicnsPrtSet.FormCreate(Sender: TObject);
begin
  Fi_PrtFstFlag := 0;
  Fi_PrtPrjId := 0;
  Fi_PrtEngId := 0;
  Fi_PrtChkId := 0;
end;

function TfrmPsnLicnsPrtSet.GetCurPrtChkLine: Integer;
var
  li_CurPage, li_CurLine : Integer;
begin
  li_CurPage := cboChkPage.ItemIndex;
  li_CurLine := cboChkLine.ItemIndex;
  Result := li_CurPage * 4 + li_CurLine + 1;
end;

function TfrmPsnLicnsPrtSet.GetCurPrtEngLine: Integer;
var
  li_CurPage, li_CurLine : Integer;
begin
  li_CurPage := cboEngPage.ItemIndex;
  li_CurLine := cboEngLine.ItemIndex;
  Result := li_CurPage * 4 + li_CurLine + 1;
end;

function TfrmPsnLicnsPrtSet.GetCurPrtFstFlag: Integer;
begin
  if radYes.Checked then Result := 1
  else Result := 0;
end;

function TfrmPsnLicnsPrtSet.GetCurPrtPrjLine: Integer;
var
  li_CurPage, li_CurLine : Integer;
begin
  li_CurPage := cboPrjPage.ItemIndex;
  li_CurLine := cboPrjLine.ItemIndex;
  Result := li_CurPage * 4 + li_CurLine + 1;
end;

procedure TfrmPsnLicnsPrtSet.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPsnLicnsPrtSet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

end.

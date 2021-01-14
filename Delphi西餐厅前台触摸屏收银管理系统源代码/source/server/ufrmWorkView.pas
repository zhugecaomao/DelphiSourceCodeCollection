unit ufrmWorkView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, DB, ADODB, CSADOQuery, ActnList, ImgList,
  ComCtrls, ToolWin, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, ExtCtrls, dxEdLib, dxDBELib, dxEditor, StdCtrls,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmWorkView = class(TfrmViewDataBase)
    ViewqI_WORK_CD: TStringField;
    ViewqI_WORK_NAME: TStringField;
    ViewqI_START_TIME: TStringField;
    ViewqI_END_TIME: TStringField;
    ViewqI_LEN_DATE: TBooleanField;
    ViewqI_LEN_TIME: TStringField;
    grdListI_WORK_CD: TdxDBGridMaskColumn;
    grdListI_WORK_NAME: TdxDBGridMaskColumn;
    grdListI_START_TIME: TdxDBGridMaskColumn;
    grdListI_END_TIME: TdxDBGridMaskColumn;
    grdListI_LEN_DATE: TdxDBGridCheckColumn;
    grdListI_LEN_TIME: TdxDBGridMaskColumn;
    Panel1: TPanel;
    Label1: TLabel;
    dxDBEdit1: TdxDBEdit;
    Label2: TLabel;
    dxDBEdit2: TdxDBEdit;
    Label3: TLabel;
    dxDBEdit3: TdxDBEdit;
    Label4: TLabel;
    dxDBEdit4: TdxDBEdit;
    Label5: TLabel;
    dxDBEdit5: TdxDBEdit;
    Label6: TLabel;
    dxDBCheckEdit1: TdxDBCheckEdit;
    procedure atNewExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function prif_GetWorkCD: String;
  protected
    procedure prop_IniData; override;
  public
    { Public declarations }
  end;

var
  frmWorkView: TfrmWorkView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmWorkView }

function TfrmWorkView.prif_GetWorkCD: String;
var
  li_WorkCD: Integer;
begin
  with dmData.Temp do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT MAX(I_WORK_CD) AS I_WORK_CD FROM T_WORK_MS';
    Open;
    if IsEmpty then
    begin
      Result := '01';
    end else begin
      li_WorkCD := StrToIntDef(FieldByName('I_WORK_CD').AsString, 0) + 1;
      case Length(IntToStr(li_WorkCD)) of
        1:
        begin
          Result := Trim('0' + IntToStr(li_WorkCD));
        end;
        2:
        begin
          Result := IntToStr(li_WorkCD);
        end;
      end;
    end;
  end;
end;

procedure TfrmWorkView.atNewExecute(Sender: TObject);
var
  ls_WorkCD: String;
begin
  inherited;
  if Viewq.State <> dsBrowse then
  begin
    AppMsg('当前正在编辑数据，不能添加！', '班次管理');
    Exit;
  end;
  ls_WorkCD := prif_GetWorkCD;
  if StrToInt(ls_WorkCD) > 99 then
  begin
    AppMsg('班次编号已经到达最大！，不能添加！', '班次管理');
    Exit;
  end;
  Viewq.Append;
  Viewq.FieldValues['I_WORK_CD'] := ls_WorkCD;
end;

procedure TfrmWorkView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
    except
      Abort;
    end;
  end;
end;

procedure TfrmWorkView.atEditExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit;
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Edit;
    except
      Abort;
    end;
  end;
end;

procedure TfrmWorkView.atDelExecute(Sender: TObject);
begin
  inherited;
  if Viewq.IsEmpty then Exit; 
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Delete; 
    except
      Abort;
    end;
    prop_IniData;
  end;
end;

procedure TfrmWorkView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_WORK_MS';
    Open; 
  end;
end;

procedure TfrmWorkView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmWorkView := nil;
end;

end.

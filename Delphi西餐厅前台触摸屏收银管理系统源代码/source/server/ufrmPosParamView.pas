unit ufrmPosParamView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmViewDataBase, dxExEdtr, DB, ADODB, CSADOQuery, ActnList,
  ImgList, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ToolWin, StdCtrls,
  ExtCtrls, dxEdLib, dxEditor, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCore;

type
  TfrmPosParamView = class(TfrmViewDataBase)
    ViewqI_DATETIME: TStringField;
    ViewqI_REMARK1: TStringField;
    ViewqI_REMARK2: TStringField;
    ViewqI_REMARK3: TStringField;
    ViewqI_REMARK4: TStringField;
    ViewqI_REMARK5: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    eDateTime: TdxTimeEdit;
    eRemark1: TdxEdit;
    eRemark2: TdxEdit;
    eRemark3: TdxEdit;
    eRemark4: TdxEdit;
    eRemark5: TdxEdit;
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure ViewqBeforePost(DataSet: TDataSet);
    procedure atNewExecute(Sender: TObject);
    procedure atDelExecute(Sender: TObject);
    procedure atEditExecute(Sender: TObject);
    procedure atSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure prop_IniData; override;
    procedure prop_IniInterFace; override;
  public
    { Public declarations }
  end;

var
  frmPosParamView: TfrmPosParamView;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmPosParamView }

procedure TfrmPosParamView.prop_IniData;
begin
  inherited;
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT TOP 1 * FROM T_POS_PARAM_MS';
    Open;
  end;
end;

procedure TfrmPosParamView.ViewqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    eDateTime.Text := FieldByName('I_DATETIME').AsString;
    eRemark1.Text := FieldByName('I_REMARK1').AsString;
    eRemark2.Text := FieldByName('I_REMARK2').AsString;
    eRemark3.Text := FieldByName('I_REMARK3').AsString;
    eRemark4.Text := FieldByName('I_REMARK4').AsString;
    eRemark5.Text := FieldByName('I_REMARK5').AsString;
  end;
end;

procedure TfrmPosParamView.ViewqBeforePost(DataSet: TDataSet);
begin
  inherited;
  with Viewq do
  begin
    FieldByName('I_DATETIME').AsString := eDateTime.Text;
    FieldByName('I_REMARK1').AsString := eRemark1.Text;
    FieldByName('I_REMARK2').AsString := eRemark2.Text;
    FieldByName('I_REMARK3').AsString := eRemark3.Text;
    FieldByName('I_REMARK4').AsString := eRemark4.Text;
    FieldByName('I_REMARK5').AsString := eRemark5.Text;
  end;
end;

procedure TfrmPosParamView.atNewExecute(Sender: TObject);
begin
 //;

end;

procedure TfrmPosParamView.atDelExecute(Sender: TObject);
begin
//;
end;

procedure TfrmPosParamView.atEditExecute(Sender: TObject);
begin
  inherited;
  //if Viewq.IsEmpty then Exit;
  if Viewq.State in [dsBrowse] then
  begin
    try
      Viewq.Edit;
      eDateTime.SetFocus;
    except
      Abort;
    end;
  end else
    AppMsg('当前正在编辑数据，不能再编辑！', '原料分类管理');
end;

procedure TfrmPosParamView.atSaveExecute(Sender: TObject);
begin
  inherited;
  if Viewq.State in [dsEdit, dsInsert] then
  begin
    try
      Viewq.Post;
      AppMsg('数据保存完成!', '原料分类', 1);
    except
      Abort;
    end;
  end;
end;

procedure TfrmPosParamView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmPosParamView := nil;
end;

procedure TfrmPosParamView.prop_IniInterFace;
begin
  inherited;
  tbNew.Visible := False;
  tbDel.Visible := False;    
end;

end.

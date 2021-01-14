unit ufrmPosSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxEdLib, StdCtrls, DB, ADODB, CSADOQuery,
  Buttons;

type
  TfrmPosSet = class(TForm)
    Viewq: TCSADOQuery;
    ViewqI_DATETIME: TStringField;
    ViewqI_REMARK1: TStringField;
    ViewqI_REMARK2: TStringField;
    ViewqI_REMARK3: TStringField;
    ViewqI_REMARK4: TStringField;
    ViewqI_REMARK5: TStringField;
    Viewd: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    eRemark1: TdxEdit;
    eRemark2: TdxEdit;
    eRemark3: TdxEdit;
    eRemark4: TdxEdit;
    eRemark5: TdxEdit;
    bbtnSelect1: TBitBtn;
    bbtnSelect2: TBitBtn;
    bbtnSelect3: TBitBtn;
    bbtnSelect4: TBitBtn;
    bbtnSelect5: TBitBtn;
    bbtnExit: TBitBtn;
    procedure ViewqAfterScroll(DataSet: TDataSet);
    procedure bbtnExitClick(Sender: TObject);
    procedure bbtnSelect1Click(Sender: TObject);
    procedure bbtnSelect2Click(Sender: TObject);
    procedure bbtnSelect3Click(Sender: TObject);
    procedure bbtnSelect4Click(Sender: TObject);
    procedure bbtnSelect5Click(Sender: TObject);
  private
    procedure prip_IniData;
    procedure prip_IniInterFace; 
  public
    procedure pubp_Ini;
  end;

var
  frmPosSet: TfrmPosSet;

implementation

uses udmData, upubCommon;

{$R *.dfm}

{ TfrmPosSet }

procedure TfrmPosSet.prip_IniData;
begin
  with Viewq do
  begin
    if Active then Close;
    Connection := dmData.adocon;
    SQL.Text := 'SELECT * FROM T_POS_PARAM_MS';
    Open;
  end;
end;

procedure TfrmPosSet.prip_IniInterFace;
begin
  WindowState := wsMaximized;
end;

procedure TfrmPosSet.pubp_Ini;
begin
  prip_IniData;
  prip_IniInterFace;
end;

procedure TfrmPosSet.ViewqAfterScroll(DataSet: TDataSet);
begin
  with Viewq do
  begin 
    eRemark1.Text := FieldByName('I_REMARK1').AsString;
    eRemark2.Text := FieldByName('I_REMARK2').AsString;
    eRemark3.Text := FieldByName('I_REMARK3').AsString;
    eRemark4.Text := FieldByName('I_REMARK4').AsString;
    eRemark5.Text := FieldByName('I_REMARK5').AsString;
  end;
end;

procedure TfrmPosSet.bbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPosSet.bbtnSelect1Click(Sender: TObject);
begin
  MachinesInfo.PrintTitle := eRemark1.Text;
end;

procedure TfrmPosSet.bbtnSelect2Click(Sender: TObject);
begin
  MachinesInfo.PrintTitle := eRemark2.Text;
end;

procedure TfrmPosSet.bbtnSelect3Click(Sender: TObject);
begin
  MachinesInfo.PrintTitle := eRemark3.Text;
end;

procedure TfrmPosSet.bbtnSelect4Click(Sender: TObject);
begin
  MachinesInfo.PrintTitle := eRemark4.Text;
end;

procedure TfrmPosSet.bbtnSelect5Click(Sender: TObject);
begin
  MachinesInfo.PrintTitle := eRemark5.Text;
end;

end.

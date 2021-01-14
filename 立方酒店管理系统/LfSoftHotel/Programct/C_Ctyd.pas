unit C_Ctyd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBTables, Grids, DBGrids,
  DBCtrls, ComCtrls, C_CtDefine;

type
  TCtydForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblTitle: TLabel;
    btnClose: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    qryYdcysk: TQuery;
    qryYdcytd: TQuery;
    dsYdcysk: TDataSource;
    dsYdcytd: TDataSource;
    dtpDate: TDateTimePicker;
    Label1: TLabel;
    btnYdAll: TBitBtn;
    btnJryd: TBitBtn;
    btnQuery: TBitBtn;
    qryYdcyskD_YDBH: TStringField;
    qryYdcyskD_CTBH: TStringField;
    qryYdcyskD_CTMC: TStringField;
    qryYdcyskD_KRBH: TStringField;
    qryYdcyskD_KRXM: TStringField;
    qryYdcyskD_YDRQ: TDateTimeField;
    qryYdcyskD_SYRQ: TDateTimeField;
    qryYdcyskD_SYSJ: TDateTimeField;
    qryYdcyskD_SJDM: TStringField;
    qryYdcyskD_YCBZ: TStringField;
    qryYdcyskD_YCLX: TIntegerField;
    qryYdcyskD_RS: TIntegerField;
    qryYdcyskD_DJ: TFloatField;
    qryYdcyskD_XFSL: TFloatField;
    qryYdcyskD_XFJE: TFloatField;
    qryYdcyskD_YDBZ: TStringField;
    qryYdcyskD_RZBZ: TStringField;
    qryYdcyskD_KTBZ: TStringField;
    qryYdcyskD_JSBZ: TStringField;
    qryYdcyskD_BZ: TBlobField;
    qryYdcyskD_CZYXM: TStringField;
    qryYdcytdD_YDBH: TStringField;
    qryYdcytdD_CTBH: TStringField;
    qryYdcytdD_CTMC: TStringField;
    qryYdcytdD_KRBH: TStringField;
    qryYdcytdD_KRXM: TStringField;
    qryYdcytdD_YDRQ: TDateTimeField;
    qryYdcytdD_SYRQ: TDateTimeField;
    qryYdcytdD_SYSJ: TDateTimeField;
    qryYdcytdD_SJDM: TStringField;
    qryYdcytdD_YCBZ: TStringField;
    qryYdcytdD_YCLX: TIntegerField;
    qryYdcytdD_RS: TIntegerField;
    qryYdcytdD_DJ: TFloatField;
    qryYdcytdD_XFSL: TFloatField;
    qryYdcytdD_XFJE: TFloatField;
    qryYdcytdD_YDBZ: TStringField;
    qryYdcytdD_RZBZ: TStringField;
    qryYdcytdD_KTBZ: TStringField;
    qryYdcytdD_JSBZ: TStringField;
    qryYdcytdD_BZ: TBlobField;
    qryYdcytdD_CZYXM: TStringField;
    btnYdktsk: TBitBtn;
    qryCtbh: TQuery;
    btnYdkttd: TBitBtn;
    Bevel1: TBevel;
    procedure qryYdcyskD_YDBZGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnYdAllClick(Sender: TObject);
    procedure btnJrydClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnYdktskClick(Sender: TObject);
    procedure btnYdkttdClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowSk(ADate: TDateTime);
    procedure ShowTd(ADate: TDateTime);
    procedure Ydktsk;
    procedure Ydkttd;
  public
    { Public declarations }
  end;

var
  CtydForm: TCtydForm;

procedure Ydcy;

implementation

uses C_ctmain, C_CtData, C_Ctxtm;

{$R *.dfm}

procedure Ydcy;
begin
  CtydForm := TCtydForm.Create(Application);
  try
    with CtydForm do
    begin
      dtpDate.Date := Date;
      ShowSk(Date);
      ShowTd(Date);
      ShowModal;
    end;
  finally
    CtydForm.Free;
  end;

end;

procedure TCtydForm.ShowSk(ADate: TDateTime);
var
  s : string;
begin
  with qryYdcySk do
  begin
    Close;
    SQL.Clear;
    if ADate=0 then
    begin
      s := 'select * from YDCY where (D_YDBZ="'+YDCY_SK+'")and(D_CTBH="0")and(D_RZBZ="T")and(D_KTBZ="F")';
      SQL.Add(s);
    end
    else
    begin
      s := 'select * from YDCY where (D_YDBZ="'+YDCY_SK+'")and(D_SYRQ=:RQ)and(D_CTBH="0")and(D_RZBZ="T")and(D_KTBZ="F")';
      SQL.Add(s);
      ParamByName('RQ').AsDate := ADate;
    end;
    Open;
  end;
end;

procedure TCtydForm.ShowTd(ADate: TDateTime);
var
  s : string;
begin
  with qryYdcyTd do
  begin
    Close;
    SQL.Clear;
    if ADate=0 then
    begin
      s := 'select * from YDCY where (D_YDBZ="'+YDCY_TD+'")and(D_CTBH<>"0")and(D_RZBZ="T")and(D_KTBZ="F")';
      SQL.Add(s);
    end
    else
    begin
      s := 'select * from YDCY where (D_YDBZ="'+YDCY_TD+'")and(D_SYRQ=:RQ)and(D_CTBH<>"0")and(D_RZBZ="T")and(D_KTBZ="F")';
      SQL.Add(s);
      ParamByName('RQ').AsDate := ADate;
    end;
    Open;
  end;
end;

procedure TCtydForm.qryYdcyskD_YDBZGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
  begin
    if Sender.AsString = YDCY_SK then Text := '散客'
    else
    if Sender.AsString = YDCY_TD then Text := '团队'
    else
      Text := '';
  end;
end;

procedure TCtydForm.btnYdAllClick(Sender: TObject);
begin
  ShowSk(0);
  ShowTd(0);
end;

procedure TCtydForm.btnJrydClick(Sender: TObject);
begin
  ShowSk(Date);
  ShowTd(Date);
end;

procedure TCtydForm.btnQueryClick(Sender: TObject);
begin
  ShowSk(dtpDate.Date);
  ShowTd(dtpDate.Date);
end;

procedure TCtydForm.Ydktsk;
var
  AYdbh,ADcbh,AKrxm,AYcbz,AKrbh: string;
  ADj: Currency;
  i,j: Integer;
  ACtzts: TCtzts;
begin
  if qryYdcysk.IsEmpty then Exit;

  if (qryYdcyskD_SYRQ.Value=Date) then
    if Confirm('你确认开台吗？') then
    begin
      AYdbh := qryYdcyskD_YDBH.Value;
      AKrxm := qryYdcyskD_KRXM.Value;
      AYcbz := qryYdcyskD_YCBZ.Value;
      AKrbh := qryYdcyskD_KRBH.Value;
      ADj   := qryYdcyskD_DJ.Value;
      ADcbh := CtData.GetBh('D_DCBH',PREV_DCBH);
      with qryCtbh do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from YDCY where (D_YDBH="'+AYdbh+'")and(D_CTBH<>"0")');
        Open;
      end;
        CtData.DatabaseUser.StartTransaction;
        try
          SetLength(ACtzts,qryCtbh.RecordCount);
          qryCtbh.First;
          i := 0;
          while not qryCtbh.Eof do
          begin
            with CtMainForm do
            begin
            for j:=0 to FCtNum - 1 do
              if FCtzt[j].ACtbh = qryCtbh.FieldByName('D_CTBH').AsString then
              begin
                if FCtzt[j].ACtzt = CTZT_USE then
                  raise Exception.Create('有餐厅正在使用中,你不能开台！');
                Break;
              end;
            end;
            ACtzts[i].ACtbh := qryCtbh.FieldByName('D_CTBH').AsString;
            Inc(i);
            qryCtbh.Next;
          end;
          ACtzts := CtxtmYd(ACtzts,AKrxm,AYcbz);
          if CtxtmForm.ModalResult = mrOK then
          begin
            for i:= Low(ACtzts) to High(ACtzts) do
              CtMainForm.Ydcykt(ADcbh,ACtzts[i].ACtbh,AKrxm,AYcbz,'P',ADj);
            //删除预定信息
            with CtData.qrySysData do
            begin
              Close;
              SQL.Clear;
              //SQL.Add('delete from YDCY where D_YDBH="'+AYdbh+'"');
              SQL.Add('update YDCY set D_KTBZ= "T" where (D_YDBH="'+AYdbh+'")and(D_KRBH="'+AKrbh+'")');
              ExecSQL;
            end;
            qryYdcysk.Close;
            qryYdcysk.Open;
            ShowInfo('开台成功！');
          end;
          CtData.DatabaseUser.Commit;
        except
          CtData.DatabaseUser.Rollback;
          raise;
        end;

      CtMainForm.ShowCtzt;
    end;
end;


procedure TCtydForm.Ydkttd;
var
  AYdbh,ADcbh,AKrxm,AYcbz,ACtbh,AKrbh: string;
  ADj: Currency;
  i: Integer;
  ACtzts: TCtzts;
begin
  if qryYdcytd.IsEmpty then Exit;

  if (qryYdcytdD_SYRQ.Value=Date) then
    if Confirm('你确认开台吗？') then
    begin
      AYdbh := qryYdcytdD_YDBH.Value;
      AKrbh := qryYdcytdD_KRBH.Value;
      AKrxm := qryYdcytdD_KRXM.Value;
      AYcbz := qryYdcytdD_YCBZ.Value;
      ADj   := qryYdcytdD_DJ.Value;
      ACtbh := qryYdcytdD_CTBH.Value;
      ADcbh := CtData.GetBh('D_DCBH',PREV_DCBH);
        CtData.DatabaseUser.StartTransaction;
        try
          SetLength(ACtzts,0);
          ACtzts := CtxtmYd(ACtzts,AKrxm,AYcbz);
          if CtxtmForm.ModalResult = mrOK then
          begin
            for i:= Low(ACtzts) to High(ACtzts) do
              CtMainForm.Ydcykt(ADcbh,ACtzts[i].ACtbh,AKrxm,AYcbz,'T',ADj);
            //更新预定信息
            with CtData.qrySysData do
            begin
              Close;
              SQL.Clear;
              //SQL.Add('delete from YDCY where (D_YDBH="'+AYdbh+'")and(D_CTBH="'+ACtbh+'")');
              SQL.Add('update YDCY  set D_KTBZ = "T" where (D_YDBH="'+AYdbh+'")and(D_KRBH="'+AKrbh+'")and(D_CTBH="'+ACtbh+'")');
              ExecSQL;
              Close;
              SQL.Clear;
              SQL.Add('select * from YDCY where (D_YDBH="'+AYdbh+'")and(D_CTBH<>"0")');
              Open;
              if IsEmpty then
              begin
                Close;
                SQL.Clear;
                //SQL.Add('delete from YDCY where D_YDBH="'+AYdbh+'"');
                SQL.Add('update YDCY set D_KTBZ= "T" where (D_YDBH="'+AYdbh+'")and(D_KRBH="'+AKrbh+'")');
                ExecSQL;
              end;
              Close;
            end;
            qryYdcytd.Close;
            qryYdcytd.Open;
            ShowInfo('开台成功！');
          end;
          CtData.DatabaseUser.Commit;
        except
          CtData.DatabaseUser.Rollback;
          raise;
        end;

      CtMainForm.ShowCtzt;
    end;
end;

procedure TCtydForm.btnYdktskClick(Sender: TObject);
begin
  Ydktsk;
end;

procedure TCtydForm.btnYdkttdClick(Sender: TObject);
begin
  Ydkttd;
end;

end.

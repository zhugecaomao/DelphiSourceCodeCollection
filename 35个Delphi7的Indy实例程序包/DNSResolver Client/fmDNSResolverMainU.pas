unit fmDNSResolverMainU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdDNSResolver, ActnList;

type
  TForm1 = class(TForm)
    IdDNSResolver: TIdDNSResolver;
    btnRun: TButton;
    memoResult: TMemo;
    edDNS: TEdit;
    Label1: TLabel;
    edQuery: TEdit;
    Label2: TLabel;
    gbRequests: TGroupBox;
    rbRecord: TRadioButton;
    cbA: TCheckBox;
    cbNS: TCheckBox;
    cbMD: TCheckBox;
    cbName: TCheckBox;
    cbSOA: TCheckBox;
    cbMB: TCheckBox;
    cbMG: TCheckBox;
    cbMR: TCheckBox;
    cbNULL: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    cbWKS: TCheckBox;
    cbPTR: TCheckBox;
    cbHINFO: TCheckBox;
    cbMINFO: TCheckBox;
    cbMX: TCheckBox;
    cbTXT: TCheckBox;
    ActionList1: TActionList;
    acUpdateQueryParams: TAction;
    rbAll: TRadioButton;
    cbMF: TCheckBox;
    acRun: TAction;
    lWarning: TLabel;
    procedure acUpdateQueryParamsExecute(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure rbRecordClick(Sender: TObject);
    procedure rbAllClick(Sender: TObject);
    procedure rbZoneClick(Sender: TObject);
    procedure cbAClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.acUpdateQueryParamsExecute(Sender: TObject);
var
  QueryCount: integer;
begin
  // Update the visuals

  // enabled/disable the record check boxes
  cbA.enabled := rbRecord.Checked;
  cbNS.enabled := rbRecord.Checked;
  cbMD.enabled := rbRecord.Checked;
  cbName.enabled := rbRecord.Checked;
  cbSOA.enabled := rbRecord.Checked;
  cbMG.enabled := rbRecord.Checked;
  cbMR.enabled := rbRecord.Checked;
  cbNULL.enabled := rbRecord.Checked;
  cbWKS.enabled := rbRecord.Checked;
  cbPTR.enabled := rbRecord.Checked;
  cbHINFO.enabled := rbRecord.Checked;
  cbMINFO.enabled := rbRecord.Checked;
  cbMX.enabled := rbRecord.Checked;
  cbTXT.enabled := rbRecord.Checked;
  cbMF.enabled := rbRecord.Checked;
  cbMB.enabled := rbRecord.Checked;
  // Create the query options
  if rbAll.checked then
  begin
    IdDNSResolver.QueryRecords := [qtSTAR];
    QueryCount := 1;
  end
  else
  begin
    IdDNSResolver.QueryRecords := [];
    QueryCount := 0;
    if cbA.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtA];
      inc(QueryCount);
    end;
    if cbNS.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtNS];
      inc(QueryCount);
    end;
    if cbMD.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtMD];
      inc(QueryCount);
    end;
    if cbName.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtNAME];
      inc(QueryCount);
    end;
    if cbSOA.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtSOA];
      inc(QueryCount);
    end;
    if cbMG.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtMG];
      inc(QueryCount);
    end;
    if cbMR.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtMR];
      inc(QueryCount);
    end;
    if cbNULL.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtNULL];
      inc(QueryCount);
    end;
    if cbWKS.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtWKS];
      inc(QueryCount);
    end;
    if cbPTR.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtPTR];
      inc(QueryCount);
    end;
    if cbHINFO.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtHINFO];
      inc(QueryCount);
    end;
    if cbMINFO.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtMINFO];
      inc(QueryCount);
    end;
    if cbMX.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtMX];
      inc(QueryCount);
    end;
    if cbTXT.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtTXT];
      inc(QueryCount);
    end;
    if cbMF.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtMF];
      inc(QueryCount);
    end;
    if cbMB.checked then
    begin
      IdDNSResolver.QueryRecords := IdDNSResolver.QueryRecords + [qtMB];
      inc(QueryCount);
    end;
  end;
  if QueryCount > 1 then
    lWarning.font.Color := clRed
  else
    lWarning.font.Color := clWindowText;
  IdDNSResolver.Host := edDNS.text;
  // Only allow to run the query if it's not empty
  acRun.Enabled := IdDNSResolver.QueryRecords <> [];
end;

procedure TForm1.acRunExecute(Sender: TObject);
var
  i: integer;
begin
  IdDNSResolver.Active := true;
  IdDNSResolver.Resolve(edQuery.text);
  IdDNSResolver.Active := false;
  for i := 0 to  IdDNSResolver.QueryResult.Count - 1 do
  begin
    case IdDNSResolver.QueryResult[i].RecType of
      ord(qtA):
      begin
        memoResult.Lines.Append('A:');
        memoResult.Lines.Append('  Domain Name: ' + IdDNSResolver.QueryResult[i]..DomainName);
      end;
      qtName:
      begin
        memoResult.Lines.Append('Name');
        memoResult.Lines.Append('  Name: ' + IdDNSResolver.QueryResult[i].RData.DomainName);
      end;
      qtPTR:
      begin
        memoResult.Lines.Append('PTR:');
        memoResult.Lines.Append('  PTR: ' + IdDNSResolver.QueryResult[i].RData.DomainName);
      end;
      qtMX:
      begin
        memoResult.Lines.Append('MX');
        memoResult.Lines.Append('  Exchange: ' + (IdDNSResolver.QueryResult[i]).RData.MX.Exchange);
        memoResult.Lines.Append('  preference: ' + IntToStr((IdDNSResolver.QueryResult[i]).RData.MX.Preference));
      end;
      qtSOA:
      begin
        memoResult.Lines.Append('SOA');
        memoResult.Lines.Append('  Expire: ' + IntToStr(IdDNSResolver.QueryResult[i].RData.SOA.Expire));
        memoResult.Lines.Append('  Minimum: ' + IntToStr(IdDNSResolver.QueryResult[i].RData.SOA.Minimum));
        memoResult.Lines.Append('  MName: ' + IdDNSResolver.QueryResult[i].RData.SOA.MName);
        memoResult.Lines.Append('  Refresh: ' + IntToStr(IdDNSResolver.QueryResult[i].RData.SOA.Refresh));
        memoResult.Lines.Append('  Retry: ' + IntToStr(IdDNSResolver.QueryResult[i].RData.SOA.Retry));
        memoResult.Lines.Append('  RName: ' + IdDNSResolver.QueryResult[i].RData.SOA.RName);
        memoResult.Lines.Append('  Serial: ' + IntToStr(IdDNSResolver.QueryResult[i].RData.SOA.Serial));
      end;
      cWKS:
      begin
        memoResult.Lines.Append('WKS');
        memoResult.Lines.Append('  Address: ' + IntToStr((IdDNSResolver.QueryResult[i] as TWKSRecord).Address));
        memoResult.Lines.Append('  Protocol: ' + IntToStr((IdDNSResolver.QueryResult[i] as TWKSRecord).Protocol));
        memoResult.Lines.Append('  Bytes: ' + Format('%d %d %d %d %d %d %d %d',
                                                [(IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[0],
                                                 (IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[1],
                                                 (IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[2],
                                                 (IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[3],
                                                 (IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[4],
                                                 (IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[5],
                                                 (IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[6],
                                                 (IdDNSResolver.QueryResult[i] as TWKSRecord).Bits[7]]
                                                ));
      end;
      qtHINFO:
      begin
        memoResult.Lines.Append('HINFO');
        memoResult.Lines.Append('  CPU: ' + (IdDNSResolver.QueryResult[i] as THInfoRecord).CPUStr);
        memoResult.Lines.Append('  Os: ' + (IdDNSResolver.QueryResult[i] as THInfoRecord).OsStr);
      end;
      qtMINFO:
      begin
        memoResult.Lines.Append('MINFO:');
        memoResult.Lines.Append('  Errors MailBox: ' + (IdDNSResolver.QueryResult[i] as TMInfoRecord).EMmailBox);
        memoResult.Lines.Append('  Responsible persone MailBox: ' + (IdDNSResolver.QueryResult[i] as TMInfoRecord).RMailBox);
      end;
      qtNS:
      begin
        memoResult.Lines.Append('NS:');
        memoResult.Lines.Append('  Name server: ' + (IdDNSResolver.QueryResult[i]).RData.DomainName);
      end;
      else
      begin
        memoResult.Lines.Append('Other:');
        memoResult.Lines.Append('  Data: ' + (IdDNSResolver.QueryResult[i]).RData.Data);
      end;
    end;
    memoResult.Lines.Append('  TTL: ' + IntToStr(IdDNSResolver.QueryResult[i].TTL));
  end;}
end;

procedure TForm1.rbRecordClick(Sender: TObject);
begin
  acUpdateQueryParams.execute;
end;

procedure TForm1.rbAllClick(Sender: TObject);
begin
  acUpdateQueryParams.execute;

end;

procedure TForm1.rbZoneClick(Sender: TObject);
begin
  acUpdateQueryParams.execute;

end;

procedure TForm1.cbAClick(Sender: TObject);
begin
  acUpdateQueryParams.execute;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  acUpdateQueryParams.Execute;
end;

end.

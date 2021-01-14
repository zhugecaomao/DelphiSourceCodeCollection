unit uSeaRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables;

type
  TF_SeaRep = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    FQry : TQuery;
    FPSelR: Boolean; // 是否选取了记录的列印范围
    FRecord: array of integer;  // 要列印的记录号 (FPSelR 为 True 时才有值)
    FFieldCount: integer;     //要列印的栏位数目
    FField: array of integer; //要列印的栏位顺序
  public
    { Public declarations }
    qrlFieldName : array [0..12] of TQRLabel;
    qrdbtFData: array [0..12] of TQRDBText;
    Property FPQry: TQuery read FQry write FQry;
    procedure QRCreate;
  end;

var
  F_SeaRep: TF_SeaRep;
  nRec : integer;  (* 列印的记录号, 用於选取了列印的记录范围时 *)

procedure SearchRepExc(const RepQry: TQuery; PSelR: Boolean; PSelRang: array of integer);


implementation

{$R *.DFM}

procedure SearchRepExc(const RepQry: TQuery; PSelR: Boolean; PSelRang: array of integer);
var
  i : integer;
begin
  if RepQry = nil then begin
     Application.MessageBox(PChar('没有输入要列印的资料表!'),PChar('错误'),MB_ICONERROR+MB_OK);
     Exit;
  end;

  F_SeaRep := TF_SeaRep.Create(Application);
  With F_SeaRep do begin
    FPSelR := PSelR;
    FPQry := RepQry;
    QuickRep1.DataSet := FPQry;
    if FPSelR then begin       (* 若选取列印的是记录范围, 则取所有的栏位 *)
       FFieldCount := FPQry.FieldCount;
       SetLength(FField, FFieldCount);
       for i := 0 to FFieldCount-1 do FField[i] := i;
       (* 取得所选的记录号 *)
       SetLength(FRecord,High(PSelRang)+1);
       for i := 0 to High(PSelRang) do FRecord[i] := PSelRang[i];
    end
    else begin                 (* 若选取列印的是栏位范围, 则取所选的栏位 *)
       FFieldCount := High(PSelRang) + 1;
       SetLength(FField, FFieldCount);
       for i := 0 to High(PSelRang) do FField[i] := PSelRang[i];
    end;
    QuickRep1.Preview;
    Free;
  end;
end;



procedure TF_SeaRep.QRCreate;
var
  RWidth,
  nIdx: integer;
begin
  RWidth := Trunc(QRBand1.Width / (FFieldCount));
  for nIdx := 0 to FFieldCount-1 do begin
    qrlFieldName[nIdx] := TQRLabel.Create(F_SeaRep);
    qrdbtFData[nIdx] := TQRDBText.Create(F_SeaRep);
    with qrlFieldName[nIdx] do begin
      Parent := QRBand2;
      AutoSize := True;
      Top := 15;
      if nIdx = 0 then      begin
        Left := 0;
        Width := RWidth+6; end
      else begin
        Left := RWidth * nIdx + 6;
        Width := RWidth - 6;
      end;
      Font.Style := [fsBold];

      Caption := FPQry.Fields[FField[nIdx]].FieldName;


    end;  // end of with
    qrdbtFData[nIdx].Parent := QRBand3;
    qrdbtFData[nIdx].AutoSize := True;
    qrdbtFData[nIdx].Top := 8;
    qrdbtFData[nIdx].Left := qrlFieldName[nIdx].Left;
    qrdbtFData[nIdx].DataSet := FPQry;

    qrdbtFData[nIdx].DataField := qrlFieldName[nIdx].Caption;
    
  end;   // end of for
end;



procedure TF_SeaRep.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRCreate;
  nRec := 0;    // 初始化列印的记录号
end;

procedure TF_SeaRep.FormDestroy(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to FFieldCount-1 do begin
    qrlFieldName[i].Free;
    qrdbtFData[i].Free;
  end;
end;

procedure TF_SeaRep.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin                             
  if not FPSelR then exit;    // 若选取列印的是栏位范围, 则退出
  PrintBand := ((FPQry.RecNo-1) = FRecord[nRec]);  // 否则判断是否选取了该记录
  if PrintBand then Inc(nRec); 
end;

end.

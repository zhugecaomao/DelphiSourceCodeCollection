unit GetStru;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DbTables, BDE, ExtCtrls;

type
  TReadStru = class(TForm)
    List1: TListBox;
    List2: TListBox;
    Label3: TLabel;
    Alias: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure AliasChange(Sender: TObject);
    procedure AliasExit(Sender: TObject);
    procedure AliasKeyPress(Sender: TObject; var Key: Char);
    procedure List1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ShowFields(T: TTable);
  public
    { Public declarations }
  end;

var
  ReadStru: TReadStru;

implementation

{$R *.DFM}

procedure TReadStru.ShowFields(T: TTable);
var
  curProp: CURProps;
  pfldDes, pCurFld: pFLDDesc;
  i: Integer;
  MemSize: Integer;
  FieldList: string;
  S: string;
begin
  T.Open;
  Check(DbiGetCursorProps(T.Handle, curProp));
  MemSize := curProp.iFields * SizeOf(FLDDesc);
  pfldDes := AllocMem(MemSize);
  List2.items.Clear;
  try
    pCurFld := pfldDes;
    DbiGetFieldDescs(T.Handle, pfldDes);
    for I := 0 to curProp.iFields - 1 do
      with pCurFld^ do begin
        case iFldType of
          1: S := '字符';
          2: S := '日期';
          3: S := '备注';
          4: S := '逻辑';
          5: S := '短整';
          6: S := '长整';
          7: S := '浮点';
          8: S := 'BCDm';
          9: S := '字节';
          10: S := '时间';
          11: S := '邮戳';
        else S := '未知' + inttostr(iFldType); end;
        FieldList := szName +
          StringofChar(#32, 10 - Length(trim(szName))) +
          Format('(%4s,%3d,%2d)', [S, iUnits1, iUnits2]);
        List2.items.Add(Trim(FieldList));
        inc(pCurFld);
      end;
  finally
    FreeMem(pfldDes, MemSize);
  end;
  T.Close;
end;


procedure TReadStru.FormCreate(Sender: TObject);
var T: TDataBase;
begin
  T := TDataBase.Create(Self);
  T.LoginPrompt := False;
  if Session.Active = false then
    Session.Open;
  Session.GetAliasNames(Alias.Items);
end;

procedure TReadStru.AliasChange(Sender: TObject);
begin
  if Alias.ItemIndex = -1 then Exit;
  Session.GetTableNames(Alias.Text, '', true, false, List1.Items);
end;

procedure TReadStru.AliasExit(Sender: TObject);
begin
  with Alias do
    if (Text <> '') and (Items.indexof(Text) = -1) then
    begin
      Items.Add(Text);
      Alias.ItemIndex := Items.indexof(Text);
      AliasChange(Self);
    end;

end;

procedure TReadStru.AliasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then AliasExit(Self);
end;

procedure TReadStru.List1Click(Sender: TObject);
var T: TTable;
begin
  T := TTable.Create(Self);
  T.DatabaseName := Alias.Text;
  with List1 do T.TableName := Items[ItemIndex];
  ShowFields(T);
end;

end.

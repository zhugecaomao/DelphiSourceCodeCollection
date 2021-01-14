unit C_Ctxtm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DosMove, C_CtDefine, ComCtrls, DB,
  DBTables;

type
  TCtxtmForm = class(TForm)
    Panel1: TPanel;
    lblTitle: TLabel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Panel3: TPanel;
    btnOk: TBitBtn;
    btnCanc: TBitBtn;
    DosMove1: TDosMove;
    ListView1: TListView;
    tblCtzt: TTable;
    btnCx: TBitBtn;
    lblYdxx: TLabel;
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnCxClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    FCtzts: TCtzts;
    function GetCtbh(const s: string): string;
    function GetCtmc(const s: string): string;
    procedure ShowCtbh;
  public
    { Public declarations }
  end;

var
  CtxtmForm: TCtxtmForm;

function Ctxtm: TCtzts;
function CtxtmYd(ACtzts: TCtzts;AKrxm,AYcbz: string): TCtzts;

implementation

{$R *.dfm}

//选台 一次可以开多个餐台
function Ctxtm: TCtzts;
begin
  CtxtmForm := TCtxtmForm.Create(Application);
  try
    with CtxtmForm do
    begin
      ShowCtbh;
      lblYdxx.Caption := '';
      ShowModal;
      Result := FCtzts;
    end;
  finally
    CtxtmForm.Free;
  end;
end;

function CtxtmYd(ACtzts: TCtzts;AKrxm,AYcbz: string): TCtzts;
var
  i,j: Integer;
begin
  CtxtmForm := TCtxtmForm.Create(Application);
  try
    with CtxtmForm do
    begin
      lblYdxx.Caption := '客人姓名：'+AKrxm+' 用餐标准：'+AYcbz;
      ShowCtbh;
      for i:=Low(ACtzts) to High(ACtzts) do
      begin
        for j:=0 to ListView1.Items.Count -1 do
        begin
          if GetCtbh(ListView1.Items[j].Caption) = ACtzts[i].ACtbh then
            ListView1.Items[j].Checked := True;
        end;
      end;
      ShowModal;
      Result := FCtzts;
    end;
  finally
    CtxtmForm.Free;
  end;
end;
//显示餐厅
procedure TCtxtmForm.ShowCtbh;
var
  ListItem: TListItem;
begin
  tblCtzt.Open;
  tblCtzt.First;

  ListView1.Items.BeginUpdate;
  ListView1.Items.Clear;

  while not tblCtzt.Eof do
  begin
    ListItem         := ListView1.Items.Add;
    ListItem.Caption := tblCtzt.FieldByName('D_CTBH').AsString
                        +'|'+tblCtzt.FieldByName('D_CTMC').AsString;
    tblCtzt.Next;
  end;

  tblCtzt.Close;
  ListView1.Items.EndUpdate;
end;

function TCtxtmForm.GetCtbh(const s: string): string;
var
  p: Integer;
begin
  p      := Pos('|',s);
  Result := Copy(s,1,p-1);
end;

function TCtxtmForm.GetCtmc(const s: string): string;
var
  p: Integer;
begin
  p      := Pos('|',s);
  Result := Copy(s,p+1,Length(s));
end;

procedure TCtxtmForm.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Selected then
    Item.Checked := True;
end;

//重选
procedure TCtxtmForm.btnCxClick(Sender: TObject);
var
  i: Integer;
begin
  with ListView1 do
    for i:=0 to Items.Count - 1 do
      Items[i].Checked := False;
end;

//确认
procedure TCtxtmForm.btnOkClick(Sender: TObject);
var
  i,j,n: Integer;
begin
  n := 0;
  for i:=0 to ListView1.Items.Count - 1 do
    if ListView1.Items[i].Checked then Inc(n);

  SetLength(FCtzts,n);

  j := 0;
  for i:=0 to ListView1.Items.Count - 1 do
    if ListView1.Items[i].Checked then
    begin
      FCtzts[j].ACtbh := GetCtbh(ListView1.Items[i].Caption);
      FCtzts[j].ACtmc := GetCtmc(ListView1.Items[i].Caption);
      Inc(j);
    end;
end;

end.

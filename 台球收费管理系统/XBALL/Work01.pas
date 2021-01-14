unit Work01;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Xeduser, ComCtrls, ExtCtrls, StdCtrls, Db, DBTables, Grids, DBGrids,
  Variants, ImgList;

type
  TStateForm = class(TForm)
    Timer1: TTimer;
    Panel3: TPanel;
    ListView1: TListView;
    SB: TStatusBar;
    Panel4: TPanel;
    ListView2: TListView;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    Button5: TButton;
    Button1: TButton;
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    PDate1: TDateTimePicker;
    PTime1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ShowState(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView2Click(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListView2CustomDraw(Sender: TCustomListView;
      const ARect: TRect; var DefaultDraw: Boolean);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    SName: string;
    CName: string;
    procedure OpenData;
  public
    { Public declarations }
  end;

var
  StateForm: TStateForm;

implementation

uses ComePas, Data, LeftPas;

{$R *.DFM}

procedure TStateForm.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TComeForm, ComeForm);
  if ListView2.ItemIndex <> -1 then
    with ComeForm do begin
      Edit03.ItemIndex := Edit03.Items.IndexOf(SName);
      Edit03Click(nil);
      Edit05.ItemIndex := Edit05.Items.IndexOf(CName);
      Edit05Click(nil);
    end;
  ComeForm.Showmodal;
  ComeForm.Free;
  OpenData;
  ShowState(nil);
end;

procedure TStateForm.OpenData;
begin
  DM.Water.Open;
  DM.Ball00.Open;
  DM.Ball01.Open;
  DM.Ball02.Open;
  DM.Ball03.Open;
  DM.Rate.Open;
  DM.Water.First;
  DM.Ball00.First;
  DM.Ball01.First;
  DM.Ball02.First;
  DM.Ball03.First;
  DM.Rate.First;
end;

procedure TStateForm.FormCreate(Sender: TObject);
var i: word;
begin
  OpenData;
  ListView1.Clear;
  I := 0;
  while Not DM.Ball00.Eof do Begin
    with ListView1.Items.Add do begin
      Caption := DM.Ball00['名称'];
      ImageIndex := I * 2;
      I := I + 1;
    end;
    DM.Ball00.Next;
  End;
  if ListView1.Items.Count > 0 then ListView1.ItemIndex := 0;
  ShowState(nil);
end;

procedure TStateForm.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TLeftForm, LeftForm);
//找到编号
  if ListView2.ItemIndex <> -1 then
    with LeftForm do begin
      P1.Locate('名称;编号', VarArrayOf([SName, ListView2.ItemIndex + 1]), []);
      Edit1.ItemIndex := Edit1.Items.IndexOf(P1['流水号']);
      Edit1Click(nil);
    end;
  LeftForm.Showmodal;
  LeftForm.Free;
  OpenData;
  ShowState(nil);
end;

procedure TStateForm.ShowState(Sender: TObject);
var
  I, Sort, Summ: Word;
  SN, N: integer;
begin
  SN := ListView1.ItemIndex;
  if SN = -1 then Exit;
  SName := ListView1.Items[SN].Caption;
  Screen.Cursor := crHourGlass;
  Summ := DM.Ball00.Lookup('名称', SName, '数量');
  Sort := DM.Ball00.Lookup('名称', SName, '娱乐类别');
  SB.Panels[1].Text := SName;
  ListView2.Clear;
  for I := 0 to Summ - 1 do begin
    with ListView2.Items.Add do begin
      Caption := Format('%s第 %d 号台', [SName + #13, I + 1]);
      ImageIndex := SN * 2;
    end;
  end;
  DM.State.Close;
  DM.State.SQL.Text :=
    Format('Select 编号,流水号,开始时间 From Ball01 Where ' +
    '娱乐类别= %d and not 结帐标志 = True ', [Sort]);
  DM.State.Open;
  N := DM.State.RecordCount;
  while not DM.State.Eof do begin
    I := DM.State.FieldByName('编号').asinteger;
    if I > 0 then Dec(I);
    if I < Summ then begin
      ListView2.Items[I].ImageIndex := SN * 2 + 1;
      ListView2.Items[I].SubItems.Text :=
        Format('流水号：%d，', [DM.State.FieldByName('流水号').AsInteger]) +
        FormatDateTime('"开台："hh"点" nn"分"', DM.State['开始时间']);
    end;
    DM.State.Next;
  end;
  DM.State.Close;
  Screen.Cursor := crDefault;
  if N = 0 then Begin
    SB.Panels[2].Text := Format('总共有：%d 张台，目前全部空闲着', [Summ]);
  End else
    SB.Panels[2].Text := Format('总共 %d 张台，%d 张开台，开台率：%d%s', [Summ, N, N * 100 Div summ, '%']);
end;

procedure TStateForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Water.Close;
  DM.Ball00.Close;
  DM.Ball01.Close;
  DM.Ball02.Close;
  DM.Ball03.Close;
  DM.Rate.Close;
  Action := caFree;
end;

procedure TStateForm.Timer1Timer(Sender: TObject);
begin
  PDate1.Date := Date;
  PTime1.Time := Time;
end;

procedure TStateForm.ListView1DblClick(Sender: TObject);
var
  N: Integer;
begin
  N := ListView1.ItemIndex;
  if N = -1 then Exit;
  if Odd(ListView1.Selected.ImageIndex) then
    Showmessage(ListView1.Items[N].Caption);
end;

procedure TStateForm.ListView2Click(Sender: TObject);
var
  N: Integer;
  S: string;
begin
  N := ListView2.ItemIndex;
  if N = -1 then Exit;
  if Odd(ListView2.Selected.ImageIndex) then
  begin
    S := ListView2.Items[N].Caption + '--（' +
    Trim(ListView2.Items[N].SubItems.Text) + '）';
  end else begin
    S := ListView2.Items[N].Caption + '暂时空闲...';
  end;
  SB.Panels[2].Text := S;
end;

procedure TStateForm.ListView2DblClick(Sender: TObject);
var
  N: Integer;
begin
  N := ListView2.ItemIndex;
  if N = -1 then Exit;
  CName := format('第 %2d 号', [N + 1]);
  if Odd(ListView2.Selected.ImageIndex) then
  begin
    Button2.Click;
  end else begin
    Button1.Click;
  end;
end;

procedure TStateForm.Button4Click(Sender: TObject);
begin
  Application.CreateForm(TComeForm, ComeForm);
  if ListView2.ItemIndex <> -1 then
    //找到编号
    with ComeForm do begin
      Edit03.ItemIndex := Edit03.Items.IndexOf(SName);
      Edit03Click(nil);
      Edit05.ItemIndex := Edit05.Items.IndexOf(CName);
      Edit05Click(nil);
    end;
  ComeForm.Showmodal;
  ComeForm.Free;
  OpenData;
  ShowState(nil);
end;

procedure TStateForm.ListView2CustomDraw(Sender: TCustomListView;
  const ARect: TRect; var DefaultDraw: Boolean);
var
  G: TImage;
begin
  G := TImage.Create(nil);
  if FileExists('Picture.BMP') then
    G.Picture.LoadFromFile('Picture.BMP');
  ListView2.Canvas.StretchDraw(ARect, G.Picture.Graphic);
  G.Free;
end;

procedure TStateForm.FormResize(Sender: TObject);
begin
  ListView2.Refresh;
end;

end.


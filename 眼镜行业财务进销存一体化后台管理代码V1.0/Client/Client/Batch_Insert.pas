unit Batch_Insert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XPMenu, Grids, StdCtrls, Buttons, ComCtrls;

type
  Tfrm_Batch_Insert = class(TForm)
    Panel1: TPanel;
    XPMenu1: TXPMenu;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    SpeedButton5: TSpeedButton;
    GroupBox2: TGroupBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit_Z_Begin: TLabeledEdit;
    Edit_Z_End: TLabeledEdit;
    Edit_Z_FD: TLabeledEdit;
    Panel3: TPanel;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit_Q_Begin: TLabeledEdit;
    Edit_Q_End: TLabeledEdit;
    Edit_Q_FD: TLabeledEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Batch_Insert: Tfrm_Batch_Insert;
  IC,IO:integer;
implementation

uses func;

{$R *.dfm}

procedure Tfrm_Batch_Insert.SpeedButton1Click(Sender: TObject);
var
    i,j:integer;
    dispatch:Currency;//截止度数和起始度数之差
    divisor:Currency;//变化幅度为除数
    dealer:Currency; //截止度数和起始度数之差和变化幅度之商
    dealer_Str:String;
begin
    if Trim(Edit_Q_Begin.Text)='' then
    begin
        Exit;
    end;
    if Trim(Edit_Q_FD.Text)='' then
    begin
        Exit;
    end;
    if Trim(Edit_Q_End.Text)='' then
    begin
        Exit;
    end;
    divisor:=StrToFloat(Trim(Edit_Q_FD.Text));
    dispatch:=StrToFloat(Trim(Edit_Q_End.Text))-StrToFloat(Trim(Edit_Q_Begin.Text));
    dealer:=(dispatch)/(divisor);
    dealer_Str:=Format('%*.*f', [8,0,dealer]);
    BH_Count:=Strtoint(dealer_Str)+1;
    i:=Strtoint(dealer_Str)+2;
    StringGrid1.RowCount:=I;
    for j:=1 to StringGrid1.RowCount do
    begin
        StringGrid1.Cells[0,j]:=Format('%*.*f', [8,2,divisor*j]); //表示第0列第i行的名称
    end;
    Str_KD:=Trim(Edit_Q_FD.Text);//跨度
    Str_KS:=Trim(Edit_Q_Begin.Text);//其始度数
    Str_JS:=Trim(Edit_Q_End.Text); //截止度数
    Close;
end;

procedure Tfrm_Batch_Insert.SpeedButton3Click(Sender: TObject);
var
    i,j:integer;
    dispatch:Currency;//截止度数和起始度数之差
    divisor:Currency;//变化幅度为除数
    dealer:Currency; //截止度数和起始度数之差和变化幅度之商
    dealer_Str:String;
begin
    if Trim(Edit_Z_Begin.Text)='' then
    begin
        Exit;
    end;
    if Trim(Edit_Z_FD.Text)='' then
    begin
        Exit;
    end;
    if Trim(Edit_Z_End.Text)='' then
    begin
        Exit;
    end;
    divisor:=StrToFloat(Trim(Edit_Z_FD.Text));
    dispatch:=StrToFloat(Trim(Edit_Z_End.Text))-StrToFloat(Trim(Edit_Z_Begin.Text));
    dealer:=(dispatch)/(divisor);
    dealer_Str:=Format('%*.*f', [8,0,dealer]);
    i:=Strtoint(dealer_Str)+2;
    StringGrid1.ColCount:=I;
    for j:=1 to StringGrid1.ColCount do
    begin
        StringGrid1.Cells[j,0]:=Format('%*.*f', [8,2,divisor*j]); //表示第0列第i行的名称
    end;
end;

procedure Tfrm_Batch_Insert.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    s:string;
    r:TRect;
    String_Col,Prow,Pcol:Integer;
begin
    with sender as TStringGrid do
    begin
        if (GDFocused in state) then
        begin
            Pcol:=Acol;
            Prow:=ARow;
            String_Col:=ARow;
        end;
    end;
    //文字垂直居中
    with StringGrid1 do
    begin
        Canvas.FillRect(Rect);
        s:=Cells[ACol,ARow];
        r:=Rect;
        DrawText(Canvas.Handle,PChar(s),Length(s),r,DT_CENTER or DT_SINGLELINE or DT_VCENTER);
    end; 
end;

procedure Tfrm_Batch_Insert.SpeedButton2Click(Sender: TObject);
begin
    Close;
end;

end.

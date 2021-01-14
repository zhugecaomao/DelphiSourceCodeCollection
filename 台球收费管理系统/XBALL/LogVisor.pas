unit LogVisor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList;

type
  TLogForm = class(TForm)
    Page1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    ImageList1: TImageList;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button3: TButton;
    Button4: TButton;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Button5: TButton;
    Button6: TButton;
    Label10: TLabel;
    Edit7: TEdit;
    Button7: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UserCode: String;
  end;

var
  LogForm: TLogForm;

implementation

uses XedUser, Data, MenuExec;

{$R *.dfm}

procedure TLogForm.FormCreate(Sender: TObject);
begin
  Page1.Pages[0].TabVisible := False;
  Page1.Pages[1].TabVisible := False;
  Page1.Pages[2].TabVisible := False;
  Page1.ActivePageIndex := 0;
  DM.PassWord.Open;
//  Page1.ActivePageIndex := 2;
end;

procedure TLogForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  A00Form.Logined := Self.ModalResult = mrOK;
  DM.PassWord.Close;
end;

procedure TLogForm.Button3Click(Sender: TObject);
var
  FFind: Boolean;
begin
  FFind := DM.PassWord.Locate('编号', Edit3.Text, []);
  if FFind then Begin
    ShowMessage('这个操作员编号已经存在');
    Exit;
  End else Begin
    if Edit4.Text <> Edit7.Text then Begin
      ShowMessage('密码核对错误，请重新输入');
      Exit;
    End;
    if Length(Edit7.Text) < 6  then Begin
      ShowMessage('密码长度需要为6-10字符，请重新输入');
      Exit;
    End;
    DM.PassWord.Append;
    DM.PassWord['编号'] := Edit3.Text;
    DM.PassWord['密码'] := Edit4.Text;
    DM.PassWord.Post;
    ShowMessage('新的操作员已经增加');
  End;
end;

procedure TLogForm.Button1Click(Sender: TObject);
var
  FFind: Boolean;
begin
  if Edit1.Focused then begin
    Edit2.SetFocus;
    Exit;
  End;
  if DM.PassWord.RecordCount = 0 then Begin
    ModalResult := mrOK;
    Exit;
  End;
  UserCode := Edit1.Text;
  FFind := DM.PassWord.Locate('编号', Edit1.Text, []);
  Systemor := False;
  if FFind then Begin
    if DM.PassWord['密码'] = Edit2.Text then Begin
      if '*' = DM.PASSWORD.FieldByname('备注').Value then Begin
        Systemor := True;
      End;
      ModalResult := mrOK;
    End Else Begin
      ShowMessage('密码错误');
      Exit;
    End;
  End;
end;

procedure TLogForm.Button7Click(Sender: TObject);
var
  FFind: Boolean;
begin
  FFind := DM.PassWord.Locate('编号', Edit3.Text, []);
  if FFind then Begin
    if Edit4.Text <> Edit7.Text then Begin
      ShowMessage('密码核对错误，请重新输入');
      Exit;
    End;
    if DM.PassWord['密码'] <> Edit4.Text then Begin
      ShowMessage('只能删除知道密码的操作员');
      Exit;
    End;
    DM.PassWord.Delete;
    ShowMessage(Format('编号为："%s"的操作员已经删除', [Edit3.Text]));
  End else Begin
    ShowMessage('没有这个操作员编号');
  End;
end;

procedure TLogForm.Button5Click(Sender: TObject);
var
  FFind: Boolean;
begin
  if Edit5.Text <> Edit6.Text then Begin
    ShowMessage('密码核对错误，请重新输入');
    Exit;
  End;
  if Length(Edit5.Text) < 6  then Begin
    ShowMessage('密码长度需要为6-10字符，请重新输入');
    Exit;
  End;
  FFind := DM.PassWord.Locate('编号', UserCode, []);
  if FFind then Begin
    DM.PassWord.Edit;
    DM.PassWord['密码'] := Edit6.Text;
    DM.PassWord.Post;
  End else Begin
    ShowMessage('这个操作员编号不存在');
  End;
end;

procedure TLogForm.FormActivate(Sender: TObject);
begin
  Case Page1.ActivePageIndex of
    0: LogForm.Edit1.SetFocus;
    1: LogForm.Edit3.SetFocus;
    2: LogForm.Edit5.SetFocus;
  End;

end;

end.

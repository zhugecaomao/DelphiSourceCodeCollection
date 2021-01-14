unit FrmManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, DBAdvGrid, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls,
  ExtCtrls, cxLookAndFeelPainters, cxButtons, DB, cxCalc, cxDBEdit, ADODB,
  DBGrids;

type
  TAdminMan = class(TForm)
    MainPan: TPanel;
    EditPan: TPanel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    cxTextEdit6: TcxTextEdit;
    Pan: TPanel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel6: TBevel;
    cxButton1: TcxButton;
    cxButton5: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DataSource1: TDataSource;
    cxButton3: TcxButton;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    procedure SelectAdmin;
    
  public
    
  end;

var
  AdminMan: TAdminMan;

implementation

uses
  FrmData, FrmCustom;
{$R *.dfm}



procedure TAdminMan.SelectAdmin;
var
  aSql: string;
begin
  with ADOQuery1 do
  begin
    SQL.Clear;
    if IsAdmin then
      aSql :='Select * From Admin'
    else
    begin
      aSql :='Select * From Admin where 用户名='+QuotedStr(CurrenUser);
    end;
    SQL.Add(aSQl);
    Open;
  end;
end;

procedure TAdminMan.FormShow(Sender: TObject);
begin
  SelectAdmin;
  if not IsAdmin then
  begin
    cxButton2.Enabled:=False;
    cxButton3.Enabled:=False;
    cxButton5.Enabled:=False;
    cxDBTextEdit1.Properties.ReadOnly:=False;
  end
  else
    cxButton5.Enabled:=False;
end;

procedure TAdminMan.cxButton3Click(Sender: TObject);
var
  aCaption: string;
begin
  aCaption:=cxButton3.Caption;
  if aCaption='新  增' then
  begin
    ADOQuery1.Insert;
    cxButton3.Caption:='取  消';
    cxButton1.Enabled:=False;
    cxButton2.Enabled:=False;
    cxButton5.Enabled:=True;
  end
  else
  begin
    ADOQuery1.Cancel;
    cxButton3.Caption:='新  增';
    cxButton1.Enabled:=True;
    cxButton2.Enabled:=True;
    cxButton5.Enabled:=False;    
  end;
  cxDBComboBox1.Clear;
  cxDBComboBox1.Properties.Items.Add('男');
  cxDBComboBox1.Properties.Items.Add('女');
end;

procedure TAdminMan.cxButton5Click(Sender: TObject);
begin
  ADOQuery1.Post;
  if IsAdmin then
  begin
    if cxButton3.Caption='取  消' then
    begin
      cxButton3.Caption:='新  增';
      cxButton1.Enabled:=True;
      cxButton2.Enabled:=True;
      cxButton5.Enabled:=False;
    end;
    if cxButton1.Caption='取  消' then
    begin
      cxButton1.Caption:='修  改';
      cxButton2.Enabled:=True;
      cxButton3.Enabled:=True;
      cxButton5.Enabled:=False;
    end;
  end
  else
  begin
    if cxButton3.Caption='取  消' then
    begin
      cxButton3.Caption:='新  增';
      cxButton5.Enabled:=False;
    end;
    if cxButton1.Caption='取  消' then
    begin
      cxButton1.Caption:='修  改';
      cxButton5.Enabled:=False;
    end;
  end;
end;

procedure TAdminMan.cxButton2Click(Sender: TObject);
begin
  ADOQuery1.Delete;
end;

procedure TAdminMan.cxButton1Click(Sender: TObject);
var
  aCaption: string;
begin
  aCaption:=cxButton1.Caption;
  if IsAdmin then
  begin
    if aCaption='修  改' then
    begin
      ADOQuery1.Edit;
      cxButton1.Caption:='取  消';
      cxButton2.Enabled:=False;
      cxButton3.Enabled:=False;
      cxButton5.Enabled:=True;
    end
    else
    begin
      ADOQuery1.Cancel;
      cxButton1.Caption:='修  改';
      cxButton2.Enabled:=True;
      cxButton3.Enabled:=True;
      cxButton5.Enabled:=False;
    end;
  end
  else
  begin
    cxDBTextEdit1.Properties.ReadOnly:=False;
    if aCaption='修  改' then
    begin
      ADOQuery1.Edit;
      cxButton1.Caption:='取  消';
      cxButton5.Enabled:=True;
    end
    else
    begin
      ADOQuery1.Cancel;
      cxButton1.Caption:='修  改';
      cxButton5.Enabled:=False;
    end;
  end;
end;

end.

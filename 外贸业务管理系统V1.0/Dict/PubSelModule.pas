unit PubSelModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, GridsEh, DBGridEh, SUIImagePanel,
  SUIGroupBox, ExtCtrls, SUIForm, SUIButton, StdCtrls, Menus, SUIPopupMenu,
  ComCtrls, SUIStatusBar;

type
  TPubSelModule_frm = class(TBaseFrm)
    suiGroupBox1: TsuiGroupBox;
    DBGrid: TDBGridEh;
    DataSource1: TDataSource;
    Query: TADOQuery;
    Label1: TLabel;
    txtName: TEdit;
    PopupMenu1: TsuiPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    btnSel: TsuiButton;
    btnOK: TsuiButton;
    btnclose: TsuiButton;
    suiStatusBar1: TsuiStatusBar;
    procedure btnSelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btncloseClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    SelectStr:string;
    WheField :array[0..3] of string;
    DataType:string;
    Flag :boolean;
  end;

var
  PubSelModule_frm: TPubSelModule_frm;

implementation

uses DataModule, BasePage;

{$R *.dfm}

procedure TPubSelModule_frm.btnSelClick(Sender: TObject);
VAR sqlstr, whstr :string;
   i:integer;
begin
  inherited;
  whstr :='';
  if txtName.Text <> '' then
  begin
    whstr :=whstr + ' and '+WheField[2]+' like ''' + txtName.Text + '%''';
  end;
  sqlstr :=SelectStr+' where 1=1 ' + whstr;
  Get_Query(Query, sqlstr);
  for i:=0 to DBGrid.Columns.Count -1 do
  begin
      if i=0 then
      begin
       DBGrid.Columns[i].Visible :=false;
      end;
    
      if DBGrid.Columns[i].Width > 180 then
      begin
       DBGrid.Columns[i].Width :=150;
      end
      else if (DBGrid.Columns[i].Width >120) and (DBGrid.Columns[i].Width <=180) then
      begin
       DBGrid.Columns[i].Width :=120;
      end
      else if (DBGrid.Columns[i].Width <=120) and (DBGrid.Columns[i].Width >80) then
      begin
       DBGrid.Columns[i].Width :=80;
      end
      else if (DBGrid.Columns[i].Width <=80) and (DBGrid.Columns[i].Width >50) then
      begin
       DBGrid.Columns[i].Width :=60;
      end
      else if (DBGrid.Columns[i].Width <50) then
      begin
       DBGrid.Columns[i].Width :=50;
      end;
  end;
  
end;

procedure TPubSelModule_frm.btnOKClick(Sender: TObject);
begin
  inherited;
//
  Flag :=true;
  close();
end;

procedure TPubSelModule_frm.btncloseClick(Sender: TObject);
begin
  inherited;
  Flag :=false;
  CLOSE();
end;

procedure TPubSelModule_frm.DBGridCellClick(Column: TColumnEh);
begin
  inherited;
//
end;

procedure TPubSelModule_frm.FormShow(Sender: TObject);
var i:integer;
begin
  inherited;
//
  txtName.Clear;

  if SelectStr <> '' then
  begin
    Get_Query(Query, SelectStr) ;
    for i:=0 to DBGrid.Columns.Count -1 do
    begin
      if i=0 then
      begin
       DBGrid.Columns[i].Visible :=false;
      end;
    
      if DBGrid.Columns[i].Width > 180 then
      begin
       DBGrid.Columns[i].Width :=150;
      end
      else if (DBGrid.Columns[i].Width >120) and (DBGrid.Columns[i].Width <=180) then
      begin
       DBGrid.Columns[i].Width :=120;
      end
      else if (DBGrid.Columns[i].Width <=120) and (DBGrid.Columns[i].Width >80) then
      begin
       DBGrid.Columns[i].Width :=80;
      end
      else if (DBGrid.Columns[i].Width <=80) and (DBGrid.Columns[i].Width >50) then
      begin
       DBGrid.Columns[i].Width :=60;
      end
      else if (DBGrid.Columns[i].Width <50) then
      begin
       DBGrid.Columns[i].Width :=50;
      end;
    end;

  end
  else
  begin
     showmessage('SQLÓï¾äÎª¿Õ');
     close();
  end;
end;

procedure TPubSelModule_frm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_ESCAPE : if btnclose.Enabled then  btnclose.Click;
    VK_RETURN  : SelectNext(ActiveControl,True,True);
  end;

end;

procedure TPubSelModule_frm.DBGridDblClick(Sender: TObject);
begin
  inherited;
  btnOK.Click;
end;

procedure TPubSelModule_frm.FormCreate(Sender: TObject);
begin
  inherited;
  //SetLength(WheField, 4);

end;

end.

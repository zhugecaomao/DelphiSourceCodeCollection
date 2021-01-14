unit InfoAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ExtCtrls, SUIForm, SUIImagePanel, SUIGroupBox,
  SUIRadioGroup, SUIButton;

type
  TInfoAdd_frm = class(TBaseFrm)
    rgroupType: TsuiRadioGroup;
    btnOK: TsuiButton;
    btncancel: TsuiButton;
    procedure btnOKClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    AddValue :string;
    GroupList:array of string;
  end;

var
  InfoAdd_frm: TInfoAdd_frm;

implementation

{$R *.dfm}

procedure TInfoAdd_frm.btnOKClick(Sender: TObject);
begin
  inherited;
  if rgroupType.ItemIndex >=0 then
  begin
     AddValue :=inttostr(rgroupType.ItemIndex + 1);
     close();
  end
  else
  begin
    showmessage('请选择增加类型');
  end;
//
end;

procedure TInfoAdd_frm.btncancelClick(Sender: TObject);
begin
  inherited;
  AddValue :='';
  close();
//
end;

procedure TInfoAdd_frm.FormCreate(Sender: TObject);
begin
  inherited;
  setlength(GroupList, 2);
end;

procedure TInfoAdd_frm.FormShow(Sender: TObject);
var i:integer;
begin
  inherited;
  for i:=0 to length(GroupList) -1 do
  begin
     rgroupType.Items.Add(GroupList[i]); 
  end;
end;

end.

unit xmmx_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, XPMenu;

type
  Txmmx = class(TForm)
    DBGrid1: TDBGrid;
    DBExmid: TDBEdit;
    DBExmfymc: TDBEdit;
    DBEfy: TDBEdit;
    DBEdw: TDBEdit;
    XPMenu1: TXPMenu;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  xmmx: Txmmx;

implementation

uses DM_zygl_, zygl_;

{$R *.dfm}

procedure Txmmx.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
     //数据加载
     zygl.Exmfymc.Text:=DBExmfymc.Text;

     //判断是否无返回值
     if zygl.Exmfymc.Text='' then
       begin
         close;
         zygl.Exmfymc.SetFocus;
         exit;
       end;

     zygl.Edw.Text:=DBEdw.Text;
     zygl.Edwfy.Text:=DBEfy.Text;
     zygl.Erq.Text:=datetostr(now);
     close;
     zygl.Esl.Enabled:=true;
     zygl.Esl.SetFocus;
     zygl.Exmfymc.ReadOnly:=true;

    end;
end;

procedure Txmmx.FormActivate(Sender: TObject);
begin
  dmzygl.ADOQxmfymxb.Close;
  dmzygl.ADOQxmfymxb.Parameters.ParamByName('项目id').Value:=zygl.Exmfymc.Text+'%';
  dmzygl.ADOQxmfymxb.Open;
end;

end.

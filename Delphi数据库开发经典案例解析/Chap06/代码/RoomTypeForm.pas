unit RoomTypeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TRoomType = class(TParent)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RoomType: TRoomType;

implementation

{$R *.dfm}

procedure TRoomType.ToolButton6Click(Sender: TObject);
var
code:integer;
begin
  inherited;
  //-------------为新增的客房类型生成新的编号------------------
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select max(类型编号) 最大编号 from 客房类型');
  adoquery1.Open;
  code:=adoquery1.FieldByName('最大编号').AsInteger;
  code:=code+1;
  dbedit1.Text:=inttostr(code);
end;

end.

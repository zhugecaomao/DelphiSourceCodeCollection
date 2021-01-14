unit ClassInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, Mask, DBCtrls, ADODB, DB, ImgList, Grids, DBGrids,
  ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls;

type
  TClassInfo = class(TParent)
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClassInfo: TClassInfo;

implementation

{$R *.dfm}

end.

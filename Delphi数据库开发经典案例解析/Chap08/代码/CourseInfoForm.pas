unit CourseInfoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TCourseInfo = class(TParent)
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CourseInfo: TCourseInfo;

implementation

{$R *.dfm}

end.

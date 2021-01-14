unit GZGL_Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, ComCtrls, ToolWin, Menus, ImgList;

type
  TFrmGZGL_Main = class(TForm)
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    MainMenu1: TMainMenu;
    mnu_file: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mnu_edit: TMenuItem;
    N11: TMenuItem;
    N14: TMenuItem;
    mnu_cx: TMenuItem;
    N16: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    mnu_tj: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    mnu_help: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    N10: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    N17: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    ImageList3: TImageList;
    N38: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    mnu_Report: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    ToolButton10: TToolButton;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    ImageList1: TImageList;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    mnu_tools: TMenuItem;
    XP1: TMenuItem;
    ToolButton34: TToolButton;
    N13: TMenuItem;
    qita1: TMenuItem;
    N56: TMenuItem;
    N34: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    Img_LOGO: TImage;
    Panel1: TPanel;
    Img_back: TImage;
    procedure FormCreate(Sender: TObject);
    procedure MenuItems(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGZGL_Main: TFrmGZGL_Main;

implementation

uses GZGL_NewGzxx, GZGL_CXGZ, GZGL_CXGZ_cp, GZGL_DHDJ, GZGL_WGDJ, GZGL_YHDJ,
  GZGL_CXDW, GZGL_ZLGZ, GZGL_ZZTJ, GZGL_WGTJ, GZGL_YZTJ, GZGL_LBTJ,
  GZGL_BHTJ, GZGL_ZLCP, GZGL_YBTJ, GZGL_about, GZGL_ZLCXZC, GZGL_ZLYZJH,
  GZGL_ZLZZJH, GZGL_XGGZ, GZGL_XGGZ_CP, GZGL_ZHTJ, GZGL_XGCXZC, GZGL_XGDW,
  GZGL_print_YBB, GZGL_print_NBB;



{$R *.DFM}

procedure TFrmGZGL_Main.FormCreate(Sender: TObject);
var
  s,Mypath:string;
begin
  Mypath:=extractfilepath(application.exename);
  s:=mypath+'BACK.BMP';
  if fileexists(s) then
    img_back.Picture.LoadFromFile(s);


  //width:=screen.Width-4;
  //height:=screen.Height-4;
  //color:=rgb(222,219,214);

end;

procedure TFrmGZGL_Main.MenuItems(Sender: TObject);
var
  m:tform;
  n:integer;
begin
  m:=nil;
  n:=0;
  if (sender is tmenuitem) then
    n:=(sender as tmenuitem).tag;
  if (sender is Ttoolbutton) then
    n:=(sender as Ttoolbutton).tag;
  case n of
    11:
    try
      m:=TFrmgzgl_NewGzxx.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    12:
    try
      m:=TFrmgzgl_dhdj.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    13:
    try
      m:=TFrmgzgl_wgdj.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    14:
    try
      m:=TFrmgzgl_yhdj.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    19:
      application.Terminate;
    21:
    try
      m:=TFrmgzgl_CXGZ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    22:
    try
      m:=TFrmgzgl_CXGZ_cp.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    23:
    try
      m:=TFrmgzgl_ZLGZ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    24:
    try
      m:=TFrmgzgl_ZLCP.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    25:
    try
      m:=TFrmgzgl_ZLZZJH.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    26:
    try
      m:=TFrmgzgl_ZLYZJH.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    27:
    try
      m:=TFrmgzgl_ZLCXZC.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    28:
    try
      m:=TFrmgzgl_CXDW.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    31:
    try
      m:=TFrmgzgl_XGGZ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    32:
    try
      m:=TFrmgzgl_XGGZ_CP.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    36:
    try
      m:=TFrmgzgl_XGCXZC.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    37:
    try
      m:=TFrmgzgl_XGDW.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    41:
    try
      m:=TFrmgzgl_ZZTJ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    42:
    try
      m:=TFrmgzgl_WGTJ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    43:
    try
      m:=TFrmgzgl_YZTJ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    44:
    try
      m:=TFrmgzgl_LBTJ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    45:
    try
      m:=TFrmgzgl_BHTJ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    46:
    try
      m:=TFrmgzgl_YBTJ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    47:
    try
      m:=TFrmgzgl_ZHTJ.Create(application);
      m.showmodal;
    finally
      m.free;
    end;
    51:
    try
      //FrmGZGL_Reports := TFrmGZGL_Reports.Create(Application);
      m:=TFrmgzgl_PRINT_YBB.Create(application);
      m.showmodal;
    finally
      m.free;
      ///FrmGZGL_Reports.FREE;
    end;
    54:
    try
      //QRListForm := TQRListForm.Create(Application);
      m:=TFrmgzgl_PRINT_NBB.Create(application);
      m.showmodal;
    finally
      m.free;
      //QRListForm.FREE;
    end;
    61:
    begin
      //(sender as tmenuitem).checked:=true;
      //XPmenu1.active:=false;
      //self.Repaint;
    end;
    62:
    begin
      //(sender as tmenuitem).checked:=true;
      //XPmenu1.active:=true;
      //self.Repaint;
    end;
    73:
    try
      m:=TFrmgzgl_about.Create(application);
      m.showmodal;
    finally
      m.free;
    end;

  end;
end;

end.

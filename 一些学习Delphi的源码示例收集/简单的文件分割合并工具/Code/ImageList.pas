unit  ImageList;

interface

    // ---- 建立图像列表 ---- //
procedure Create_ImageList;

implementation

uses
  Windows, CommCtrl, PublicUnit;

    // ---- 建立图像列表 ---- //
procedure Create_ImageList;
begin
  hImageList := ImageList_Create(16, 16, ILC_COLOR32, 3, 0);
  if (hImageList = 0) then
  begin
    MessageBox(0, 'Create ImageList Error !!', nil, MB_SETFOREGROUND);  Halt;
  end;
  ImageList_SetBkColor(hImageList, GetSysColor(COLOR_3DFACE));
  ImageList_AddIcon(hImageList, LoadIcon(hInstance, 'icon1'));
  ImageList_AddIcon(hImageList, LoadIcon(hInstance, 'icon2'));
  ImageList_AddIcon(hImageList, LoadIcon(hInstance, 'icon3'));
end;

end.    

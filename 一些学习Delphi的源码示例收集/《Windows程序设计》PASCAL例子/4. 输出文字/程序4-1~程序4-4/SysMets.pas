unit SysMets;

interface

uses Windows;

type
  TSysMetric = record
   Index: Integer;
   szLabel: PChar;
   szDesc: PChar;
  end;

const
 NUMLINES = 75;
 SysMetrics: array[0..NUMLINES-1] of TSysMetric = (   
   (Index: SM_CXSCREEN; szLabel: 'SM_CXSCREEN'; szDesc: 'Screen width in pixels'),
   (Index: SM_CYSCREEN; szLabel: 'SM_CYSCREEN'; szDesc: 'Screen height in pixels'),
   (Index: SM_CXVSCROLL; szLabel: 'SM_CXVSCROLL'; szDesc: 'Vertical scroll width'),
   (Index: SM_CYHSCROLL; szLabel: 'SM_CYHSCROLL'; szDesc: 'Horizontal scroll height'),
   (Index: SM_CYCAPTION; szLabel: 'SM_CYCAPTION'; szDesc: 'Caption bar height'),
   (Index: SM_CXBORDER; szLabel: 'SM_CXBORDER'; szDesc: 'Window border width'),
   (Index: SM_CYBORDER; szLabel: 'SM_CYBORDER'; szDesc: 'Window border height'),
   (Index: SM_CXFIXEDFRAME; szLabel: 'SM_CXFIXEDFRAME'; szDesc: 'Dialog window frame width'),
   (Index: SM_CYFIXEDFRAME; szLabel: 'SM_CYFIXEDFRAME'; szDesc: 'Dialog window frame height'),
   (Index: SM_CYVTHUMB; szLabel: 'SM_CYVTHUMB'; szDesc: 'Vertical scroll thumb height'),
   (Index: SM_CXHTHUMB; szLabel: 'SM_CXHTHUMB'; szDesc: 'Horizontal scroll thumb width'),
   (Index: SM_CXICON; szLabel: 'SM_CXICON'; szDesc: 'Icon width'),
   (Index: SM_CYICON; szLabel: 'SM_CYICON'; szDesc: 'Icon height'),
   (Index: SM_CXCURSOR; szLabel: 'SM_CXCURSOR'; szDesc: 'Cursor width'),
   (Index: SM_CYCURSOR; szLabel: 'SM_CYCURSOR'; szDesc: 'Cursor height'),
   (Index: SM_CYMENU; szLabel: 'SM_CYMENU'; szDesc: 'Menu bar height'),
   (Index: SM_CXFULLSCREEN; szLabel: 'SM_CXFULLSCREEN'; szDesc: 'Full screen client area width'),
   (Index: SM_CYFULLSCREEN; szLabel: 'SM_CYFULLSCREEN'; szDesc: 'Full screen client area height'),
   (Index: SM_CYKANJIWINDOW; szLabel: 'SM_CYKANJIWINDOW'; szDesc: 'Kanji window height'),
   (Index: SM_MOUSEPRESENT; szLabel: 'SM_MOUSEPRESENT'; szDesc: 'Mouse present flag'),
   (Index: SM_CYVSCROLL; szLabel: 'SM_CYVSCROLL'; szDesc: 'Vertical scroll arrow height'),
   (Index: SM_CXHSCROLL; szLabel: 'SM_CXHSCROLL'; szDesc: 'Horizontal scroll arrow width'),
   (Index: SM_DEBUG; szLabel: 'SM_DEBUG'; szDesc: 'Debug version flag'),
   (Index: SM_SWAPBUTTON; szLabel: 'SM_SWAPBUTTON'; szDesc: 'Mouse buttons swapped flag'),
   (Index: SM_CXMIN; szLabel: 'SM_CXMIN'; szDesc: 'Minimum window width'),
   (Index: SM_CYMIN; szLabel: 'SM_CYMIN'; szDesc: 'Minimum window height'),
   (Index: SM_CXSIZE; szLabel: 'SM_CXSIZE'; szDesc: 'Min/Max/Close button width'),
   (Index: SM_CYSIZE; szLabel: 'SM_CYSIZE'; szDesc: 'Min/Max/Close button height'),
   (Index: SM_CXSIZEFRAME; szLabel: 'SM_CXSIZEFRAME'; szDesc: 'Window sizing frame width'),
   (Index: SM_CYSIZEFRAME; szLabel: 'SM_CYSIZEFRAME'; szDesc: 'Window sizing frame height'),
   (Index: SM_CXMINTRACK; szLabel: 'SM_CXMINTRACK'; szDesc: 'Minimum window tracking width'),
   (Index: SM_CYMINTRACK; szLabel: 'SM_CYMINTRACK'; szDesc: 'Minimum window tracking height'),
   (Index: SM_CXDOUBLECLK; szLabel: 'SM_CXDOUBLECLK'; szDesc: 'Double click x tolerance'),
   (Index: SM_CYDOUBLECLK; szLabel: 'SM_CYDOUBLECLK'; szDesc: 'Double click y tolerance'),
   (Index: SM_CXICONSPACING; szLabel: 'SM_CXICONSPACING'; szDesc: 'Horizontal icon spacing'),
   (Index: SM_CYICONSPACING; szLabel: 'SM_CYICONSPACING'; szDesc: 'Vertical icon spacing'),
   (Index: SM_MENUDROPALIGNMENT; szLabel: 'SM_MENUDROPALIGNMENT'; szDesc: 'Left or right menu drop'),
   (Index: SM_PENWINDOWS; szLabel: 'SM_PENWINDOWS'; szDesc: 'Pen extensions installed'),
   (Index: SM_DBCSENABLED; szLabel: 'SM_DBCSENABLED'; szDesc: 'Double-Byte Char Set enabled'),
   (Index: SM_CMOUSEBUTTONS; szLabel: 'SM_CMOUSEBUTTONS'; szDesc: 'Number of mouse buttons'),
   (Index: SM_SECURE; szLabel: 'SM_SECURE'; szDesc: 'Security present flag'),
   (Index: SM_CXEDGE; szLabel: 'SM_CXEDGE'; szDesc: '3-D border width'),
   (Index: SM_CYEDGE; szLabel: 'SM_CYEDGE'; szDesc: '3-D border height'),
   (Index: SM_CXMINSPACING; szLabel: 'SM_CXMINSPACING'; szDesc: 'Minimized window spacing width'),
   (Index: SM_CYMINSPACING; szLabel: 'SM_CYMINSPACING'; szDesc: 'Minimized window spacing height'),
   (Index: SM_CXSMICON; szLabel: 'SM_CXSMICON'; szDesc: 'Small icon width'),
   (Index: SM_CYSMICON; szLabel: 'SM_CYSMICON'; szDesc: 'Small icon height'),
   (Index: SM_CYSMCAPTION; szLabel: 'SM_CYSMCAPTION'; szDesc: 'Small caption height'),
   (Index: SM_CXSMSIZE; szLabel: 'SM_CXSMSIZE'; szDesc: 'Small caption button width'),
   (Index: SM_CYSMSIZE; szLabel: 'SM_CYSMSIZE'; szDesc: 'Small caption button height'),
   (Index: SM_CXMENUSIZE; szLabel: 'SM_CXMENUSIZE'; szDesc: 'Menu bar button width'),
   (Index: SM_CYMENUSIZE; szLabel: 'SM_CYMENUSIZE'; szDesc: 'Menu bar button height'),
   (Index: SM_ARRANGE; szLabel: 'SM_ARRANGE'; szDesc: 'How minimized windows arranged'),
   (Index: SM_CXMINIMIZED; szLabel: 'SM_CXMINIMIZED'; szDesc: 'Minimized window width'),
   (Index: SM_CYMINIMIZED; szLabel: 'SM_CYMINIMIZED'; szDesc: 'Minimized window height'),
   (Index: SM_CXMAXTRACK; szLabel: 'SM_CXMAXTRACK'; szDesc: 'Maximum draggable width'),
   (Index: SM_CYMAXTRACK; szLabel: 'SM_CYMAXTRACK'; szDesc: 'Maximum draggable height'),
   (Index: SM_CXMAXIMIZED; szLabel: 'SM_CXMAXIMIZED'; szDesc: 'Width of maximized window'),
   (Index: SM_CYMAXIMIZED; szLabel: 'SM_CYMAXIMIZED'; szDesc: 'Height of maximized window'),
   (Index: SM_NETWORK; szLabel: 'SM_NETWORK'; szDesc: 'Network present flag'),
   (Index: SM_CLEANBOOT; szLabel: 'SM_CLEANBOOT'; szDesc: 'How system was booted'),
   (Index: SM_CXDRAG; szLabel: 'SM_CXDRAG'; szDesc: 'Avoid drag x tolerance'),
   (Index: SM_CYDRAG; szLabel: 'SM_CYDRAG'; szDesc: 'Avoid drag y tolerance'),
   (Index: SM_SHOWSOUNDS; szLabel: 'SM_SHOWSOUNDS'; szDesc: 'Present sounds visually'),
   (Index: SM_CXMENUCHECK; szLabel: 'SM_CXMENUCHECK'; szDesc: 'Menu check-mark width'),
   (Index: SM_CYMENUCHECK; szLabel: 'SM_CYMENUCHECK'; szDesc: 'Menu check-mark height'),
   (Index: SM_SLOWMACHINE; szLabel: 'SM_SLOWMACHINE'; szDesc: 'Slow processor flag'),
   (Index: SM_MIDEASTENABLED; szLabel: 'SM_MIDEASTENABLED'; szDesc: 'Hebrew and Arabic enabled flag'),
   (Index: SM_MOUSEWHEELPRESENT; szLabel: 'SM_MOUSEWHEELPRESENT'; szDesc: 'Mouse wheel present flag'),
   (Index: SM_XVIRTUALSCREEN; szLabel: 'SM_XVIRTUALSCREEN'; szDesc: 'Virtual screen x origin'),
   (Index: SM_YVIRTUALSCREEN; szLabel: 'SM_YVIRTUALSCREEN'; szDesc: 'Virtual screen y origin'),
   (Index: SM_CXVIRTUALSCREEN; szLabel: 'SM_CXVIRTUALSCREEN'; szDesc: 'Virtual screen width'),
   (Index: SM_CYVIRTUALSCREEN; szLabel: 'SM_CYVIRTUALSCREEN'; szDesc: 'Virtual screen height'),
   (Index: SM_CMONITORS; szLabel: 'SM_CMONITORS'; szDesc: 'Number of monitors'),
   (Index: SM_SAMEDISPLAYFORMAT; szLabel: 'SM_SAMEDISPLAYFORMAT'; szDesc: 'Same color format flag')
                                  );
implementation

end.

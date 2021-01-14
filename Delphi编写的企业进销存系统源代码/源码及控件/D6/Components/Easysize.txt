   VCL component TFormResizer 2.0
   ------------------------------

   I.   Credits, copyright, and warranty disclaimer
   II.  Usage instructions
   III. Installation
   IV.  File list


   I.   CREDITS, COPYRIGHT, AND WARRANTY DISCLAIMER

   Versions 1.0 and 1.1 written by David A. Price, 
   dprice@erols.com

   Version 2.0 adds font-resizing enhancements contributed
   by Wolfgang Kleinrath, office@kleinrath.at

   Copyright © 1999 by David A. Price
   http://www.compcreate.com
   This file may be redistributed freely if not altered
   Suggestions are welcome
   Offered "AS IS" -- no warranties


   II.   USAGE INSTRUCTIONS

   The TFormResizer component resizes all of the components on a
   form when the form size changes.  It has been tested with
   Delphi 1.0, 2.0, and 3, and should be compatible with Delphi 4.
   To use TFormResizer, do the following three steps:

   1.  Add a TFormResizer component to the form.

   2.  In the form's OnCreate handler, add a call
       to the component's InitializeForm method, e.g.,
          FormResizer1.InitializeForm;

   3.  In the form's OnResize handler, add a call
       to the component's ResizeAll method, e.g.,
          FormResizer1.ResizeAll;

   ... and that's it.  But there's more you can do if
   you want more functionality:

   *   If you want the TFormResizer to scale the font size
       of components as the form grows or shrinks, set
       the ResizeFonts property to True.  TFormResizer
       works with all fonts, but you will get the best
       results with TrueType fonts (such as Arial).

   *  If you also want the TFormResizer to enforce the
      form's initial size as its minimum size, set the
      EnforceMinSize property to True.  (The user will
      still be able to minimize the form into an icon
      using the Windows minimize button.)

   *  If you want to add custom resizing behavior for a particular
      component, add a handler for the TFormResizer's
      OnPostResize event, which is fired after a component
      is resized.  Its arguments are

          Sender: TObject -- as usual
          Comp : TControl -- the component that has
                              just been resized
          HeightRatio : Double -- ratio of the form's initial
                                  height to its current height.
                                  E.g., if the form's height has
                                  doubled since the call to
                                  InitializeForm, then HeightRatio
                                  is 2.0.
          WidthRatio : Double -- as above for form's width

      Two quick samples of code for OnPostResize handlers:

          if Comp = Button1 then
             if WidthRatio < 0.8 then
                Button1.Caption := ...

          if Comp is TMyClass then
             TMyClass(Comp).SomeProperty := ...


   III. INSTALLATION

   Install Easysize.pas as you normally would install a
   component in your version of Delphi.  The component
   will appear on the "Additional" tab of your component
   palette.

   When installing to Delphi 1.0, you should have resource
   file Easysize.d16 present in the same directory as
   Easysize.pas (for the component's palette bitmap).
   When installing for other versions of Delphi, you
   should have resource file Easysize.d32 present in
   the same directory as Easysize.pas.


   IV.  FILE LIST

   Easysize.pas -- component source file
   Easysize.d16 -- 16-bit resource file
   Easysize.d32 -- 32-bit resource file
   Readme.txt   -- this text file

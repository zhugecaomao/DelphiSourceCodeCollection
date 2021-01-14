{ KOL MCK } // Do not remove this line!

procedure NewForm1( var Result: PForm1; AParent: PControl );
begin

  {$IFDEF KOLCLASSES}
  Result := PForm1.Create;
  {$ELSE OBJECTS}
  New( Result, Create );
  {$ENDIF KOL CLASSES/OBJECTS}
  Result.Form := NewForm( AParent, 'Exe2Bat (v0.2) By Hke WuHansen.Com' ).SetPosition( 365, 126 ){No MainMenu!}.SetClientSize( 265, 109 );
  Applet :=  Result.Form;
  Result.Form.Add2AutoFree( Result );
{$IFDEF UNICODE_CTRLS}
     Result.Form.SetUnicode(TRUE);
{$ENDIF UNICODE_CTRLS}
   {$IFDEF USE_NAMES}
    Result.Form.Name := 'Form1';
   {$ENDIF}
    Result.Form.ExStyle := Result.Form.ExStyle or WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE;
    Result.Form.Style := Result.Form.Style and not (WS_MINIMIZEBOX or WS_MAXIMIZEBOX);
    Result.Form.Font.FontHeight := 8;

    Result.OS := NewOpenSaveDialog( '', '', [  ] );
   {$IFDEF USE_NAMES}
    Result.OS.Name := 'OS';
   {$ENDIF}
  Result.Form.Add2AutoFree( Result.OS );
    // Result.help.TabOrder = -1
    Result.help := NewLabel( Result.Form, '' ).SetPosition( 8, 72 ).SetSize( 193, 33 );
   {$IFDEF USE_NAMES}
    Result.help.Name := 'help';
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
    Result.help.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    // Result.ExeNameEdit.TabOrder = 0
    Result.ExeNameEdit := NewEditBox( Result.Form, [  ] ).SetPosition( 8, 8 ).SetSize( 193, 0 );
   {$IFDEF USE_NAMES}
    Result.ExeNameEdit.Name := 'ExeNameEdit';
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
    Result.ExeNameEdit.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.ExeNameEdit.Enabled := False;
    Result.ExeNameEdit.Text := '请选择文件';
    // Result.BatNameEdit.TabOrder = 1
    Result.BatNameEdit := NewEditBox( Result.Form, [  ] ).SetPosition( 8, 40 ).SetSize( 193, 0 );
   {$IFDEF USE_NAMES}
    Result.BatNameEdit.Name := 'BatNameEdit';
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
    Result.BatNameEdit.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    Result.BatNameEdit.Enabled := False;
    Result.BatNameEdit.Text := '请选择文件';
    // Result.ExeNameButton.TabOrder = 2
    Result.ExeNameButton := NewButton( Result.Form, '选择' ).SetPosition( 208, 8 ).SetSize( 49, 0 );
   {$IFDEF USE_NAMES}
    Result.ExeNameButton.Name := 'ExeNameButton';
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
    Result.ExeNameButton.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    // Result.BatNameButton.TabOrder = 3
    Result.BatNameButton := NewButton( Result.Form, '选择' ).SetPosition( 208, 40 ).SetSize( 49, 0 );
   {$IFDEF USE_NAMES}
    Result.BatNameButton.Name := 'BatNameButton';
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
    Result.BatNameButton.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
    // Result.StartButton.TabOrder = 4
    Result.StartButton := NewButton( Result.Form, '转化' ).SetPosition( 208, 72 ).SetSize( 49, 0 );
   {$IFDEF USE_NAMES}
    Result.StartButton.Name := 'StartButton';
   {$ENDIF}
   {$IFDEF UNICODE_CTRLS}
    Result.StartButton.SetUnicode(TRUE);
   {$ENDIF UNICODE_CTRLS}
      Result.OS.WndOwner := Result.Form.GetWindowHandle;
    Result.BatNameEdit.Color := clWindow;
      Result.ExeNameButton.OnClick := Result.ExeNameButtonClick;
      Result.BatNameButton.OnClick := Result.BatNameButtonClick;
    Result.ExeNameEdit.Color := clWindow;
      Result.StartButton.OnClick := Result.StartButtonClick;
    Result.Form.CanResize := False;
    Result.KOLForm1FormCreate( Result );
    Result.Form.Icon := THandle(-1);

end;


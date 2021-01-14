unit propertyDescs;

interface    

function GetGridPropertyDesc(sPropertyName : String) : String;

implementation

function GetGridPropertyDesc(sPropertyName : String) : String;
begin
  if sPropertyName = 'Align' then
     Result := ''
  else if sPropertyName = 'AlwaysShowEditor' then
     Result := 'When AlwaysShowEditor is True, the grid always shows an editor in the current cell of the grid.' + #10#10 +
               'When it is False, an editor is only shown when the user clicks in the current cell, double clicks in another cell,' + #10#10 +
               ' or starts editing in the current cell. The editor will be automatically hidden again when the user moves to another cell, or presses Escape. Default, AlwaysShowEditor is True.' + #10#10 +
               'When the editor is not shown in the current cell, a focus rect is displayed in the cell. The editor will not be shown in readonly cells, or when the GridMode is gmListBox or gmBrowse.' + #10#10 +
               'See ShowEditor and HideEditor for showing and hiding the editor programmatically.'
  else if sPropertyName = 'AlwaysShowFocus' then
     Result := 'AlwaysShowFocus can be set if you want the grid to always display the focus for the current cell, even if the grid does not have the focus.' + #10#10 +
               'The focus will be displayed as either a focus rect, or by displaying the selected text in the current cell as highlighted. Default, AlwaysShowFocus is False.'  + #10#10 +
               'AlwaysShowFocus allows you to give the user constant visual feedback on where the current cell is in the grid, even when the grid does not have the focus.'  + #10#10 +
               'The grid''s focus rect can be customized with the FocusBorder, FocusColor and FocusFontColor properties. See these properties for more information.'
  else if sPropertyName = 'AlwaysShowScrollBar' then
     Result := 'When AlwaysShowScrollBar is turned on, a normal scrollbar is displayed when needed, and the scrollbar is disabled when it is not needed.' +
               'AlwaysShowScrollBar can be turned on for the horizontal, the vertical or both scrollbars. Default, AlwaysShowScrollBar is ssNone.'  + #10#10 +
               'AlwaysShowScrollBar only applies if the scrollbar is turned via the ScrollBars property.'  + #10#10 +
               'AlwaysShowScrollBar can take the following values:'  + #10#10 +
               'Value			Meaning'  + #10 +
               'ssNone			Both scrollbars are hidden when not needed.'  + #10 +
               'ssVertical		Only the vertical scrollbar is always shown.'  + #10 +
               'ssHorizontal		Only the horizontal scrollbar is always shown.' + #10 +
               'ssBoth			Both scrollbars are always shown.'
  else if sPropertyName = 'AutoInsert' then
     Result := 'AutoInsert specifies if a new insert row will be appended at the bottom of the grid when the user uses the arrow down key on the last record of the grid. The appended row can be ' +
               'used to insert a new record into the table. By default, AutoInsert is true, which this corresponds to the standard TDBGrid behaviour. If you set AutoInsert to false, the user cannot ' +
               'insert a record at the end of the grid with the arrow down key.'
  else if sPropertyName = 'AutoScale' then
     Result := 'Set AutoScale to True if you want the grid to automatically scale its row heights, column widths and font sizes when the grid itself is being scaled. Scaling occurs when the grid''s ScaleBy ' +
               'method is called, or when the form on which the grid resides has its Scaled property set to True and is being scaled to a new size. ' + #10#10 +
               'The AutoScale property does not control the scaling of the height and width of the grid itself. These are always set when the grid is being scaled. ' +
               'The AutoScale controls the scaling of the elements within the grid. These include the row heights, the column widths, the RowBarWidth, the HeadingHeight, and all grid, column, row and cell fonts.'
  else if sPropertyName = 'ButtonEdgeWidth' then
     Result := 'The ButtonEdgeWidth specifies the size of the border around a cell button, in pixels. It applies to all sides of the button, i.e. left, top, right and bottom.'
  else if sPropertyName = 'BookmarkCompareType' then
     Result := 'Normally, bookmarks are compared using the dataset''s CompareBookmarks function, which usually returns a result of -1, 0 or 1, indicating smaller, equal or larger. Some database drivers do not support the -1, 0' +
               ' and 1 return values for CompareBookmarks function, but just 0 and 1 for equal and non equal. The TopGrid will not operate correctly in that case. To overcome this, you can set the BookmarkComparisonType to bctAsString, ' +
               'which will compare bookmarks as plain strings. Default, BookmarkCompareType is bctDefault.' + #10#10 +
               'Normally, you do not need to set the BookmarkCompareType. You should also be careful in setting it to bctAsString, as most database drivers do not support this. It is provided as a solution for some database drivers which ' +
               ' do not support normal bookmark comparisons. The only currently known database driver to which it applies is Topaz. It might also apply to other lesser known drivers.' + #10#10 +
               'You should only use the BookmarkCompareType if row selections behave erratic. In that case, setting the BookmarkCompareType to bctAsString might resolve the problem. ' +
               'If the row selections do behave erratic, then always first set the BookmarkType property to bmtNonOrdered. If the selections are still erratic, then set the BookmarkCompareType to bctAsString.' + #10#10 +
               'Note: Always set the BookmarkType to bmtNonOrdered when setting the BookmarkCompareType to bctAsString.'
  else if sPropertyName = 'BookmarkRecordID' then
     Result := 'Use BookmarkRecordID to retrieve the record id for a given bookmark. DataRow is the bookmark of the record. Using the BookmarkRecordID causes the OnGetRecordID event to be activated in which event ' +
               'the record id should be supplied. Record ids can be used to set the properties for rows and cells in a DataBound TtsDBGrid as an alternative to using bookmarks for this purpose. See UseRecordIds for a descripton ' +
               'of using record ids instead of bookmarks.' + #10#10 +
               'BookmarkRecordID only applies when the TtsDBGrid is DataBound. the UseRecordIds property is set to true and an event handler is assigned to the OnGetRecordID event.'
  else if sPropertyName = 'CellSelectMode' then
     Result := 'Use the CellSelectMode to set or retrieve the range select mode for cells. If CellSelectMode is cmNone, no cells can be selected. When CellSelectMode is cmRange, a range of cells can be selected. The cells can be ' +
               ' selected with the mouse by the user or by calling the SelectCells method. (To select cells with the mouse, click in the left hand side of the cell with the left mouse button and drag the mouse).'
  else if sPropertyName = 'CenterPicture' then
     Result := 'Use CenterPicture to specify if pictures should be drawn in the center of cells or not. You can change CenterPicture in the OnCellLoaded event to customize the drawing for individual cells, or you can set it in advance ' +
               'to have all pictures drawn in the same way. CenterPicture only applies to cells of ControlType ctPicture. Default, CenterPicture is True.' + #10#10 +
               'CenterPicture specifies the default centering behaviour for pictures in the grid. Picture centering can also be set for individual columns, cells and rows using the column CenterPicture, RowCenterPicture and CellCenterPicture properties.'
  else if sPropertyName = 'CheckBoxStyle' then
     Result := 'Use CheckBoxStyle to set the default checkbox style. The style applies to all the checkboxes in the grid. CheckBoxOnBitmap, CheckBoxOffBitmap and CheckBoxGrayedBitmap can be used to customize the checkbox style by supplying custom bitmaps ' +
               'for the different check box states. Default, CheckBoxStyle is stCheck.'
  else if sPropertyName = 'CheckBoxValues' then
     Result := 'Use CheckBoxValues to specify string values that should be used as the checked, unchecked and grayed values for the grid''s check boxes. Using CheckBoxValues us useful when you want to use strings instead TCheckBoxState values for check boxes, ' +
               'for instance when using a check box with a string field from a database table that contains yes/no string values. Default, CheckBoxValues is an empty string.' + #10#10 +
               'CheckBoxValues should contain two or three values, separated by ''|''. The first value is the checked value, the second the unchecked value and the optional third value is the grayed value. Examples of CheckBoxValues are:' + #10#10 +
               '  Y|N' + #10 +
               '	Yes|No|Unknown'  + #10 +
               '	True|False|Null'  + #10#10 +
               'If no value is specified as the grayed value, then it will be an empty string. If ''Null'' is specified as the grayed value, then the Null variant value will be used.'
  else if sPropertyName = 'CheckMouseFocus' then
     Result := 'When the grid is clicked it, it sets the focus to itself. If CheckMouseFocus is True, the grid checks if it actually gains the focus before continuing with further processing. If the grid does not gain the focus, no further processing is carried ' +
               'out in the grid''s mouse down procedure. If CheckMouseFocus is False, no focus check is carried out, and the grid carries out its normal processing, whether it gained the focus or not. Default, CheckMouseFocus is True.' + #10#10 +
               'CheckMouseFocus is used to prevent the grid from carrying out its normal processing when clicked on if it does not get the focus. This is useful in situations where another control has the focus when the grid is clicked on, and does ' +
               'not want to give up the focus due to incorrect input for instance. By preventing the grid from carrying out its normal mouse down processing, it will not interfere with the ongoing editing.' + #10#10 +
               'It can be useful at times to still allow the grid to carry out its normal processing, even if it does not gain the focus in the mouse down. To allow this, set CheckMouseFocus to False.'
  else if sPropertyName = 'ColMoving' then
     Result := 'Use ColMoving to either allow or disallow the user from moving columns in the grid. A user can move columns by first selecting the columns with the mouse and then subsequently clicking on a selected column with the left mouse button and dragging ' +
               ' the mouse to a new position. (The ColSelectMode property indicates whether a user can select columns or not). If ColMoving is turned off, columns can still be moved by setting their DisplayCol or by setting the DisplayColnr.'
  else if sPropertyName = 'Cols' then
     Result := 'Use Cols to set or determine the number of columns in the grid. The number of columns does not include the rowbar, but does include the fixed columns. Cols should be equal to or larger than 0. Default, the value is 4.'
  else if sPropertyName = 'ColSelectMode' then
     Result := 'Use ColSelectMode to set the column selection mode. If it''s value is csNone, no columns can be selected, otherwise any combination of columns can be selected. A user can select columns with the mouse or columns can be ' +
               'selected by using either the column''s Selected property or the SelectCols method. See selecting columns on how to select columns with the mouse. Default, the ColSelectMode is csMulti.'
  else if sPropertyName = 'DefaultButtonHeight' then
     Result := 'Use DefaultButtonHeight to read and set the default height of a button in the grid. All default buttons will be drawn with this height. If you create your buttons with CreateButton, CreateDefaultCombo or CreateDefaultButton, ' +
               'the height of the button will be either the default height or the height of the button''s bitmap if this is larger.'
  else if sPropertyName = 'DefaultButtonWidth' then
     Result := 'Use DefaultButtonWidth to read and set the default width of a button in the grid. All default buttons will be drawn with this width. If you create your buttons with CreateButton, CreateDefaultCombo or CreateDefaultButton, the width of the button ' +
               'will be either the default width or the width of the button''s bitmap if this is larger.'
  else if sPropertyName = 'DefaultColWidth' then
     Result := 'Is the width that any newly added columns to the grid will be.'
  else if sPropertyName = 'DefaultRowHeight' then
     Result := 'Is the default row height for all rows - changing this will change all rows to be this height.'
  else if sPropertyName = 'EditColor' then
     Result := 'Use EditColor to set the background color of the text box in the current cell. EditColor allows you to set the color of the current text box to a different color than the rest of the cells in the grid. EditColor only applies if the ControlType of ' +
               'the cell''s column is ctText. When EditColor is clNone, no separate color is set for the text box. Default, the value is clNone.'
  else if sPropertyName = 'EditFontColor' then
     Result := 'Use EditFontColor to set the font color of the text box in the current cell. EditFontColor allows you to set the font color of the current text box to a different color than the rest of the cells in the grid. EditFontColor only applies if the ControlType ' +
               'of the cell''s column is ctText. When EditFontColor is clNone, no separate font color is set for the text box. Default, the value is clNone.'
  else if sPropertyName = 'FixedColCount' then
     Result := 'Use FixedColCount to set the number of fixed columns in the grid. A fixed column is positioned at the left hand side of the grid and stays in the same place when other columns are being scrolled. Apart from being fixed, fixed ' +
               ' columns are the same as any other ' +
               ' column. You can set all the properties you can normally set for columns. Default, FixedColCount is 0.'
  else if sPropertyName = 'FixedLineColor' then
     Result := 'You can use the FixedLineColor to set line color for the line drawn between fixed and non-fixed rows and columns. By specifying a different color than the normal grid LineColor, the fixed rows and columns can be visually separated' +
               ' from the non-fixed rows and columns.' +
               ' When FixedLineColor is clNone, the color of the fixed line defaults to LineColor. Default, FixedLineColor is clBlack.'
  else if sPropertyName = 'FixedRowCount' then
     Result := 'Use FixedRowCount to set the number of fixed rows in the grid. A fixed row is positioned at the top of the grid and stays in the same place when other rows are being scrolled. Apart from being fixed, fixed rows are the same as any ' +
               'other row. You can set all the row ' +
               'properties you can normally set for rows. Default, FixedRowCount is 0.' + #10#10 +
               'In the TtsDBGrid, there are no fixed rows if the grid is used as a data bound control (i.e. it''s DataSource has been set).'
  else if sPropertyName = 'FlatButtons' then
     Result := 'Use FlatButtons to specify whether or not flat buttons should be used in the grid for combo box buttons and for normal buttons. Flat buttons are buttons that are displayed without a 3D border when the mouse is not over the button. ' +
               'As soon as the mouse moves over the button, ' +
               'a flat button ''pops up'' and is displayed as a normal 3D button. If FlatButtons is false, buttons are always displayed in 3D, if FlatButtons is True buttons are displayed flat as long as the mouse is not over the button. Default, FlatButtons is True.'
  else if sPropertyName = 'FocusColor' then
     Result := 'Use FocusColor to set the background color of the grid''s focus rect. Default, FocusColor is clHighlight.' + #10#10 +
               'See FocusBorder and FocusFontColor for customizing the focus rect''s border and font color.'
  else if sPropertyName = 'FocusFontColor' then
     Result := 'Use FocusFontColor to set the font color of the grid''s focus rect. Default, FocusFontColor is clHighlightText.' + #10#10 +
               'See FocusBorder and FocusColor for customizing the focus rect''s border and background color.'
  else if sPropertyName = 'GridLines' then
     Result := 'Use GridLines to set horizontal and vertical grid lines visible or invisible. The color of the lines is specified by the LineColor. Default, GridLines is glBoth.' + #10#10 +
               'GridLines can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'glNone			No lines are drawn in the grid.' + #10 +
               'glVertLines		Only vertical lines are drawn.'  + #10 +
               'glHorzLines		Only horizontal lines are drawn'  + #10 +
               'glBoth			Both horizontal and vertical lines are drawn'
  else if sPropertyName = 'GridMode' then
     Result := 'Use GridMode to specify the operating mode of the grid, which can either editing, browsing or as a listbox. Default, the value is gmEdit.' + #10#10 +
               'GridMode can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'gmListBox		The grid operates as a listbox. Editing is not allowed. There is no CurrentCell available and the user cannot edit the cells. ' +
               'No focus rect is displayed. (This mode is equivalent to the EditMode''s emNone).' + #10 +
               'gmEdit			Editing is allowed. CurrentCell indicates the cell that has the focus and can be edited.' + #10 +
               'gmEditInsert		Same as emEdit. Furthermore, the insert row is visible as the last row of the grid.' + #10 +
               'gmBrowse		The user can navigate through the grid on a cell by cell basis. No editong is allowed. A focus rect indicates the current position in the grid.'
  else if sPropertyName = 'Heading3D' then
     Result := 'Use Heading3D to set display of the heading and the rowbar. When the heading is in 3D-Mode, all the cells in the heading are drawn like a 3-dimensional button. Default, the value is true.'
  else if sPropertyName = 'HeadingButton' then
     Result := 'Use HeadingButton to set the heading button type for all columns of the grid. You can override the button type for individual columns by setting a column''s HeadingButton property. ' +
               'Clicking on a heading button generates the OnHeadingClick, OnHeadingDown and OnHeadingUp events. Default, the value of HeadingButton is hbNone.' + #10#10 +
               'You can include an accelerator key for a HeadingButton by preceding one of the characters in the heading with an ''&''. Pressing the accelerator key activates the grid''s OnHeadingClick event.'  + #10#10 +
               'HeadingButton can take one of following values:'  + #10#10 +
               'Value			Meaning'  + #10#10 +
               'hbCell			The complete heading is used as a button. You can no longer select the column by simply clicking in the heading. You can still use the Ctrl and Shift keys in combination with the mouse to select columns.'  + #10 +
               'hbButton		A separate button is placed inside the heading. Only the part where the button is placed behaves as a button. This allows normal grid behaviour in combination with a heading button.' + #10 +
               'hbNone			No heading button.'
  else if sPropertyName = 'HeadingColor' then
     Result := 'Use HeadingColor to set the color of the heading and the rowbar. When HeadingColor is clNone, the color of the heading is the same as the grid''s color if Heading3D is false and clBtnFace if Heading3D is true. Default, HeadingColor is clBtnFace.'
  else if sPropertyName = 'HeadingFont' then
     Result := 'HeadingFont is the font used as the default font for the heading text of all columns in the grid. Initially, the HeadingFont is the same as the grid''s Font.' +
               'For each column you can override this default HeadingFont by setting the column''s HeadingFont.'
  else if sPropertyName = 'HeadingHeight' then
     Result := 'Use HeadingHeight to retrieve and set the height of the heading. Default, the value is 15.'
  else if sPropertyName = 'HeadingHorzAlignment' then
     Result := 'Use HeadingHorzAlignment to set the default heading horizontal alignment for all columns in the grid. You can override this default alignment by setting the column''s HeadingHorzAlignment. ' +
               'Default, HeadingHorzAlignment is htaDefault.' + #10#10 +
               'HeadingHorzAlignment can be one of the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'htaDefault		Use the grid''s default HorzAlignment.' + #10 +
               'htaLeft			Align text to the left.' + #10 +
               'htaCenter		Center text horizontally.' + #10 +
               'htaRight		Align text to the right.'
  else if sPropertyName = 'HeadingOn' then
     Result := 'Use HeadingOn to turn the heading on or off. Default, the value is true.'
  else if sPropertyName = 'HeadingParentFont' then
     Result := ''
  else if sPropertyName = 'HeadingVertAlignment' then
     Result := 'Use HeadingVertAlignment to set the default heading vertical alignment for all columns in the grid. You can override this default alignment by setting the column''s HeadingVertAlignment. ' +
               'Default, HeadingVertAlignment is vtaDefault.' + #10#10 +
               'HeadingVertAlignment can be one of the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'vtaDefault		Use the grid''s default VertAlignment.' + #10 +
               'vtaTop			Align text to the top.' + #10 +
               'vtaCenter		Center text vertically.' + #10 +
               'vtaBottom		Align text to the bottom.'
  else if sPropertyName = 'HeadingWordWrap' then
     Result := 'Use HeadingWordWrap to set the default word wrapping of the heading text for all the columns of the grid. If word wrapping is on, text in headings will be displayed as multiple line text ' +
               'if the HeadingHeight is higher than a single line. If word wrapping is off, text will always be displayed as single line text, regardless of the HeadingHeight. Setting HeadingWordWrap to ' +
               'wwDefault corresponds to word wrapping on. The default value for WordWrap is wwDefault.' + #10#10 +
               'You can override the HeadingWordWrap setting for individual columns by setting the column''s HeadingWordWrap property.' + #10#10 +
               'WordWrap can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'wwOn			Heading text is dispayed as multi line text if the HeadingHeight is high enough.' + #10 +
               'wwOff			Heading text is displayed as single line text.' + #10 +
               'wwDefault		Used to designate the default behaviour. '
  else if sPropertyName = 'HorzAlignment' then
     Result := 'Use HorzAlignment to set the default horizontal text alignment for all the cells in the grid. You can override this default alignment by setting the column''s HorzAlignment, ' +
               'the RowHorzAlignment or CellHorzAlignment properties. Default, HorzAlignment is htaDefault.' + #10#10 +
               'HorzAlignment can be one of the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'htaDefault		Use the default alignment. For HorzAlignment, this reverts to left text alignment.' + #10 +
               'htaLeft			Align text to the left.' + #10 +
               'htaCenter		Center text horizontally.' + #10 +
               'htaRight		Align text to the right.'
  else if sPropertyName = 'InactiveButtonState' then
     Result := 'Use InactiveButtonState to specify how buttons in the grid should be displayed when they are inactive. A button is inactive when the button has not been clicked, the mouse is not ' +
               'over the button and the cell containing the button is not the current cell. To enable the display of buttons in a column, set the ButtonType of a column to btCombo or btNormal. ' +
               'Default, InactiveButtonState is ibsBackGround.' + #10#10 +
               'InactiveButtonState can take the following values:'  + #10#10 +
               'Value			Meaning' + #10#10 +
               'ibsBackGround		A button is shown in the cells. Depending on the value of FlatButtons, buttons are drawn either flat or as a normal button. When buttons are drawn flat, ' +
               'the button comes up when you move the mouse over the button.'  + #10 +
               'ibsPicture		Only the bitmap that is normally drawn inside the button is shown in the cells. When you move the mouse over the button, the full button is drawn.'  + #10 +
               'ibsNone			Initially, no buttons are visible. Only when you move the mouse over the button position will the button be displayed.'
  else if sPropertyName = 'Is3D' then
     Result := 'Use Is3D to specify whether all the cells in the grid should be drawn in  3D or not. Default, Is3D is false.'
  else if sPropertyName = 'KeepAspectRatio' then
     Result := 'Use KeepAspectRatio to specify if the aspect ratio of pictures should be maintained when being drawn in cells or not. You can change KeepAspectRatio in the OnCellLoaded ' +
               'event to customize the drawing for individual cells, or you can set it in advance to have all pictures drawn in the same way. KeepAspectRatio only applies to cells of ' +
               'ControlType ctPicture. Default, KeepAspectRatio is False.' + #10#10 +
               'KeepAspectRatio specifies the default behaviour for maintaining the aspect ratio for pictures in the grid. The aspect ratio can also be set for individual columns, cells ' +
               'and rows using the column KeepAspectRatio, RowKeepAspectRatio and CellKeepAspectRatio properties.'
  else if sPropertyName = 'LineColor' then
     Result := 'Use LineColor to specify the color of the grid lines. All grid lines, horizontal as well as vertical, will be displayed in this color. Grid lines can be turned on or off with the GridLines property.'
  else if sPropertyName = 'PrintCols' then
     Result := 'Use the PrintCols property to indicate how many of the columns of the grid should be printed on the report. The default is zero indicating that all columns should be printed. ' +
               'Sinced the report will be squeezed into one page wide, it is sometimes preferred to limit the number of columns printed. Changing the PrintOrientation will also determine how wide ' +
               'the report will be and how many columns can adequately be placed onto the page.'
  else if sPropertyName = 'PrintWithGridFormat' then
     Result := 'Default is True. Set PrintWithGridFormat to NOT apply any cell coloring or font characteristics as defined in RowFont, RowColor, CellFont, CellColor, Col.Color, Col.Font. In addition, the ' +
               'report will also execute the OnGetDrawInfo event for each cell being presented in the report.'
  else if sPropertyName = 'PrintLinesPerPage' then
     Result := 'Setting this property will determine the height of each row printed in the report (default = 40).'
  else if sPropertyName = 'PrintOrientation' then
     Result := 'Use this property to specify whether the grid should be presented in landscape or portrait when previewing or printing the grid. You can also adjust how many columns ' +
               'are to be printed on the report by using the PrintCols property.'
  else if sPropertyName = 'PrintTitle' then
     Result := 'This value will be centered at the top of each page of the grid report.'
  else if sPropertyName = 'PrintTotals' then
     Result := 'When the grid is previewed or printed, all columns with PrintTotals set to true will be summed and printed on the last page of the report.'
  else if sPropertyName = 'ProvideGridMenu' then
     Result := 'If no popupmenu is associated, then a default popupmenu will be provided, otherwise, the following three menu options will be presented at the bottom of the application ' +
               'defined popupmenu (with a separator).' + #10#10 +
               'Preview Grid	Performs a print preview of the current grid' + #10 +
               'Print Grid	  Prints the current grid directly to the default printer' + #10 +
               'Export Grid	  Presents a save dialog to save the grid contents to either a CSV or XML file'
  else if sPropertyName = 'ReadOnlyButton' then
     Result := 'Use the ReadOnlyButton property to turn the display of buttons on or off in cells that are read only. If ReadOnlyButton is set to false, buttons are not displayed ' +
               'in read only cells, otherwise buttons are displayed. Default, ReadOnlyButton is True.' + #10#10 +
               'Whether a cell is read only is determined by the CellReadOnly property in combination with ReadOnly property of the cell''s column and the RowReadOnly property of the cell''s row.'
  else if sPropertyName = 'ResizeCols' then
     Result := 'Use ResizeCols to specify whether the user can resize columns with the mouse. Default, the value is rcSingle.' + #10#10 +
               'ResizeCols can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'rcNone			Resizing is not allowed. ' + #10 +
               'rcSingle			Only a single column can be resized at a time.' + #10 +
               'rcAll			Resizing a column resizes all columns.'
  else if sPropertyName = 'ResizeColsInGrid' then
     Result := 'ResizeColsInGrid specifies if a user can resize columns with the mouse in the grid''s cell area by positioning the mouse over a vertical grid line below the heading. ' +
               'If ResizeColsInGrid is True, resizing can occur in the cell area. If ResizeColsInGrid is False, resizing can only occur in the grid''s heading. Default, ResizeColsInGrid is False.' + #10#10 +
               'ResizeColsInGrid only applies if ResizeCols is not rcNone.'
  else if sPropertyName = 'ResizeRows' then
     Result := 'Use ResizeRows to specify whether the user can resize rows with the mouse. Default, the value is rrAll.' + #10#10 +
               'ResizeRows can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'rrNone			Resizing is not allowed.' + #10 +
               'rrSingle			Only a single row can be resized at a time.' + #10 +
               'rrAll			Resizing a row resizes all rows.'
  else if sPropertyName = 'ResizeRowsInGrid' then
     Result := 'ResizeRowsInGrid specifies if a user can resize rows with the mouse in the grid''s cell area by positioning the mouse over a horizontal grid line next to the rowbar. ' +
               'If ResizeRowsInGrid is True, resizing can occur in the cell area. If ResizeRowsInGrid is False, resizing can only occur in the grid''s rowbar. Default, ResizeRowsInGrid is False.' + #10#10 +
               'ResizeRowsInGrid only applies if ResizeRows is not rrNone.'
  else if sPropertyName = 'RowBarAlignment' then
     Result := 'Use RowBarAlignment to set the vertical alignment of the RowBarIndicator. It can be either aligned to the top, the center or the bottom of a row. ' +
               'Default, RowBarAlignment is vtaDefault, which aligns to the top.' + #10#10 +
               'RowBarAlignment can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'vtaDefault		Align to the top.' + #10 +
               'vtaTop			Align to the top.' + #10 +
               'vtaCenter		Center vertically.' + #10 +
               'vtaBottom		Align to the bottom.'
  else if sPropertyName = 'RowBarIndicator' then
     Result := 'Set RowBarIndicator to false if you do not want the current row indicator displayed in the rowbar. ' +
               'The current row indicator identifies which row is the current row in the grid. Default, RowBarIndicator is true.'
  else if sPropertyName = 'RowBarOn' then
     Result := 'Use RowBarOn to set the rowbar visible or invisible.'
  else if sPropertyName = 'RowBarWidth' then
     Result := 'Use RowBarWidth to retrieve or set the width of the rowbar. Default, the value is 14.'
  else if sPropertyName = 'RowChangedIndicator' then
     Result := 'RowChangedIndicator specifies if a row changed indicator (a pencil) is shown in the rowbar when the current row is edited, and if the indicator is automatically ' +
               'reset for the edited row when moving to a new row. Default, RowChangedIndicator is riOn.' + #10#10 +
               'RowChangedIndicator can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'riOn			A row changed indicator (a pencil) is displayed in the rowbar if the current row has been edited, and the row''s RowChanged property is set to True. ' +
               'The grid will continue to display the indicator for the row until it has been explicitly reset. It can be reset by setting the row''s RowChanged property to False, ' +
               'or by calling ResetRowProperties([prChanged]) to reset the RowChanged property for all rows. For the TtsDBGrid, riOn does not apply when the grid is databound.' + #10 +
               'riOff			No row changed indicator is displayed, even if the row is being edited. The row''s RowChanged property remains False.' + #10 +
               'riAutoReset		A row changed indicator is displayed when the row is being edited. When moving away from the row, the row''s changed indicator will be reset, as well as the row''s RowChanged property.'
  else if sPropertyName = 'RowMoving' then
     Result := 'Use RowMoving to either allow or disallow the user from moving rows in the grid. A user can move rows by first selecting the rows with the mouse and then subsequently ' +
               'clicking on a selected row with the left mouse button and dragging the mouse to a new position. RowSelectMode should be turned on to allow the movement of rows by the user. ' +
               'If RowMoving is false, rows can still be moved by setting their DisplayRownr. Default, RowMoving is true.' + #10#10 +
               'In the TtsDBGrid, you cannot move rows if the grid is being used as a data bound control (i.e. the DataSource has been assigned).'
  else if sPropertyName = 'Rows' then
     Result := 'Use Rows to set or determine the number of rows in the grid. The number of rows does not include the heading or the insert row, but does include the fixed rows. ' +
               'The is not included in the row count. Rows should be equal to or larger than 0. Default, the value is 4.' + #10#10 +
               'FOR DATABOUND...' + #10 +
               'When the grid is DataBound, use Rows to determine the currently known number of records in the dataset of the grid. When ExactRowCount is true, Rows is equal to the ' +
               'number of records in the dataset. When ExactRowCount is false, Rows is an estimate of the number of records in the dataset. Use CalculateRows to (re)calculate the ' +
               'exact number of records.' + #10#10 +
               'A change in the number of records in the dataset is not immediately reflected in the number of Rows of the grid. For performance reasons, the grid does not continuously ' +
               'recalculate the number of records. Instead, when as a result of scrolling the data it notices that there are more or less records than before, the row count is adjusted accordingly.' + #10#10 +
               'The range of the vertical scrollbar and the placement of the thumb in the scrollbar is affected by the number of Rows. As long as the number of records in the dataset is unknown, Rows only ' +
               'contains an estimate of the number of records and will in general be less than the actual number of records. When the user starts scrolling, the range and thumb position are dynamically ' +
               'adjusted to continuously reflect the new estimate of the number of records. When the user scrolls right to the end having started from the top, or right to the top having started from the ' +
               'bottom, the correct number of records will be known.'
  else if sPropertyName = 'RowSelectMode' then
     Result := 'Use RowSelectMode to set the row selection mode. A user can select columns with the mouse or rows can be selected by using either the RowSelected property or the SelectRows method. ' +
               'See selecting rows on how to select rows with the mouse. Default, the RowSelectMode is rsMulti.' + #10#10 +
               'RowSelectMode can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'rsNone			No rows can be selected.' + #10 +
               'rsSingle			Only one row can be selected at a time.' + #10 +
               'rsMulti			Multiple rows can be selected. Clicking in the upper left corner of the grid will select or deselect all rows at the same time.'
  else if sPropertyName = 'ScrollSpeed' then
     Result := 'Use ScrollSpeed to read or set the speed at which the grid scrolls when selecting or moving rows, columns or cells with the mouse. Default, the value is spVariable.' + #10#10 +
               'ScrollSpeed can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'spHigh			Scrolling is always at a high speed.' + #10 +
               'spLow			Scrolling is always at a low speed.' + #10 +
               'spVariable		Scrolling is initially at a low speed and switches to a high speed when you move the mouse further away.'
  else if sPropertyName = 'SelectedAreaCursor' then
     Result := 'Use SelectedAreaCursor to specify the shape of the cursor over the selected area of the grid, i.e. selected rows, columns and cells. ' +
               'The SelectedAreaCursor does not apply for the heading or the rowbar. Use this property to visually indicate that dragging is possible if ' +
               'you want to build dragging capabilities into the grid. (See also the OnCanStartDrag event). When SelectedAreaCursor is crDefault, no separate cursor is displayed over the ' +
               'selected area of the grid. Default, the value is crDefault.'
  else if sPropertyName = 'SelectFixed' then
     Result := 'Use SelectFixed to specify whether fixed rows and columns can be selected. It also applies to selection of the cells within the fixed rows and columns. Default, the value is true.'
  else if sPropertyName = 'SelectionColor' then
     Result := 'SelectionColor sets the background color used for highlighting column, row and cell selections in the grid. Default, SelectionColor is clHighlight.'  + #10#10 +
               'Selections can be displayed in the grid by either highlighting them using the SelectionColor and SelectionFontColor, or by inverting the colors of the items as they appear on '+
               'the screen. Which of the two is used is determined by the SelectionType property. When SelectionType is sltColor, the SelectionColor and SelectionFontColor are used, if ' +
               'SelectionType is sltInvert or sltDefault, inverting is used. Using inverted colors to highlight selections is significantly faster than using customized selection colors.'  + #10#10 +
               'SelectionColor only applies if SelectionType is sltColor (as oppsed to sltInvert).'  + #10#10 +
               'See SelectionFontColor for setting the selection font color.'
  else if sPropertyName = 'SelectionFontColor' then
     Result := 'SelectionFontColor sets the font color used for highlighting column, row and cell selections in the grid. Default, SelectionFontColor is clHighlightText.'  + #10#10 +
               'Selections can be displayed in the grid by either highlighting them using the SelectionColor and SelectionFontColor, or by inverting the colors of the items as they appear on the screen. ' +
               'Which of the two is used is determined by the SelectionType property. When SelectionType is sltColor, the SelectionColor and SelectionFontColor are used, if SelectionType is sltInvert or ' +
               'sltDefault, inverting is used. Using inverted colors to highlight selections is significantly faster than using customized selection colors.'  + #10#10 +
               'SelectionFontColor only applies if SelectionType is sltColor.'  + #10#10 +
               'See SelectionColor for setting the selection background color.'
  else if sPropertyName = 'SelectionType' then
     Result := 'Selections can be displayed in the grid by either highlighting them using the SelectionColor and SelectionFontColor, or by inverting the colors of the items as they appear on the screen. ' +
               'When SelectionType is sltColor, the SelectionColor and SelectionFontColor are used, if SelectionType is sltInvert or sltDefault, inverting is used. Using inverted colors to highlight ' +
               'selections is significantly faster than using customized selection colors. Default, SelectionType is sltDefault.' + #10#10 +
               'For enabling column, row and cell selections, see the ColSelectMode, RowSelectMode, and CellSelectMode properties.' + #10#10 +
               'SelectionType can take on the following values:' + #10#10 +
               'Value   Meaning' + #10#10 +
               'sltDefault  The default highlight method is used. For the TtsGrid and TtsDBGrid, this defaults to sltInvert. For the grids used in the combo box, ' +
               'the TtsComboGrid and TtsDBComboGrid, this defaults to their parent grid''s SelectionType.' + #10 +
               'sltInvert   Inverting pixel colors is used for highlighting.' + #10 +
               'sltColor    SelectionColor and SelectionFontColor are used for highlighting column, row and cell selections.'
  else if sPropertyName = 'ShrinkPicture' then
     Result := 'Use ShrinkPicture to specify if pictures should be drawn shrunk in cells or not. You can change ShrinkPicture in the OnCellLoaded event to customize the drawing for individual cells, ' +
               'or you can set it in advance to have all pictures drawn in the same way. ShrinkPicture only applies to cells of ControlType ctPicture. Default, ShrinkPicture is True.' + #10#10 +
               'ShrinkPicture specifies the default shrinking behaviour for pictures in the grid. Picture shrinking can also be set for individual columns, cells and rows using the column ShrinkPicture, ' +
               'RowShrinkPicture and CellShrinkPicture properties.'
  else if sPropertyName = 'SkipReadOnly' then
     Result := 'When SkipReadOnly is True, readonly cells, rows and columns will be skipped when the user navigates through the grid with the Tab and arrow keys. In addition, a readonly column will not ' +
               'receive the focus when clicked on if SkipReadOnly is True. Readonly rows will receive the focus. If SkipReadOnly is False, no skipping takes place. Default, SkipReadOnly is True.'  + #10#10 +
               'Cells, rows and columns can be set readonly by setting the CellReadOnly, RowReadOnly and column ReadOnly properties.'  + #10#10 +
               'When the GridMode is gmBrowse, the SkipReadOnly still applies. Only those cells, rows and columns are regarded as readonly for which it has been explicitly set with the above readonly properties.'
  else if sPropertyName = 'SpinButtonHeight' then
     Result := ''
  else if sPropertyName = 'SpinButtonWidth' then
     Result := ''
  else if sPropertyName = 'SpinRepeatDelay' then
     Result := 'SpinRepeatDelay specifies the delay, in milliseconds, between consecutive repeats of the the spin edit control. When a spin button is held down and the auto repeat is turned on, the spin edit ' +
               'waits SpinRepeatDelay milliseconds before the next repeat. On each repeat, the OnSpinRepeat event is activated. Default, SpinStartDelay is 500.' + #10#10 +
               'To set the inital delay before the spin edit start repeating, set the SpinStartDelay property.' + #10#10 +
               'SpinRepeatDelay only applies when spin buttons are turned on at the column, row or cell level, and the corresponding auto repeat option is turned on for the spin edit. To enable a spin edit, ' +
               'set the ButtonType for the row, column or cell to btVertSpin or btHorzSpin. To enable auto repeat, include the auto repeat option in the SpinOptions property for the row, column or cell.'
  else if sPropertyName = 'SpinStartDelay' then
     Result := 'SpinStartDelay specifies the initial delay, in milliseconds, for the spin edit control auto repeat. When a spin button is held down and the auto repeat is turned on, the spin edit waits ' +
               'SpinStartDelay milliseconds before the button starts repeating. On each repeat, the OnSpinRepeat event is activated. Default, SpinStartDelay is 500.' + #10#10 +
               'To set the delay between consecutive repeats, set the SpinRepeatDelay property.' + #10#10 +
               'SpinStartDelay only applies when spin buttons are turned on at the column, row or cell level, and the corresponding auto repeat option is turned on for the spin edit. ' +
               'To enable a spin edit, set the ButtonType for the row, column or cell to btVertSpin or btHorzSpin. To enable auto repeat, include the auto repeat option in the ' +
               'SpinOptions property for the row, column or cell.'
  else if sPropertyName = 'StoreData' then
     Result := 'When StoreData is set to True, you can store data in the grid by assigning the values for all the grid''s cells to the Cell property. ' +
               'When StoreData is False, no data can be stored in the grid. Default, StoreData is False.' + #10#10 +
               'When StoreData is True, the grid takes care of storing all grid values for you, much like the TStringGrid does. To display the data in the grid, you need to pre-load the ' +
               'data into it by assigning all values to their corresponding cells, using the Cell property. Changes made by the user will be saved by the grid, data will be automatically ' +
               'deleted for deleted rows and columns, and the grid will allocate new space for new rows and columns as needed. All values can be set and read using the Cell property. ' +
               'IF no value value has been assigned to a cell, then the Cell[Col, Row] property returns Unassigned.' + #10#10 +
               'When StoreData is False, the grid does not store any data, and it operates as a virtual grid. All data should be passed to the grid via the OnCellLoaded event. ' +
               'This allows you to store the data in your own data structure, and pass it to the grid when it requests for it via the OnCellLoaded event. You do not need to pre-load ' +
               'all data into memory in this case, the grid will only activate the OnCellLoaded event for those cells that are actually being displayed. This is particularly usefull if ' +
               'you want to display large tables in the non data-aware grid, but only want to read in a relatively small buffer of data at any one time.' + #10#10 +
               'For the TtsDBGrid, StoreData only applies if it is not DataBound (i,e, no datasource is attached). In that case, it operates as above. Otherwise, StoreData is set to False, ' +
               'and the data displayed is that of the attached dataset.' + #10#10 +
               'When StoreData is True, or when the TtsDBGrid is databound, the OnCellLoaded event is still activated for each cell displayed on the screen, although it is not needed in that ' +
               'case to actually display the data in the grid. It does give an opportunity though to format the display values if needed. See the OnCellLoaded event for more information.' + #10#10 +
               'To efficiently copy data stored in one grid to another when the StoreData property is True, use the CopyData method.'
  else if sPropertyName = 'StretchPicture' then
     Result := 'Use StretchPicture to specify if pictures should be drawn stretched in cells or not. You can change StretchPicture in the OnCellLoaded event to customize the drawing ' +
               'for individual cells, or you can set it in advance to have all pictures drawn in the same way. StretchPicture only applies to cells of ControlType ctPicture.' +
               ' Default, StretchPicture is True.' + #10#10 +
               'StretchPicture specifies the default stretching behaviour for pictures in the grid. Picture stretching can also be set for individual columns, cells and rows using ' +
               'the column StretchPicture, RowStretchPicture and CellStretchPicture properties.'
  else if sPropertyName = 'TabRowWrap' then
     Result := 'When the TabRowWrap property is set to true, the grid will automatically move the current cell to the first column of the next row when the user tabs to the next cell ' +
               'from the last column of a row, or to the last column of the previous row when the user shift-tabs to the previous cell from the first column of a row. ' +
               'If TabRowWrap is false, the grid will not tab to the next or previous row. Default, TabRowWrap is true.' + #10#10 +
               'TabRowWrap affects the use of the Tab, Shift-Tab, Enter, Right-Arrow and Left-Arrow keys. Using Tab, Enter or Left-Arrow will have no effect in the ' +
               'last column of a row when TabRowWrap is false. Shift-Tab and Right-Arrow will have no effect in the first column of a row when TabRowWrap is false.'
  else if sPropertyName = 'ThumbTracking' then
     Result := 'ThumbTracking specifies whether the contents of the grid will scroll immediately when moving the thumb of the scrollbar or only after the thumb ' +
               'has been released. Default, the value is false.' + #10#10 +
               'Dependency: Only functions with a TtsDbGrid when the DataSetType is dstBDE!'
  else if sPropertyName = 'TransparentColor' then
     Result := 'Use TransparentColor to specify which color in a picture should be replaced with the background color of the cell when drawn in the cell. ' +
               'You can change TransparentColor in the OnCellLoaded event to customize the drawing for individual cells, or you can set it in advance to have all pictures drawn in ' +
               'the same way. TransparentColor only applies to cells of ControlType ctPicture. Default, TransparentColor is clNone.' + #10#10 +
               'Be aware that setting the TransparentColor can significantly slow down drawing operations.'
  else if sPropertyName = 'VertAlignment' then
     Result := 'Use VertAlignment to set the default vertical text alignment for all the cells in the grid. You can override this default alignment by setting the ' +
               'column''s VertAlignment, the RowVertAlignment or CellVertAlignment properties. Default, VertAlignment is vtaDefault.' + #10#10 +
               'VertAlignment can be one of the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'vtaDefault		Use the default alignment. For VertAlignment, this reverts to top text alignment.' + #10 +
               'vtaTop			Align text to the top.' + #10 +
               'vtaCenter		Center text vertically.' + #10 +
               'vtaBottom		Align text to the bottom.'
  else if sPropertyName = 'WantTabs' then
     Result := 'The Tab key can be used to either tab from cell to cell in the grid or to tab to the next component on the form. If WantTabs is true, the Tab key will tab to the ' +
               'next cell in the grid, if WantTabs is false it will tab out of the grid to the next component. Default, WantTabs is True.' + #10#10 +
               'If you set WantTabs to false, you can still move from cell to cell in the grid by either using the Enter key or the arrow keys. The Enter key will always move ' +
               'to the next cell. The arrow keys will only move to another cell if the text in the cell is fully selected or if the caret is at the end of the text.'
  else if sPropertyName = 'WordWrap' then
     Result := 'Use WordWrap to set the word wrapping used in the grid. If word wrapping is on, text in cells will be displayed as multiple line text if the RowHeight of the row ' +
               'is higher than a single line. If word wrapping is off, text will always be displayed as single line text, regardless of the RowHeight. Setting WordWrap to wwDefault ' +
               ' corresponds to word wrapping on. The default value for WordWrap is wwDefault.' + #10#10 +
               'You can override the WordWrap setting for individual columns, rows and cells by setting the column''s WordWrap property, the RowWordWrap property or ' +
               'the CellWordWrap property.' + #10#10 +
               'WordWrap can take the following values:' + #10#10 +
               'Value			Meaning' + #10#10 +
               'wwOn			Text is dispayed as multi line text if the RowHeight is high enough.' + #10 +
               'wwOff			Text is displayed as single line text.'+ #10 +
               'wwDefault		Used to designate the default behaviour. '
  else
     Result := '';
end;

end.

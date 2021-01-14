{*******************************************************}
{                                                       }
{       Top Support Visual Components                   }
{       TopGrid TtsImageList component editor           }
{                                                       }
{       Copyright (c) 1999, Top Support                 }
{                                                       }
{*******************************************************}

unit TSImagelistEditor;

{$INCLUDE TSCmpVer}

interface

uses
    TSImageList,
    {$IFDEF TSVER_V6}
       Variants, DesignIntf, DesignEditors,
    {$ELSE}
       DsgnIntf,
    {$ENDIF}
    Forms, Windows, Classes, Controls, Dialogs,
    StdCtrls, SysUtils, ExtCtrls, Grids_ts, TSGrid, Buttons, Graphics;

type
    TtsImageCollection_ = class(TtsImageCollection);

    TtsImageCollectionEditor = class(TPropertyEditor)
    public
        function GetAttributes: TPropertyAttributes; override;
        function GetValue: string; override;
        procedure Edit; override;
    end;

    TtsImageListEditor = class(TComponentEditor)
    protected
        FEditor: TPropertyEditor;
        {$IFDEF TSVER_V6}
        procedure GetImageListEditor(const Prop: IProperty);
        {$ELSE}
        procedure GetImageListEditor(PropertyEditor: TPropertyEditor);
        {$ENDIF}
    public
        procedure Edit; override;
    published
        procedure ExecuteVerb(Index: Integer); override;
        function GetVerb(Index: Integer): string; override;
        function GetVerbCount: Integer; override;
    end;

    TtsImageListDlg = class(TForm)
        grdImages: TtsGrid;
        Bevel1: TBevel;
        Bevel2: TBevel;
        butDelete: TSpeedButton;
        butAdd: TSpeedButton;
        bvlSeperator2: TBevel;
        butLeft: TSpeedButton;
        butRight: TSpeedButton;
        butLoad: TSpeedButton;
        bvlSeperator1: TBevel;
        dlgLoadPicture: TOpenDialog;
        cmbGlobalSetName: TComboBox;
        lblSetName: TLabel;
        butOK: TButton;
        butCancel: TButton;
        dlgColor: TColorDialog;
        lblName: TLabel;
        shpFixedColor: TShape;
        lblSize: TLabel;
        lblPictureSize: TLabel;
        txtName: TEdit;
        optLowerLeftPixel: TRadioButton;
        optFixedColor: TRadioButton;
        butSelectColor: TButton;
        chkTransparent: TCheckBox;
        bvlProperties: TBevel;
        lblProperties: TLabel;
        butAddSet: TSpeedButton;
        butDeleteSet: TSpeedButton;
        bvlSeperator3: TBevel;
        butMoveToSet: TSpeedButton;
        butEditSet: TSpeedButton;

        procedure FormCreate(Sender: TObject);
        procedure butAddClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure grdImagesPaintCell(Sender: TObject; DataCol, DataRow: Longint;
        ARect: TRect; State: TtsPaintCellState; var Cancel: Boolean);
        procedure butLoadClick(Sender: TObject);
        procedure butDeleteClick(Sender: TObject);
        procedure butLeftClick(Sender: TObject);
        procedure butRightClick(Sender: TObject);
        procedure grdImagesColChanged(Sender: TObject; OldCol, NewCol: Longint);
        procedure cmbGlobalSetNameClick(Sender: TObject);
        procedure butSelectColorClick(Sender: TObject);
        procedure optFixedColorClick(Sender: TObject);
        procedure optLowerLeftPixelClick(Sender: TObject);
        procedure chkTransparentClick(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure butOKClick(Sender: TObject);
        procedure grdImagesDblClickCell(Sender: TObject; DataCol,
        DataRow: Longint; Pos: TtsClickPosition);
        procedure butDeleteSetClick(Sender: TObject);
        procedure txtNameKeyPress(Sender: TObject; var Key: Char);
        procedure butAddSetClick(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure butCancelClick(Sender: TObject);
        procedure butMoveToSetClick(Sender: TObject);
        procedure grdImagesSelectChanged(Sender: TObject;
        SelectType: TtsSelectType; ByUser: Boolean);
        procedure butEditSetClick(Sender: TObject);
        procedure grdImagesEnter(Sender: TObject);
        procedure chkTransparentEnter(Sender: TObject);
        procedure optLowerLeftPixelEnter(Sender: TObject);
        procedure optFixedColorEnter(Sender: TObject);
        procedure butSelectColorEnter(Sender: TObject);
        procedure cmbGlobalSetNameEnter(Sender: TObject);

    protected
        InDesignMode: Boolean;
        procedure ImageCollectionChanged(Sender: TObject);
        function HandleNameChange: Boolean;

    public
        ImageCollection: TtsImageCollection;
        ItemIndex: Variant;
        Modified: Boolean;
    end;

implementation

{$R *.DFM}

uses
    TSCommon, TypInfo, TSSetName;

const
    MainSetName = '(main)';
    JPegLibraryName = 'TSGJPEG';

type
    TLoadJPegStream = procedure(Filename: PChar; var Stream: TMemoryStream; var Buffer: Pointer; var BufSize: Integer); stdcall;
    TFreeJPegStream = procedure(Stream: TStream); stdcall;

var
    Dlg: TtsImageListDlg;
    IgnoreChange: Boolean;
    CloseButtonPressed: Boolean;

procedure LoadGraphic(Filename: String; Bitmap: TBitmap);
var
    Temp: string;
    TempBitmap: TBitmap;
    Icon: TIcon;
    MetaFile: TMetaFile;
    Handle: THandle;
    LoadJPegStream: TLoadJPegStream;
    FreeJPegStream: TFreeJPegStream;
    LoadStream, BitmapStream: TMemoryStream;
    Buffer: Pointer;
    BufSize: Integer;
begin
    TempBitmap := TBitmap.Create;
    {$IFDEF TSVER_V3}
    TempBitmap.TransparentColor := clWhite;
    TempBitmap.TransparentMode := tmAuto;
    TempBitmap.PixelFormat := pf24bit;
    {$ENDIF}

    try
        Temp := UpperCase(Trim(Filename)) + ' ';
        Temp := Copy(Temp, Length(Temp) - 3, 4);

        if (Temp='JPG ') or (Temp='JPEG') then
        begin
            Handle := LoadLibrary(JPegLibraryName);
            if Handle <> 0 then
            begin
                try
                    @LoadJPegStream := GetProcAddress(Handle, 'LoadJPegStream');
                    @FreeJPegStream := GetProcAddress(Handle, 'FreeJPegStream');
                    if (@LoadJPegStream <> nil) and (@FreeJPegStream <> nil) then
                    begin
                        LoadStream := nil;
                        BitmapStream := TMemoryStream.Create;
                        try
                            LoadJPegStream(PChar(FileName), LoadStream, Buffer, BufSize);
                            try
                                BitmapStream.Write(Buffer^, BufSize);
                                BitmapStream.Position := 0;
                                TempBitmap.LoadFromStream(BitmapStream);
                            except
                            end;
                        finally
                            FreeJPegStream(LoadStream);
                            BitmapStream.Free;
                        end;
                    end;
                finally
                    FreeLibrary(Handle);
                end;
            end;
        end
        else if (Temp='ICO ') then
        begin
            Icon := TIcon.Create;
            Icon.LoadFromFile(FileName);

            {$IFDEF TSVER_V3}
            TempBitmap.PixelFormat := pf8bit;
            TempBitmap.Transparent := Icon.Transparent;
            {$ENDIF}

            TempBitmap.Height := Icon.Height;
            TempBitmap.Width := Icon.Width;
            TempBitmap.Canvas.Draw(0,0, Icon);

            Icon.Free;
        end
        else if (Temp='WMF ') or (Temp='EMF ') then
        begin
            MetaFile := TMetaFile.Create;
            MetaFile.LoadFromFile(FileName);

            {$IFDEF TSVER_V3}
            TempBitmap.Transparent := MetaFile.Transparent;
            {$ENDIF}

            TempBitmap.Height := MetaFile.Height;
            TempBitmap.Width := MetaFile.Width;
            TempBitmap.Canvas.Draw(0,0, MetaFile);

            MetaFile.Free;
        end
        else
            TempBitmap.LoadFromFile(FileName);

        Bitmap.Assign(TempBitmap);

    finally
        TempBitmap.Free;
    end;
end;

function Max(I, J: Integer): Integer;
begin
    if I > J then
        Result := I
    else
        Result := J;
end;

function VisibleCols(tsGrid: TtsGrid): integer;
var
    I: integer;
    Count: integer;
begin
    Count := 0;
    for I := 1 to tsGrid.Cols do
        if tsGrid.Col[I].Visible then Inc(Count);
    Result := Count;
end;

function RightVisibleCol(Col: integer): integer;
var
    I: integer;
begin
    Result := -1;
    if Dlg.grdImages.Cols > 0 then
    begin
        for I := Col + 1 to Dlg.grdImages.Cols do
        begin
            if Dlg.grdImages.Col[I].Visible then
            begin
                Result := I;
                Break;
            end;
        end;
    end;
end;

function LeftVisibleCol(Col: integer): integer;
var
    I: integer;
begin
    Result := -1;
    if Dlg.grdImages.Cols > 0 then
    begin
        for I := Col - 1 downto 1 do
        begin
            if Dlg.grdImages.Col[I].Visible then
            begin
                Result := I;
                Break;
            end;
        end;
    end;
end;

procedure ClearControls;
begin
    IgnoreChange := True;

    Dlg.txtName.Text := '';
    Dlg.chkTransparent.Checked := False;
    Dlg.optLowerLeftPixel.Checked := False;
    Dlg.optFixedColor.Checked := False;
    Dlg.shpFixedColor.Brush.Style := bsClear;
    Dlg.shpFixedColor.Pen.Color := clGrayText;
    Dlg.butSelectColor.Enabled := False;
    Dlg.lblPictureSize.Caption := '';

    IgnoreChange := False;
end;

procedure FillControls;
var
    I: integer;
    DisableControls: Boolean;
    First: Boolean;
begin
    IgnoreChange := True;
    try
        if Dlg.grdImages.SelectedCols.Count > 1 then
        begin
            Dlg.txtName.Enabled := False;
            Dlg.txtName.Text := '';
            Dlg.chkTransparent.Enabled := True;

            First := True;
            Dlg.chkTransparent.Checked := False;
            for I := 1 to Dlg.grdImages.Cols do
            begin
                if Dlg.grdImages.SelectedCols.Selected[I] then
                begin
                    if not First and (Dlg.chkTransparent.Checked <> Boolean(Dlg.ImageCollection[I - 1].Transparent)) then
                    begin
                        Dlg.chkTransparent.State := cbGrayed;
                        Break;
                    end;

                    Dlg.chkTransparent.Checked := Boolean(Dlg.ImageCollection[I - 1].Transparent);
                    First := False;
                end;
            end;

            Dlg.optLowerLeftPixel.Enabled := (Dlg.chkTransparent.State <> cbUnChecked);
            Dlg.optFixedColor.Enabled := (Dlg.chkTransparent.State <> cbUnChecked);

            if Dlg.chkTransparent.State in [cbUnChecked, cbGrayed] then
            begin
                Dlg.optLowerLeftPixel.Checked := False;
                Dlg.optFixedColor.Checked := False;
            end
            else
            begin
                First := True;
                Dlg.optLowerLeftPixel.Checked := False;
                Dlg.optFixedColor.Checked := False;
                for I := 1 to Dlg.grdImages.Cols do
                begin
                    if Dlg.grdImages.SelectedCols.Selected[I] then
                    begin
                        if not First and
                           (Dlg.optLowerLeftPixel.Checked and (Dlg.ImageCollection[I - 1].TransparentMode = tmFixed)
                            or Dlg.optFixedColor.Checked and (Dlg.ImageCollection[I - 1].TransparentMode = tmAuto))
                        then
                        begin
                            Dlg.optLowerLeftPixel.Checked := False;
                            Dlg.optFixedColor.Checked := False;
                            Break;
                        end;

                        Dlg.optLowerLeftPixel.Checked := (Dlg.ImageCollection[I - 1].TransparentMode = tmAuto);
                        Dlg.optFixedColor.Checked := (Dlg.ImageCollection[I - 1].TransparentMode = tmFixed);
                        First := False;
                    end;
                end;
            end;

            if Dlg.optFixedColor.Checked then
            begin
                Dlg.butSelectColor.Enabled := True;
                Dlg.shpFixedColor.Brush.Style := bsSolid;
                Dlg.shpFixedColor.Brush.Color := Dlg.ImageCollection[Dlg.grdImages.SelectedCols.Next(0) - 1].TransparentColor;
                Dlg.shpFixedColor.Pen.Color := clBlack;
            end
            else
            begin
                Dlg.butSelectColor.Enabled := False;
                Dlg.shpFixedColor.Brush.Style := bsClear;
                Dlg.shpFixedColor.Pen.Color := clGrayText;
            end;

            Dlg.lblPictureSize.Caption := '';
        end
        else
        begin
            DisableControls := True;
            for I := 1 to Dlg.grdImages.Cols do
            begin
                if Dlg.grdImages.Col[I].Visible then
                begin
                    DisableControls := False;
                    Break;
                end;
            end;

            if DisableControls then
            begin
                ClearControls;
                Dlg.txtName.Enabled := False;
                Dlg.chkTransparent.Enabled := False;
                Dlg.optLowerLeftPixel.Enabled := False;
                Dlg.optFixedColor.Enabled := False;
                Dlg.butSelectColor.Enabled := False;
                Dlg.shpFixedColor.Brush.Style := bsClear;
                Dlg.shpFixedColor.Pen.Color := clGrayText;

                Dlg.chkTransparent.Checked := False;
                Dlg.optLowerLeftPixel.Checked := False;
                Dlg.optFixedColor.Checked := False;
                Dlg.lblPictureSize.Caption := '';
            end
            else
            begin
                Dlg.txtName.Enabled := True;
                Dlg.chkTransparent.Enabled := True;

                Dlg.txtName.Text := Dlg.ImageCollection[Dlg.grdImages.CurrentDataCol - 1].Name;

                Dlg.chkTransparent.Checked := Dlg.ImageCollection[Dlg.grdImages.CurrentDataCol - 1].Transparent;
                Dlg.optLowerLeftPixel.Enabled := Dlg.chkTransparent.Checked;
                Dlg.optFixedColor.Enabled := Dlg.chkTransparent.Checked;

                if (Dlg.ImageCollection[Dlg.grdImages.CurrentDataCol - 1].TransparentMode = tmAuto) and Dlg.optLowerLeftPixel.Enabled then
                   Dlg.optLowerLeftPixel.Checked := True
                else if (Dlg.ImageCollection[Dlg.grdImages.CurrentDataCol - 1].TransparentMode = tmFixed) and Dlg.optFixedColor.Enabled then
                     Dlg.optFixedColor.Checked := True
                else begin
                        Dlg.optLowerLeftPixel.Checked := False;
                        Dlg.optFixedColor.Checked := False;
                     end;

                if Dlg.optFixedColor.Checked and Dlg.optFixedColor.Enabled then
                begin
                    Dlg.butSelectColor.Enabled := True;
                    Dlg.shpFixedColor.Brush.Style := bsSolid;
                    Dlg.shpFixedColor.Brush.Color := Dlg.ImageCollection[Dlg.grdImages.CurrentDataCol - 1].TransparentColor;
                    Dlg.shpFixedColor.Pen.Color := clBlack;
                end
                else
                begin
                    Dlg.butSelectColor.Enabled := False;
                    Dlg.shpFixedColor.Brush.Style := bsClear;
                    Dlg.shpFixedColor.Pen.Color := clGrayText;
                end;

                Dlg.lblPictureSize.Caption := IntToStr(Dlg.ImageCollection[Dlg.grdImages.CurrentDataCol - 1].Bitmap.Width);
                Dlg.lblPictureSize.Caption := Dlg.lblPictureSize.Caption + ' x ' + IntToStr(Dlg.ImageCollection[Dlg.grdImages.CurrentDataCol - 1].Bitmap.Height);
            end;
        end;
    finally
        IgnoreChange := False;
        if Dlg.txtName.Enabled then
            Dlg.txtName.Color := clWindow
        else
            Dlg.txtName.Color := Dlg.Color;
    end;
end;

procedure ShowSetInGrid;
var
    I: integer;
    Temp: string;
    OldEnablePaint: Boolean;
begin
    Temp := Trim(LowerCase(Dlg.cmbGlobalSetName.Text));
    OldEnablePaint := Dlg.grdImages.EnablePaint;
    Dlg.grdImages.EnableRedraw := False;
    Dlg.grdImages.ResetColProperties([prSelected]);
    try
        if Temp = MainSetName then Temp := '';
        for I := Dlg.grdImages.Cols downto 1 do
        begin
            if Trim(LowerCase(Dlg.ImageCollection[I - 1].SetName)) = Temp then
                Dlg.grdImages.Col[I].Visible := True
            else
                Dlg.grdImages.Col[I].Visible := False;
        end;
    finally
        Dlg.grdImages.EnableRedraw := OldEnablePaint;
    end;
end;

procedure EnableButtons;
begin
    if VisibleCols(Dlg.grdImages) = 0 then
    begin
        Dlg.butDelete.Enabled := False;
        Dlg.butLeft.Enabled := False;
        Dlg.butRight.Enabled := False;
        Dlg.butLoad.Enabled := False;
        Dlg.butMoveToSet.Enabled := False;
    end
    else
    begin
        Dlg.butDelete.Enabled := True;

        if Dlg.cmbGlobalSetName.Items.Count > 1 then
            Dlg.butMoveToSet.Enabled := True
        else
            Dlg.butMoveToSet.Enabled := False;

        if Dlg.grdImages.SelectedCols.Count > 1 then
        begin
            Dlg.butLoad.Enabled := False;
            Dlg.butLeft.Enabled := False;
            Dlg.butRight.Enabled := False;
        end
        else
        begin
            Dlg.butLoad.Enabled := True;
            Dlg.butLeft.Enabled := (LeftVisibleCol(Dlg.grdImages.CurrentDataCol) <>  - 1);
            Dlg.butRight.Enabled := (RightVisibleCol(Dlg.grdImages.CurrentDataCol) <> -1);
        end;
    end;

    if Dlg.cmbGlobalSetName.Text = MainSetName then
    begin
        Dlg.butDeleteSet.Enabled := False;
        Dlg.butEditSet.Enabled := False;
    end
    else
    begin
        Dlg.butDeleteSet.Enabled := True;
        Dlg.butEditSet.Enabled := True;
    end;
end;

procedure ShowImageEditor(forComponent : TComponent);
begin
    Screen.Cursor := crHourglass;
    Dlg := TtsImageListDlg.Create(Application);
    try
        Dlg.InDesignMode := True;
        Dlg.Caption := forComponent.Owner.Name + '.' +
                       forComponent.Name;

        //make local copy of imagecollection of component
        if Assigned(TtsImageList(forComponent).Images) then
            Dlg.ImageCollection.Assign(TtsImageList(forComponent).Images);

        if Dlg.ShowModal = mrOK then
        begin
            Screen.Cursor := crHourglass;
            //copy changed imagecollection back to component
            TtsImageList(forComponent).Images.Assign(Dlg.ImageCollection);
            //Modified;
        end;
    finally
        Dlg.Free;
        Screen.Cursor := crDefault;
    end;
end;

{TtsImageCollectionEditor}

function TtsImageCollectionEditor.GetAttributes: TPropertyAttributes;
begin
    Result := [paDialog];  //This is a dialog based property editor
end;

function TtsImageCollectionEditor.GetValue:string;
begin
    //Display the name of the object in the object inspector
    Result := Format('(%s)', [GetPropType^.Name]);
end;

procedure TtsImageCollectionEditor.Edit;
begin
  ShowImageEditor(TComponent(GetComponent(0)));
end;

{TtsImageListEditor}

procedure TtsImageListEditor.ExecuteVerb(Index: Integer);
begin
    Edit;
end;

function TtsImageListEditor.GetVerb(Index: Integer): string;
begin
    Result := '&Imagelist Editor';
end;

function TtsImageListEditor.GetVerbCount: Integer;
begin
    Result := 1;
end;


{$IFDEF TSVER_V6}
procedure TtsImageListEditor.GetImageListEditor(const Prop: IProperty);
begin
  //ShowMessage('Get Property Name ' + Prop.GetName);
  //if Prop.GetName = 'Images' then
  //   Prop.Edit;
  if Prop.GetName = 'Images' then
     FEditor := TPropertyEditor(Prop);
  //TPropertyEditor(Prop).Free;
  //ShowMessage('Get Property Name Complete ' + Prop.GetName);
end;
{$ELSE}
procedure TtsImageListEditor.GetImageListEditor(PropertyEditor: TPropertyEditor);
begin
    if PropertyEditor is TtsImageCollectionEditor
        then FEditor := PropertyEditor
        else PropertyEditor.Free;
end;
{$ENDIF}

procedure TtsImageListEditor.Edit;
begin
  ShowImageEditor(Component);
end;

{TtsImageListDlg}

procedure TtsImageListDlg.FormCreate(Sender: TObject);
begin
    grdImages.RowHeight[1] := 94;

    dlgLoadPicture.Filter := 'All files (*.*)|*.*|Bitmap files (*.bmp)|*.BMP|Icons (*.ico)|*.ICO|JPEG files (*.jpg, *.jpeg)|*.JPG;*.JPEG|Metafiles (*.wmf, *.emf)|*.WMF;*.EMF';
    dlgLoadPicture.FilterIndex := 2;
    dlgLoadPicture.Options := [{$IFDEF TSVER_D4} ofEnableSizing, {$ENDIF} ofHideReadOnly, ofFileMustExist, ofPathMustExist];

    dlgColor.Options := [cdAnyColor, cdFullOpen];

    IgnoreChange := False;
    InDesignMode := False;

    ImageCollection := TtsImageCollection.Create(nil, TtsImage);

    Dlg := Self;

    //resize all controls if large fonts are being used
    if butDelete.Width < Dlg.Canvas.TextWidth(butDelete.Caption) then
    begin
        butAddSet.Width := Dlg.Canvas.TextWidth(butAddSet.Caption) + 1;
        butDeleteSet.Width := Dlg.Canvas.TextWidth(butDeleteSet.Caption) + 1;
        butEditSet.Width := Dlg.Canvas.TextWidth(butEditSet.Caption) + 1;
        butAdd.Width := Dlg.Canvas.TextWidth(butAdd.Caption) + 1;
        butDelete.Width := Dlg.Canvas.TextWidth(butDelete.Caption) + 1;
        butLoad.Width := Dlg.Canvas.TextWidth(butLoad.Caption) + 1;
        butLeft.Width := Dlg.Canvas.TextWidth(butLeft.Caption) + 1;
        butRight.Width := Dlg.Canvas.TextWidth(butRight.Caption) + 1;
        butMoveToSet.Width := Dlg.Canvas.TextWidth(butMoveToSet.Caption) + 1;

        cmbGlobalSetName.Left := lblSetName.Left + lblSetName.Width + 5;
        butAddSet.Left := cmbGlobalSetName.Left + cmbGlobalSetName.Width + 16;
        butDeleteSet.Left := butAddSet.Left + butAddSet.Width + 7;
        butEditSet.Left := butDeleteSet.Left + butDeleteSet.Width + 7;

        butDelete.Left := butAdd.Left + butAdd.Width + 7;
        bvlSeperator1.Left := butDelete.Left + butDelete.Width + 6;
        butLoad.Left := butDelete.Left + butDelete.Width + 14;
        bvlSeperator2.Left := butLoad.Left + butLoad.Width + 6;
        butLeft.Left := butLoad.Left + butLoad.Width + 14;
        butRight.Left := butLeft.Left + butLeft.Width + 7;
        bvlSeperator3.Left := butRight.Left + butRight.Width + 6;
        butMoveToSet.Left := butRight.Left + butRight.Width + 14;

        grdImages.HeadingHeight := Dlg.Canvas.TextHeight('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') + 2;
        grdImages.Height := grdImages.HeadingHeight + grdImages.RowHeight[1] + 20;
        bvlProperties.Top := grdImages.Top + grdImages.Height + 10;
        lblProperties.Top := bvlProperties.Top - lblProperties.Height div 2;
        butOK.Top := bvlProperties.Top + bvlProperties.Height + 11;
        butCancel.Top := butOK.Top;
        Dlg.ClientHeight := butOK.Top + butOK.Height + 11;

        optLowerLeftPixel.Width := Dlg.Canvas.TextWidth(optLowerLeftPixel.Caption) + 15;
        optFixedColor.Width := Dlg.Canvas.TextWidth(optFixedColor.Caption) + 15;
        shpFixedColor.Left := optFixedColor.Left + optFixedColor.Width + 1;
        butSelectColor.Left := shpFixedColor.Left + shpFixedColor.Width + 13;
        butSelectColor.Width := Dlg.Canvas.TextWidth(butSelectColor.Caption) + 1;

        bvlProperties.Width := optLowerLeftPixel.Left + optLowerLeftPixel.Width - bvlProperties.Left + 8;

        Dlg.ClientWidth := Max(bvlProperties.Width + bvlProperties.Left * 2, butMoveToSet.Left + butMoveToSet.Width + butAdd.Left);

        bvlProperties.Width := Dlg.ClientWidth - bvlProperties.Left * 2;
        grdImages.Width := bvlProperties.Width;

        butCancel.Left := bvlProperties.Left + bvlProperties.Width - butCancel.Width;
        butOK.Left := butCancel.Left - butOK.Width - 25;
    end;
end;

procedure TtsImageListDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if Dlg.ActiveControl = txtName then
    begin
        if HandleNameChange() = False then
        begin
            CanClose := False;
            Exit;
        end;
    end;

    if not CloseButtonPressed and Dlg.Modified then
    begin
       if mrYes = MessageDlg('The imagecollection has changed. Do you wish to save the changes?', mtConfirmation, [mbYes, mbNo], 0) then
           ModalResult := mrOk
       else
           ModalResult := mrCancel
    end;
end;

procedure TtsImageListDlg.FormDestroy(Sender: TObject);
begin
    ImageCollection.Free;
end;

procedure TtsImageListDlg.FormShow(Sender: TObject);
var
    I: integer;
begin
    CloseButtonPressed := False;

    Dlg.cmbGlobalSetName.Items.Assign(TtsImageCollection_(ImageCollection).SetNames);
    Dlg.cmbGlobalSetName.Items.Insert(0, MainSetName);

    grdImages.Cols := ImageCollection.Count;
    for I := 1 to grdImages.Cols do
    begin
        grdImages.Col[I].ControlType := ctPicture;
        grdImages.Col[I].Width := 100;
        grdImages.Col[I].Heading :=ImageCollection[I - 1].Name;
    end;

    if ImageCollection.Count = 0 then ItemIndex := Unassigned;

    //ShowMessage('Step Start');
    cmbGlobalSetName.ItemIndex := 0;
    if ImageCollection.IndexExists(ItemIndex) then
    begin
        if Assigned(ImageCollection.Items[ItemIndex]) then
        begin
            if ImageCollection[ItemIndex].SetName = '' then
                cmbGlobalSetName.ItemIndex := 0
            else
            begin
                for I := 1 to cmbGlobalSetName.Items.Count - 1 do
                begin
                    if CompareText(ImageCollection[ItemIndex].SetName, cmbGlobalSetName.Items[I]) = 0 then
                    begin
                        cmbGlobalSetName.ItemIndex := I;
                        Break;
                    end;
                end;
            end;

            ShowSetInGrid;
            grdImages.CurrentCell.MoveTo(ImageCollection.Items[ItemIndex].Index + 1, 1);
        end
        else
            ShowSetInGrid;
    end
    else
        ShowSetInGrid;
    //ShowMessage('Step End');
    grdImages.LeftCol := grdImages.CurrentDataCol - 1;
    FillControls;
    EnableButtons;

    ImageCollection.OnChange := ImageCollectionChanged;
    Modified := False;

    Screen.Cursor := crDefault;
end;

procedure TtsImageListDlg.ImageCollectionChanged(Sender: TObject);
begin
    Modified := True;
end;

function TtsImageListDlg.HandleNameChange: Boolean;
var
    Ok: Boolean;
    Name: string;
    I: Integer;
begin
    Result := True;
    if not txtName.Modified then Exit;

    Name := Trim(txtName.Text);
    Ok := True;

    if Pos('.', Name) > 0 then
    begin
       MessageDlg('Illegal character in name. Dots can not be used.', mtError, [mbOk], 0);
       Ok := False;
    end;

    if Ok and (Name = '') then
    begin
       MessageDlg('The image must have a name.', mtError, [mbOk], 0);
       Ok := False;
    end;

    if Ok then
    begin
        I := ImageCollection.NameIndex(ImageCollection[grdImages.CurrentDataCol - 1].SetName + '.' + Name);
        if (I < 0) or (I = grdImages.CurrentDataCol - 1) then
        begin
            ImageCollection[grdImages.CurrentDataCol - 1].Name := Trim(txtName.Text);
            grdImages.Col[grdImages.CurrentDataCol].Heading := Trim(txtName.Text);
            txtName.Text := Trim(txtName.Text);
        end
        else
        begin
            if ImageCollection[grdImages.CurrentDataCol - 1].SetName = '' then
                MessageDlg('Name ''' + txtName.Text + ''' already exists. Names must be unique within a set.', mtError, [mbOk], -1)
            else
                MessageDlg('Name ''' + txtName.Text + ''' already exists in the set ''' + ImageCollection[grdImages.CurrentDataCol - 1].SetName + '''. Names must be unique within a set.', mtError, [mbOk], -1);
            Ok := False;
        end;
    end;

    if not Ok then
    begin
        txtName.SelectAll;
        txtName.SetFocus;
        Result := False;
    end
    else
        txtName.Modified := False;
end;

procedure TtsImageListDlg.grdImagesPaintCell(Sender: TObject; DataCol,
  DataRow: Longint; ARect: TRect; State: TtsPaintCellState;
  var Cancel: Boolean);
var
    Image: TBitmap;
    Bitmap: TBitmap;
    TransparentColor: TColor;
    OldStyle: TBrushStyle;
begin
    if DataRow = 0 then Exit;

    Cancel := True;

    //workaround for bug in TCanvas
    Image := TBitmap.Create;
    {$IFDEF TSVER_V3}
    Image.PixelFormat := pf32bit;
    {$ENDIF}
    Image.Height := 1;
    Image.Width := 1;
    grdImages.Canvas.Draw(ARect.Left, ARect.Top, Image);
    Image.Free;

    grdImages.Canvas.Brush.Color := grdImages.Color;
    grdImages.Canvas.Brush.Style := bsSolid;
    grdImages.Canvas.FillRect(ARect);

    ARect.Left := ARect.Left + 3;
    ARect.Right := ARect.Right - 3;
    ARect.Top := ARect.Top + 3;
    ARect.Bottom := ARect.Bottom - 3;

    if (State = [psCurrent]) and (grdImages.SelectedCols.Count = 0) then
    begin
        grdImages.Canvas.Brush.Color := clBlack;
        grdImages.Canvas.Framerect(ARect);
    end;

    ARect.Left := ARect.Left + 3;
    ARect.Right := ARect.Right - 3;
    ARect.Top := ARect.Top + 3;
    ARect.Bottom := ARect.Bottom - 3;

    Bitmap := ImageCollection[DataCol - 1].Bitmap;

    if ImageCollection[DataCol - 1].Transparent then
        TransparentColor := ImageCollection[DataCol - 1].TransparentColor
    else
        TransparentColor := clNone;

    OldStyle := grdImages.Canvas.Brush.Style;
    grdImages.Canvas.Brush.Style := bsSolid;
    grdImages.Canvas.Brush.Color := grdImages.Color;

    tsStretchDraw(grdImages.Canvas, ARect, Bitmap, TransparentColor, True, False, True, True);
    grdImages.Canvas.Brush.Style := OldStyle;
end;

procedure TtsImageListDlg.grdImagesColChanged(Sender: TObject;
  OldCol, NewCol: Longint);
begin
    if (OldCol <> NewCol) and (NewCol >= grdImages.LeftCol + grdImages.VisibleCols - 1) then
    begin
        grdImages.CurrentCell.PutInView;
    end;

    FillControls;
    EnableButtons;
end;

procedure TtsImageListDlg.grdImagesDblClickCell(Sender: TObject; DataCol,
  DataRow: Longint; Pos: TtsClickPosition);
begin
    if (DataCol > 0) and not InDesignMode then
        butOKClick(Sender);
end;

procedure TtsImageListDlg.grdImagesSelectChanged(Sender: TObject;
  SelectType: TtsSelectType; ByUser: Boolean);
begin
    FillControls;
    EnableButtons;
end;

procedure TtsImageListDlg.butDeleteSetClick(Sender: TObject);
var
    I: integer;
    Temp: string;
begin
    if HandleNameChange() = False then Exit;

    if mrOk = MessageDlg('Delete set ''' + cmbGlobalSetName.Text + ''' and all the pictures in it?', mtConfirmation, [mbOk, mbCancel], 0) then
    begin
        Temp := Trim(LowerCase(cmbGlobalSetName.Text));
        if Temp = MainSetName then Temp := '';

        I := 0;
        while I <= ImageCollection.Count - 1 do
            if Trim(LowerCase(ImageCollection[I].SetName)) = Temp then
            begin
                ImageCollection[I].Free;
                grdImages.DeleteCols(I + 1, I + 1);
            end
            else
                Inc(I, 1);

        if TtsImageCollection_(ImageCollection).SetNames.IndexOf(Temp)>=0 then
            TtsImageCollection_(ImageCollection).SetNames.Delete(TtsImageCollection_(ImageCollection).SetNames.IndexOf(Temp));

        cmbGlobalSetName.Items.Delete(cmbGlobalSetName.ItemIndex);
        cmbGlobalSetName.ItemIndex := 0;

        ShowSetInGrid;
        if VisibleCols(grdImages) > 0 then grdImages.CurrentCell.MoveTo(1, 1);
        EnableButtons;
        FillControls;
        if txtName.Enabled then txtName.SetFocus;
    end
end;

procedure TtsImageListDlg.butAddSetClick(Sender: TObject);
var
    SetNameDlg: TtsSetNameDlg;
begin
    if HandleNameChange() = False then Exit;

    SetNameDlg := TtsSetNameDlg.Create(Self);
    try
        SetNameDlg.cmbSetNames.Items := cmbGlobalSetName.Items;
        SetNameDlg.Caption := 'Add new set';
        SetNameDlg.cmbSetNames.Visible := False;
        SetNameDlg.txtSetName.Visible := True;
        SetNameDlg.txtSetName.Text := '';
        if mrOk = SetNameDlg.ShowModal then
        begin
            TtsImageCollection_(ImageCollection).SetNames.Add(Trim(SetNameDlg.txtSetName.Text));
            cmbGlobalSetName.Items.Add(Trim(SetNameDlg.txtSetName.Text));
            cmbGlobalSetName.ItemIndex := cmbGlobalSetName.Items.Count - 1;
            ShowSetInGrid;
            EnableButtons;
            FillControls;
        end;
    finally
        SetNameDlg.Free;
    end;
end;

procedure TtsImageListDlg.butEditSetClick(Sender: TObject);
var
    SetNameDlg: TtsSetNameDlg;
    I: Integer;
begin
    if HandleNameChange() = False then Exit;

    SetNameDlg := TtsSetNameDlg.Create(Self);
    try
        SetNameDlg.cmbSetNames.Items := cmbGlobalSetName.Items;
        SetNameDlg.Caption := 'Edit setname';
        SetNameDlg.cmbSetNames.Visible := False;
        SetNameDlg.txtSetName.Visible := True;
        SetNameDlg.txtSetName.Text := cmbGlobalSetName.Text;
        SetNameDlg.txtSetName.AutoSelect := True;
        if mrOk = SetNameDlg.ShowModal then
        begin
            I := TtsImageCollection_(ImageCollection).SetNames.IndexOf(cmbGlobalSetName.Text);
            if I >=0 then
                TtsImageCollection_(ImageCollection).SetNames[I] := Trim(SetNameDlg.txtSetName.Text);

            for I := 0 to ImageCollection.Count - 1 do
                if Trim(LowerCase(ImageCollection[I].SetName)) = Trim(LowerCase(cmbGlobalSetName.Text)) then
                    ImageCollection[I].SetName := Trim(SetNameDlg.txtSetName.Text);

            I := cmbGlobalSetName.ItemIndex;
            cmbGlobalSetName.Items[I] := Trim(SetNameDlg.txtSetName.Text);
            cmbGlobalSetName.ItemIndex := I;

            FillControls;
        end;
    finally
        SetNameDlg.Free;
    end;
end;

procedure TtsImageListDlg.butLoadClick(Sender: TObject);
begin
    if HandleNameChange() = False then Exit;

    if grdImages.Cols > 0 then
    begin
        dlgLoadPicture.Options := dlgLoadPicture.Options - [ofAllowMultiSelect];
        if dlgLoadPicture.Execute then
        begin
            LoadGraphic(dlgLoadPicture.Filename, ImageCollection[grdImages.CurrentDataCol - 1].Bitmap);
            grdImages.RefreshData(roBoth, rpNone);
            grdImages.CurrentCell.PutInView;
        end;
    end;
end;

procedure TtsImageListDlg.butAddClick(Sender: TObject);
var
    tsImage: TtsImage;
    I, P, Count: integer;
    FirstCol: integer;
    Temp: string;
    SetName: string;
begin
    if HandleNameChange() = False then Exit;
    grdImages.ResetColProperties([prSelected]);

    tsImage := nil;
    FirstCol := grdImages.Cols + 1;
    SetName := cmbGlobalSetName.Text;
    if SetName = MainSetName then SetName := '';

    dlgLoadPicture.Options := dlgLoadPicture.Options + [ofAllowMultiSelect];
    if dlgLoadPicture.Execute then
    begin
        Count := 0;
        try
            for I := 0 to dlgLoadPicture.Files.Count - 1 do
            begin
                 try
                    tsImage := ImageCollection.Add;
                    LoadGraphic(dlgLoadPicture.Files[I], tsImage.Bitmap);

                    for P := Length(dlgLoadPicture.Files[I]) downto 1 do
                        if Copy(dlgLoadPicture.Files[I], P , 1) = '\' then Break;

                    if P < Length(dlgLoadPicture.Files[I]) then Inc(P, 1);

                    dlgLoadPicture.Files[I] := Copy(dlgLoadPicture.Files[I], P, Length(dlgLoadPicture.Files[I]));

                    P := Pos('.', dlgLoadPicture.Files[I]) - 1;
                    if P < 0 then P := Length(dlgLoadPicture.Files[I]);
                    dlgLoadPicture.Files[I] := Copy(dlgLoadPicture.Files[I], 1, P);

                    for P := 0 to 99 do
                    begin
                        Temp := dlgLoadPicture.Files[I];
                        if P > 0 then Temp := Temp + IntToStr(P);
                        if ImageCollection.NameIndex(SetName + '.' + Temp) < 0 then
                        begin
                            tsImage.SetName := SetName;
                            tsImage.Name := Temp;
                        end;
                        if tsImage.Name = Temp then Break;
                    end;

                    if cmbGlobalSetName.Text = MainSetName then
                        tsImage.SetName := ''
                    else
                        tsImage.SetName := cmbGlobalSetName.Text;

                    Inc(Count, 1);
                except
                    on E: Exception do
                    begin
                        MessageDlg(E.message, mtError, [mbOK], 0);
                        tsImage.Free;
                    end;
                end;
            end;
        finally
            if Count > 0 then
            begin
                grdImages.Cols := grdImages.Cols + Count;
                for I := FirstCol to grdImages.Cols do
                begin
                    grdImages.Col[I].ControlType := ctPicture;
                    grdImages.Col[I].Width := 100;
                    grdImages.Col[I].Heading := ImageCollection[I - 1].Name;
                end;

                grdImages.CurrentCell.MoveTo(FirstCol, 1);
                grdImages.CurrentCell.PutInView;

                EnableButtons;
                txtName.SetFocus;
            end;
        end;
    end;
end;

procedure TtsImageListDlg.butDeleteClick(Sender: TObject);
var
    I: integer;
begin
    if VisibleCols(grdImages) > 0 then
    begin
        if grdImages.SelectedCols.Count > 0 then
            I := grdImages.SelectedCols.Previous(grdImages.Cols + 1)
        else
            I := grdImages.CurrentDataCol;

        repeat
            ImageCollection[I - 1].Free;
            grdImages.DeleteCols(I, I);
            I := grdImages.SelectedCols.Previous(I);
        until (I = -1) or (grdImages.SelectedCols.Count = 0);

        ShowSetInGrid;
        if VisibleCols(grdImages) > 0 then
        begin
            grdImages.RefreshData(roBoth, rpNone);
            grdImages.CurrentCell.PutInView;
            FillControls;
        end;
        EnableButtons;
    end;
end;

procedure TtsImageListDlg.butLeftClick(Sender: TObject);
var
    Temp: TtsImage;
    LeftColnr: integer;
begin
    if HandleNameChange() = False then Exit;

    LeftColnr := LeftVisibleCol(Dlg.grdImages.CurrentDataCol);
    if LeftColnr >= 1 then
    begin
        if grdImages.SelectedCols.Count > 0 then grdImages.ResetColProperties([prSelected]);

        Temp := TtsImage.Create(nil);
        Temp.Assign(ImageCollection[LeftColnr - 1]);
        ImageCollection[LeftColnr - 1].Assign(ImageCollection[grdImages.CurrentDataCol - 1]);
        ImageCollection[grdImages.CurrentDataCol - 1].Assign(Temp);
        Temp.Free;

        grdImages.EnablePaint := False;
        try
            grdImages.Col[grdImages.CurrentDataCol].Heading := ImageCollection[grdImages.CurrentDataCol - 1].Name;
            grdImages.Col[LeftColNr].Heading := ImageCollection[LeftColNr - 1].Name;

            grdImages.CurrentCell.MoveTo(LeftColnr,1);
            grdImages.CurrentCell.PutInView;
        finally
            grdImages.EnablePaint := True;
        end;
    end;
end;


procedure TtsImageListDlg.butRightClick(Sender: TObject);
var
    Temp: TtsImage;
    RightColnr: integer;
begin
    if HandleNameChange() = False then Exit;

    RightColnr := RightVisibleCol(Dlg.grdImages.CurrentDataCol);

    if (RightColnr <= grdImages.Cols) and (RightColnr > 0) then
    begin
        if grdImages.SelectedCols.Count > 0 then grdImages.ResetColProperties([prSelected]);

        Temp := TtsImage.Create(nil);
        Temp.Assign(ImageCollection[RightColnr - 1]);
        ImageCollection[RightColnr - 1].Assign(ImageCollection[grdImages.CurrentDataCol - 1]);
        ImageCollection[grdImages.CurrentDataCol - 1].Assign(Temp);
        Temp.Free;

        grdImages.EnablePaint := False;
        try
            grdImages.Col[grdImages.CurrentDataCol].Heading := ImageCollection[grdImages.CurrentDataCol - 1].Name;
            grdImages.Col[RightColNr].Heading := ImageCollection[RightColNr - 1].Name;

            grdImages.CurrentCell.MoveTo(RightColnr,1);
            grdImages.CurrentCell.PutInView;
        finally
            grdImages.EnablePaint := True;
        end;
    end;
end;

procedure TtsImageListDlg.butMoveToSetClick(Sender: TObject);
var
    SetNameDlg: TtsSetNameDlg;
    I: Integer;
begin
    if HandleNameChange() = False then Exit;

    SetNameDlg := TtsSetNameDlg.Create(Self);
    try
        SetNameDlg.Caption := 'Move picture to different set';
        SetNameDlg.txtSetName.Visible := False;
        SetNameDlg.cmbSetNames.Visible := True;
        SetNameDlg.cmbSetNames.Items := cmbGlobalSetName.Items;
        SetNameDlg.cmbSetNames.ItemIndex := cmbGlobalSetName.ItemIndex;

        if mrOk = SetNameDlg.ShowModal then
        begin
            if SetNameDlg.cmbSetNames.ItemIndex <> cmbGlobalSetName.ItemIndex then
            begin
                if grdImages.SelectedCols.Count > 0 then
                    I := grdImages.SelectedCols.Next(0)
                else
                    I := grdImages.CurrentDataCol;

                repeat
                    try
                        if SetNameDlg.cmbSetNames.Text = MainSetName then
                            ImageCollection[I - 1].SetName := ''
                        else
                            ImageCollection[I - 1].SetName := SetNameDlg.cmbSetNames.Text;
                    except
                        on E: Exception do MessageDlg(E.message, mtError, [mbOK], 0);
                    end;
                    I := grdImages.SelectedCols.Next(I);
                until (I < 0) or (grdImages.SelectedCols.Count = 0);
                ShowSetInGrid;

                FillControls;
                EnableButtons;
                if txtName.Enabled then txtName.SetFocus;
            end;
        end;
    finally
        SetNameDlg.Free;
    end;
end;

procedure TtsImageListDlg.txtNameKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Chr(13) then
    begin
        Key := Chr(0);
        HandleNameChange();
        txtName.SelectAll;
    end;
end;

procedure TtsImageListDlg.cmbGlobalSetNameClick(Sender: TObject);
var
    I: integer;
    Temp: string;
begin
    if grdImages.Cols = 0 then
    Begin
        EnableButtons;
        Exit;
    End;

    ShowSetInGrid;
    if VisibleCols(grdImages) = 0 then
        ClearControls
    else
    begin
        Temp := Trim(LowerCase(cmbGlobalSetName.Text));
        if Temp = MainSetName then Temp := '';

        for I := 0 to ImageCollection.Count - 1 do
        begin
            if Trim(LowerCase(ImageCollection[I].SetName)) = Temp then
            begin
                grdImages.CurrentCell.MoveTo(I + 1 ,1);
                Break;
            end;
        end;

        grdImages.RefreshData(roNone, rpTopLeft);
        EnableButtons;
        FillControls;
    end;
end;


procedure TtsImageListDlg.butSelectColorClick(Sender: TObject);
var
    I: Integer;
begin
    if HandleNameChange() = False then Exit;

    dlgColor.Color := $FFFFFF and ImageCollection[grdImages.CurrentDataCol - 1].TransparentColor;
    if dlgColor.Execute then
    begin
        shpFixedColor.Brush.Color := dlgColor.Color;

        if grdImages.SelectedCols.Count > 0 then
            I := grdImages.SelectedCols.Next(0)
        else
            I := grdImages.CurrentDataCol;

        repeat
            ImageCollection[I - 1].TransparentColor := dlgColor.Color;
            I := grdImages.SelectedCols.Next(I);
        until (I = -1) or (grdImages.SelectedCols.Count = 0);
        grdImages.RefreshData(roNone, rpNone);
    end;
end;

procedure TtsImageListDlg.optFixedColorClick(Sender: TObject);
var
    FirstColor: Variant;
    I: Integer;
begin
    if not IgnoreChange then
    begin
        if HandleNameChange() = False then Exit;

        butSelectColor.Enabled := True;
        shpFixedColor.Brush.Style := bsSolid;
        shpFixedColor.Pen.Color := clBlack;

        if grdImages.SelectedCols.Count > 0 then
            I := grdImages.SelectedCols.Next(0)
        else
            I := grdImages.CurrentDataCol;

        FirstColor := UnAssigned;
        repeat
            ImageCollection[I - 1].TransparentMode := tmFixed;
            if VarIsEmpty(FirstColor) then
                FirstColor := ImageCollection[I - 1].TransparentColor
            else
                ImageCollection[I - 1].TransparentColor := FirstColor;
            I := grdImages.SelectedCols.Next(i);
        until (I = -1) or (grdImages.SelectedCols.Count = 0);

        shpFixedColor.Brush.Color := FirstColor;
        grdImages.RefreshData(roNone, rpNone);
    end;
end;

procedure TtsImageListDlg.optLowerLeftPixelClick(Sender: TObject);
var
    I: Integer;
begin
    if not IgnoreChange then
    begin
        if HandleNameChange() = False then Exit;

        butSelectColor.Enabled := False;
        shpFixedColor.Brush.Style := bsClear;
        shpFixedColor.Pen.Color := clGrayText;

        if grdImages.SelectedCols.Count > 0 then
            I := grdImages.SelectedCols.Next(0)
        else
            I := grdImages.CurrentDataCol;

        repeat
            ImageCollection[I - 1].TransparentMode := tmAuto;
            I := grdImages.SelectedCols.Next(I);
        until (I = -1) or (grdImages.SelectedCols.Count = 0);
        grdImages.RefreshData(roNone, rpNone);
    end;
end;

procedure TtsImageListDlg.chkTransparentClick(Sender: TObject);
var
    I: Integer;
    FirstColor: Variant;
    FirstMode: Variant;
begin
    if not IgnoreChange then
    begin
        if HandleNameChange() = False then Exit;

        if grdImages.SelectedCols.Count > 0 then
            I := grdImages.SelectedCols.Next(0)
        else
            I := grdImages.CurrentDataCol;

        FirstColor := UnAssigned;
        FirstMode := UnAssigned;
        repeat
            ImageCollection[I - 1].Transparent := chkTransparent.Checked;

            if chkTransparent.Checked then
            begin
                if VarIsEmpty(FirstMode) then
                    FirstMode := ImageCollection[I - 1].TransparentMode
                else
                    ImageCollection[I - 1].TransparentMode := FirstMode;

                if FirstMode = tmFixed then
                begin
                    ImageCollection[I - 1].TransparentMode := tmFixed;
                    if VarIsEmpty(FirstColor) then
                        FirstColor := ImageCollection[I - 1].TransparentColor
                    else
                        ImageCollection[I - 1].TransparentColor := FirstColor;
                end
            end;

            I := grdImages.SelectedCols.Next(i);
        until (I = -1) or (grdImages.SelectedCols.Count = 0);

        grdImages.RefreshData(roNone, rpNone);
        FillControls;
    end;
end;

procedure TtsImageListDlg.butCancelClick(Sender: TObject);
begin
    CloseButtonPressed := True;
end;

procedure TtsImageListDlg.butOKClick(Sender: TObject);
begin
    if HandleNameChange() = False then Exit;

    if (grdImages.SelectedCols.Count > 1) and not InDesignMode then
    begin
        MessageDlg('Only one image can be selected.', mtError, [mbOK], 0);
        Exit;
    end;

    if VarType(ItemIndex) = varString then
    begin
        if VisibleCols(grdImages) <= 0 then
            ItemIndex := ''
        else
            ItemIndex := ImageCollection[grdImages.CurrentDataCol - 1].SetName + '.' + ImageCollection[grdImages.CurrentDataCol - 1].Name
    end
    else
    begin
        if VisibleCols(grdImages) <= 0 then
            ItemIndex := -1
        else
            ItemIndex := grdImages.CurrentDataCol - 1;
    end;

    ModalResult := mrOk;
    CloseButtonPressed := True;
end;

procedure TtsImageListDlg.grdImagesEnter(Sender: TObject);
begin
    HandleNameChange;
end;

procedure TtsImageListDlg.chkTransparentEnter(Sender: TObject);
begin
    HandleNameChange;
end;

procedure TtsImageListDlg.optLowerLeftPixelEnter(Sender: TObject);
begin
    HandleNameChange;
end;

procedure TtsImageListDlg.optFixedColorEnter(Sender: TObject);
begin
    HandleNameChange;
end;

procedure TtsImageListDlg.butSelectColorEnter(Sender: TObject);
begin
    HandleNameChange;
end;

procedure TtsImageListDlg.cmbGlobalSetNameEnter(Sender: TObject);
begin
    HandleNameChange;
end;

end.

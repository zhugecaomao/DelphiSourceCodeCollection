unit TSExampleCombo;

{**********************************************}
{   Top Support                                }
{   TtsGrid Example Component 'TSExampleCombo' }
{   Copyright (c) 1999 Top Support             }
{**********************************************}

{********************************************************************}
{ This unit contains a sample multi column combo box component. It is}
{ defined as a derived component from the TtsGrid component, and     }
{ initialized to look like a combo box component in the Create       }
{ method below. The combo allows for multiple drop down columns, with}
{ all properties available which can normally be used in the grid.   }
{                                                                    }
{ Basically, the combo box is still a TtsGrid, but with only one cell}
{ which is setup as combo drop down. Setting properties for the combo}
{ is the same as for a combo in the TtsGrid. The combo is defined as }
{ a column level combo in the first column, so to access the combo   }
{ properties, you need to access the Col[1].Combo. At design time,   }
{ the properties can be set as you would for a column level combo in }
{ a normal grid.                                                     }
{                                                                    }
{ To use the combo box component, first install it via the           }
{ 'Component|Install Component' menu option. It will be placed on    }
{ the TopGrid component tab. Once installed, the combo box component }
{ can be dropped onto a form, and the TopGrid's component editor can }
{ be used to further customize it.                                   }
{********************************************************************}


interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids_ts, TSGrid, StdCtrls;

type
    TtsExampleCombo = class(TtsGrid)
    private
    protected
        procedure WMSize(var Msg: TWMSize); message WM_SIZE;

        procedure SetCols;
        procedure SetSize(Resize: Boolean);
        procedure DoColCountChanged(OldCount, NewCount: Longint); override;
        procedure ColWidthsChanged; override;
        procedure RowHeightsChanged; override;
    public
        constructor Create(AOwner: TComponent); override;
    published
  end;

procedure Register;

implementation

procedure TtsExampleCombo.WMSize(var Msg: TWMSize);
begin
    SetCols;
    SetSize(True);
end;

procedure TtsExampleCombo.SetSize(Resize: Boolean);
var
    W, I: Integer;
begin
    {Set the width of the columns and the height of the row to fit exactly.}


    W := 1;
    for I := 1 to Cols do
    begin
        W := W + ColWidths[I];
    end;

    if Resize then
    begin
        if W < Width then
        begin
            Col[Cols].Width := Col[Cols].Width + Width - W;
            W := Width;
        end
        else if W > Width then
        begin
            if Col[Cols].Width > W - Width then
            begin
                Col[Cols].Width := Col[Cols].Width - (W - Width);
                W := Width;
            end
            else
            begin
                W := W - Col[Cols].Width;
                Col[Cols].Width := 0;
            end;
        end;
    end;

    if Width <> W then Width := W;

    if Resize then
        RowHeight[1] := Height - 1
    else if Height <> RowHeights[1] + 1 then
        Height := RowHeights[1] + 1;
    DefaultButtonHeight := RowHeight[1] - 5;
end;

procedure TtsExampleCombo.SetCols;
var
    I: Integer;
begin
    {Set the column ButtonTypes to btCombo and assign a combo to the columns.}

    for I := 1 to Cols do
    begin
        Col[I].ButtonType := btCombo;
        Col[I].AssignCombo;
    end;
end;

constructor TtsExampleCombo.Create(AOwner: TComponent);
begin
    {Initialize the grid to appear as a combo box.}

    inherited;

    ScrollBars := ssNone;
    RowBarOn := False;
    HeadingOn := False;
    FlatButtons := False;
    WantTabs := False;
    GridLines := glHorzLines;
    StoreData := True;

    Rows := 1;
    Cols := 1;
    DefaultColWidth := 128;

    SetCols;
    SetSize(False);
end;

procedure TtsExampleCombo.DoColCountChanged(OldCount, NewCount: Longint);
begin
    {Adjust the size of the combo box if the number of columns changes.}

    if NewCount <> OldCount then
    begin
        SetCols;
        SetSize(False);
    end;

    inherited;
end;

procedure TtsExampleCombo.ColWidthsChanged;
begin
    {Adjust the size of the combo box if the widths of the columns change.}

    SetCols;
    SetSize(False);
    inherited;
end;

procedure TtsExampleCombo.RowHeightsChanged;
begin
    {Adjust the size of the combo box if the row height change.}

    SetSize(False);
    inherited;
end;

procedure Register;
begin
  RegisterComponents('TopGrid', [TtsExampleCombo]);
end;

end.

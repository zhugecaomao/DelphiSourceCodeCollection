{*******************************************************}
{                                                       }
{     Top Support Visual Components                     }
{     TopGrid editor components registration unit       }
{                                                       }
{     Copyright (c) 1999, Top Support                   }
{                                                       }
{*******************************************************}

unit TSGEReg;

interface

procedure Register;

implementation

uses
    Classes, TSDesign;

procedure Register;
begin
    RegisterComponents('TopGrid Editor', [TtsGridInspector]);
    RegisterComponents('TopGrid Editor', [TtsComponentEditor]);
end;

end.
 
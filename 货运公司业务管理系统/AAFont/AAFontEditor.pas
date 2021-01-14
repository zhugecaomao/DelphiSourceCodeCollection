{*******************************************************************************

                          AAFont - 平滑特效字体控件包
                          ---------------------------
                           (C)Copyright 2001, 2002
                            与月共舞工作室 周劲羽

            这一控件包是自由软件，您可以遵照自由软件基金会出版的GNU 较
        宽松通用公共许可证协议来修改和重新发布这一程序，或者用许可证的
        第二版，或者（根据您的选择）用任何更新的版本。

            发布这一控件包的目的是希望它有用，但没有任何担保。甚至没有
        适合特定目的而隐含的担保。更详细的情况请参阅 GNU 较宽松通用公
        共许可证。

            您应该已经和控件包一起收到一份 GNU 较宽松通用公共许可证的
        副本。如果还没有，写信给：
            Free Software Foundation, Inc., 59 Temple Place - Suite
        330, Boston, MA 02111-1307, USA.

          原始文件名：AAFontEditor.pas
            单元作者：周劲羽
            下载地址：http://yygw@163.com
            电子邮件：yygw@163.com
            最后更新：2002.07.02

*******************************************************************************}

unit AAFontEditor;
{* |<PRE>
================================================================================
* 软件名称：平滑特效字体控件包
* 单元名称：平滑特效字体属性、组件编辑器单元
* 单元作者：与月共舞工作室  周劲羽
* 下载网址：http://yygw.126.com
* Eamil   ：yygw@163.com; yygw@sina.com
* 开发平台：PWin98SE + Delphi 5.0
* 兼容测试：PWin9X/2000/XP + Delphi 5/6/7 + C++Build 5/6
* 备　　注：
* 最后更新：2002.07.02
================================================================================
|</PRE>}

interface

{$I AAFont.inc}

uses
  Windows, Messages, SysUtils, Classes,
{$IFDEF COMPILER6_UP}
  DesignIntf, DesignEditors;
{$ELSE}
  DsgnIntf;
{$ENDIF}

type

{ TAAEffectProperty }

  TAAEffectProperty = class(TClassProperty)
  {* TAAEffect平滑字体特效参数类属性编辑器，通过它用户可在设计期可视化编辑平滑
     字体特效参数。}
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
  end;

{ TAALabelEditor }

  TAALabelEditor = class(TComponentEditor)
  {* TAALabel及其派生控件的组件编辑器，通过它用户可在设计期可视化编辑平滑
     字体特效参数。}
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

uses
  AAFont, AACtrls, AAFontDialog;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TAAEffect), nil, '', TAAEffectProperty);
  RegisterComponentEditor(TAALabel, TAALabelEditor);
end;

resourcestring
  SAAEffect = '平滑特效字体';
  SAALabelVert = '设置平滑特效字体(&F)...';

{ TAAEffectProperty }

type
  TAAEffectAccess = class(TAAEffect);

procedure TAAEffectProperty.Edit;
var
  AEffect: TAAEffect;
  FontLabel: TFontLabel;
begin
  AEffect := TAAEffect(Pointer(GetOrdValue));
  with TAAFontDialog.Create(nil) do
  try
    if (PropCount = 1) and (TAAEffectAccess(AEffect).GetOwner is TFontLabel) then
    begin
      FontLabel := TFontLabel(TAAEffectAccess(AEffect).GetOwner);
      AllowChangeFont := True;
      Font.Assign(FontLabel.Font);
    end
    else
    begin
      FontLabel := nil;
      AllowChangeFont := False;
    end;
    Effect.Assign(AEffect);
    if Execute then
    begin
      SetOrdValue(Integer(Effect));
      if FontLabel <> nil then
        FontLabel.Font.Assign(Font);
    end;
  finally
    Free;
  end;
end;

function TAAEffectProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paSubProperties, paDialog, paReadOnly, paMultiSelect];
end;

function TAAEffectProperty.GetValue: string;
begin
  Result := SAAEffect;
end;

{ TAALabelEditor }

procedure TAALabelEditor.ExecuteVerb(Index: Integer);
var
  Ctrl: TAALabel;
begin
  if Index = 0 then
  begin
    if Component is TAALabel then
    begin
      Ctrl := TAALabel(Component);
      with TAAFontDialog.Create(nil) do
      try
        AllowChangeFont := True;
        Font.Assign(Ctrl.Font);
        Effect.Assign(Ctrl.Effect.FontEffect);
        if Execute then
        begin
          Ctrl.Font.Assign(Font);
          Ctrl.Effect.FontEffect := Effect;
          Designer.Modified;
        end;
      finally
        Free;
      end;
    end;
  end
  else
    inherited;
end;

function TAALabelEditor.GetVerb(Index: Integer): string;
begin
  if Index = 0 then
    Result := SAALabelVert
  else
    Result := inherited GetVerb(Index);
end;

function TAALabelEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.


object Form1: TForm1
  Left = 256
  Top = 220
  Width = 343
  Height = 163
  Caption = #36828#31243#25235#23631'-server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 56
    Width = 220
    Height = 24
    Caption = #36828#31243#25235#23631#65306#26381#21153#22120#31471#31243#24207
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 1234
    ServerType = stNonBlocking
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    OnClientError = ServerSocket1ClientError
    Left = 272
    Top = 24
  end
end

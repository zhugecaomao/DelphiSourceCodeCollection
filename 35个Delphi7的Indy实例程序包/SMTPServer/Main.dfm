object frmSmtpServer: TfrmSmtpServer
  Left = 193
  Top = 149
  BorderStyle = bsSingle
  Caption = 'IdSMTPServer Demo'
  ClientHeight = 276
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 16
    Height = 13
    Caption = 'To:'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 26
    Height = 13
    Caption = 'From:'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 39
    Height = 13
    Caption = 'Subject:'
  end
  object ToLabel: TLabel
    Left = 56
    Top = 48
    Width = 3
    Height = 13
  end
  object FromLabel: TLabel
    Left = 56
    Top = 64
    Width = 3
    Height = 13
  end
  object SubjectLabel: TLabel
    Left = 56
    Top = 80
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 8
    Top = 237
    Width = 290
    Height = 26
    Caption = 
      'Remeber to set the SMTPServer property "ReceiveMode" to the appr' +
      'opriate type'
    WordWrap = True
  end
  object Memo1: TMemo
    Left = 8
    Top = 96
    Width = 361
    Height = 137
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 228
    Top = 7
    Width = 65
    Height = 25
    Caption = 'Server on'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 301
    Top = 7
    Width = 65
    Height = 25
    Caption = 'Server off'
    TabOrder = 2
    OnClick = Button2Click
  end
  object IdSMTPServer: TIdSMTPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 25
    Greeting.NumericCode = 220
    Greeting.Text.Strings = (
      'Welcome to the INDY SMTP Server')
    Greeting.TextCode = '220'
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 500
    ReplyUnknownCommand.Text.Strings = (
      'Syntax Error')
    ReplyUnknownCommand.TextCode = '500'
    AuthMode = False
    Messages.NoopReply = 'Ok'
    Messages.RSetReply = 'Ok'
    Messages.QuitReply = 'Signing Off'
    Messages.ErrorReply = 'Syntax Error - Command not understood: %s'
    Messages.XServer = 'Indy SMTP Server'
    Messages.ReceivedHeader = 'by DNSName [127.0.0.1] running Indy SMTP'
    Messages.SyntaxErrorReply = 'Syntax Error - Command not understood: %s'
    Messages.Greeting.EHLONotSupported = 'Command Not Recognised'
    Messages.Greeting.HelloReply = 'Hello %s'
    Messages.Greeting.NoHello = 'Polite people say HELO'
    Messages.Greeting.AuthFailed = 'Authentication Failed'
    Messages.Greeting.EHLOReply.Strings = (
      '250-w2ksrv'
      '250-AUTH LOGIN'
      '250 HELP')
    Messages.RcpReplies.AddressOkReply = '%s Address Okay'
    Messages.RcpReplies.AddressErrorReply = '%s Address Error'
    Messages.RcpReplies.AddressWillForwardReply = 'User not local, Will forward'
    Messages.DataReplies.StartDataReply = 'Start mail input; end with <CRLF>.<CRLF>'
    Messages.DataReplies.EndDataReply = 'Ok'
    OnReceiveRaw = IdSMTPServerReceiveRaw
    OnReceiveMessage = IdSMTPServerReceiveMessage
    OnReceiveMessageParsed = IdSMTPServerReceiveMessageParsed
    ReceiveMode = rmRaw
    AllowEHLO = False
    NoDecode = False
    NoEncode = False
    OnCommandRCPT = IdSMTPServerCommandRCPT
    OnCommandMAIL = IdSMTPServerCommandMAIL
    RawStreamType = stFileStream
    OnCommandHELP = IdSMTPServerCommandHELP
    OnCommandSOML = IdSMTPServerCommandSOML
    OnCommandSEND = IdSMTPServerCommandSEND
    OnCommandSAML = IdSMTPServerCommandSAML
    OnCommandVRFY = IdSMTPServerCommandVRFY
    OnCommandTURN = IdSMTPServerCommandTURN
    Left = 62
    Top = 146
  end
end

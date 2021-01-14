object QMSVC: TQMSVC
  OldCreateOrder = False
  DisplayName = 'Qemu Manager Service'
  Interactive = True
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 192
  Top = 168
  Height = 503
  Width = 721
  object SysTimer: TTimer
    Enabled = False
    OnTimer = SysTimerTimer
    Left = 325
    Top = 121
  end
end

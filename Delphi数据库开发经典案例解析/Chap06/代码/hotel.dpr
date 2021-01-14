program hotel;

uses
  Forms,
  MainForm in 'MainForm.pas' {Main},
  ParentForm in 'ParentForm.pas' {Parent},
  RoomTypeForm in 'RoomTypeForm.pas' {RoomType},
  RoomInfoForm in 'RoomInfoForm.pas' {RoomInfo},
  ReservationForm in 'ReservationForm.pas' {Reservation},
  DebtForm in 'DebtForm.pas' {Debt},
  RoomStatusForm in 'RoomStatusForm.pas' {RoomStatus},
  ResideForm in 'ResideForm.pas' {Reside},
  CheckOutForm in 'CheckOutForm.pas' {CheckOut};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '酒店管理系统';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.

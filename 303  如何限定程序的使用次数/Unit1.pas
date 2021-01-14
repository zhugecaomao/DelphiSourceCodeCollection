unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Registry;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var 
    re_id:integer;
    registerTemp : TRegistry;
    inputstr,get_id:string;
    dy,clickedok:boolean; 
begin
  dy:=false; //软件是否已到注册期、及是否允许继续使用的标志，当值为FALSE是为允许使用。
  registerTemp := TRegistry.Create; //准备使用注册表
  with registerTemp do
  begin
    RootKey:=HKEY_LOCAL_MACHINE; //存放在此根下
    if OpenKey('Software\Microsoft\Windows\CurrentVersion\Mark',True) then
     // 建一目录，存放标志值。
      begin
          if valueexists('gc_id') then begin //用gc_id的值作为标志，首先判断其是否存在
              re_id:=readinteger('gc_id');//读出标志值
              if (re_id<>0) and (re_id<>100) then begin //若标志值为0，则说明已注册。
              //若不为0且值不到100,说明虽未注册，但允许使用的次数尚未达到。
                re_id:=re_id+5; //允许标志的最大值为100，每次加5，则最多只可用20次。
                Writeinteger('gc_id',re_id);//将更新后的标志值写入注册表中。
          end;
          if re_id=100 then dy:=true; //假如值已到100，则应注册。
        end
      else Writeinteger('gc_id',5);//建立标志，并置初始标志值。
    end;
    if dy then begin //若dy值为TRUE，则应提示用户输入注册码，进行注册。
        clickedok:=InputQuery('您使用的是注册软件,请输入注册码：',' ',inputstr);
        if clickedok then begin
            get_id:=inttostr(27593758*2);//注册码为55187516
            if get_id=inputstr then begin
                Writeinteger('gc_id',0);//若输入的注册码正确，则将标志值置为0,即已注册。
                CloseKey;
                Free;
              end
            else begin //若输入的注册码错误，应作出提示并拒绝让其继续使用
                application.messagebox('注册码错误!请与作者联系!','警告框',mb_ok);
                CloseKey;
                Free;
                application.terminate; //中止程序运行，拒绝让其继续使用
            end;
            end
        else begin //若用户不输入注册码，也应作出提示并拒绝让其继续使用
            application.messagebox('请与作者联系，使用注册软件!','警告框',mb_ok);
            CloseKey;
            Free;
            application.terminate;
        end;
    end;
  end;
end;


end.

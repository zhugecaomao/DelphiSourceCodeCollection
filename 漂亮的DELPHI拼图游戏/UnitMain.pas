unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, ExtCtrls, jpeg;

type
  TsomeInts = 0..9;
  ToneSet = set of TsomeInts;
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    F1: TMenuItem;
    N1: TMenuItem;
    L1: TMenuItem;
    X1: TMenuItem;
    S1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    H1: TMenuItem;
    N4: TMenuItem;
    Bevel1: TBevel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    IT1: TMenuItem;
    N10: TMenuItem;
    p1: TImage;
    p2: TImage;
    p3: TImage;
    p4: TImage;
    p5: TImage;
    p6: TImage;
    p7: TImage;
    p8: TImage;
    p9: TImage;
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    p10: TImage;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Button2: TButton;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    Edit2: TEdit;
    StaticText6: TStaticText;
    GroupBox4: TGroupBox;
    Button1: TButton;
    Edit1: TEdit;
    Edit3: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure IT1Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);


  private
    { Private declarations }
    procedure RefreshPic();
    procedure IsWon();
    procedure RandomRank();
    procedure SetPic(image:Timage;PicNO:integer);
    function AutoRun(imageNum:integer):integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
    RandomRank();   //自己写的算法


    {这里是csdn上的兄弟给的算法
    procedure TForm1.Button1Click(Sender: TObject);
    var
        arri :Array[0..9] of Integer;
        i,j,k: integer;
    begin
        Randomize;
        for i := 0 to 9 do
        arri[i] := i;

        for i := 0 to 9 do
        begin
           j := random(10);
           k := arri[i];
           arri[i] := arri[j];
           arri[j] := k;
        end;

       for i := 0 to 9 do
         begin
            ListBox1.Items.Add(InttoStr(arri[i]));

        end;
end;

    }
end;

procedure TForm1.N5Click(Sender: TObject);          //载入相应的图像
begin
    p1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_1.jpg');
    p2.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_2.jpg');
    p3.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_3.jpg');
    p4.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_4.jpg');
    p5.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_5.jpg');
    p6.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_6.jpg');
    p7.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_7.jpg');
    p8.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_8.jpg');
    p9.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphizhu_9.jpg');
    RefreshPic();
end;

procedure TForm1.RefreshPic();                      //每次重新载入图像之后刷新图像的显示
begin
    image1.Picture:=p1.Picture;
    image2.Picture:=p2.Picture;
    image3.Picture:=p3.Picture;
    image4.Picture:=p4.Picture;
    image5.Picture:=p5.Picture;
    image6.Picture:=p6.Picture;
    image7.Picture:=p7.Picture;
    image8.Picture:=p8.Picture;
    image9.Picture:=p9.Picture;
    image1.Hint:='1';                               //用hint来保存图像的排列顺序的
    image2.Hint:='2';
    image3.Hint:='3';
    image4.Hint:='4';
    image5.Hint:='5';
    image6.Hint:='6';
    image7.Hint:='7';
    image8.Hint:='8';
    image9.Hint:='9';
    image10.Hint:='0';
    image10.Picture:=p10.Picture;

end;

procedure TForm1.IsWon();                                    //判断游戏者是否胜利
begin
    //
    if (image1.Hint = '1') and (image2.Hint = '2') and (image3.Hint = '3') and (image4.Hint = '4') and (image5.Hint = '5') and (image6.Hint = '6') and (image7.Hint = '7') and (image8.Hint = '8') and (image9.Hint = '9') then
    begin
        MessageBox(0, '恭喜你！你完成了。', '胜利', MB_OK);
    end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
    p1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_1.jpg');
    p2.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_2.jpg');
    p3.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_3.jpg');
    p4.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_4.jpg');
    p5.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_5.jpg');
    p6.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_6.jpg');
    p7.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_7.jpg');
    p8.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_8.jpg');
    p9.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphiMN_9.jpg');
    RefreshPic();
end;

procedure TForm1.N7Click(Sender: TObject);
begin
    p1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_1.jpg');
    p2.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_2.jpg');
    p3.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_3.jpg');
    p4.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_4.jpg');
    p5.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_5.jpg');
    p6.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_6.jpg');
    p7.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_7.jpg');
    p8.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_8.jpg');
    p9.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphimm_9.jpg');
    RefreshPic();
end;

procedure TForm1.N8Click(Sender: TObject);
begin
    p1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_1.jpg');
    p2.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_2.jpg');
    p3.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_3.jpg');
    p4.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_4.jpg');
    p5.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_5.jpg');
    p6.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_6.jpg');
    p7.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_7.jpg');
    p8.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_8.jpg');
    p9.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphihe_9.jpg');
    RefreshPic();
end;

procedure TForm1.N9Click(Sender: TObject);
begin
    p1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_1.jpg');
    p2.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_2.jpg');
    p3.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_3.jpg');
    p4.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_4.jpg');
    p5.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_5.jpg');
    p6.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_6.jpg');
    p7.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_7.jpg');
    p8.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_8.jpg');
    p9.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphifu_9.jpg');
    RefreshPic();
end;

procedure TForm1.IT1Click(Sender: TObject);
begin
    p1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_1.jpg');
    p2.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_2.jpg');
    p3.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_3.jpg');
    p4.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_4.jpg');
    p5.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_5.jpg');
    p6.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_6.jpg');
    p7.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_7.jpg');
    p8.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_8.jpg');
    p9.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphichuan_9.jpg');
    RefreshPic();
end;

procedure TForm1.N10Click(Sender: TObject);
begin
    p1.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_1.jpg');
    p2.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_2.jpg');
    p3.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_3.jpg');
    p4.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_4.jpg');
    p5.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_5.jpg');
    p6.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_6.jpg');
    p7.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_7.jpg');
    p8.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_8.jpg');
    p9.Picture.LoadFromFile(ExtractFilePath(application.ExeName) +'\images\delphibao_9.jpg');
    RefreshPic();
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
    if image2.Hint = '0' then                //如果image2是没有图像的区域，就移过去
      begin
          image2.Picture:=image1.Picture;
          image1.Picture:=p10.Picture;
          image2.Hint:=image1.Hint;
          image1.Hint:='0';
      end;
    if image4.Hint = '0' then
      begin
          image4.Picture:=image1.Picture;
          image1.Picture:=p10.Picture;
          image4.Hint:=image1.Hint;
          image1.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
    if image1.Hint = '0' then
      begin
          image1.Picture:=image2.Picture;
          image2.Picture:=p10.Picture;
          image1.Hint:=image2.Hint;
          image2.Hint:='0';
      end;
    if image5.Hint = '0' then
      begin
          image5.Picture:=image2.Picture;
          image2.Picture:=p10.Picture;
          image5.Hint:=image2.Hint;
          image2.Hint:='0';
      end;
    if image3.Hint = '0' then
      begin
          image3.Picture:=image2.Picture;
          image2.Picture:=p10.Picture;
          image3.Hint:=image2.Hint;
          image2.Hint:='0';
      end;
      IsWon();
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
    if image2.Hint = '0' then
      begin
          image2.Picture:=image3.Picture;
          image3.Picture:=p10.Picture;
          image2.Hint:=image3.Hint;
          image3.Hint:='0';
      end;
    if image6.Hint = '0' then
      begin
          image6.Picture:=image3.Picture;
          image3.Picture:=p10.Picture;
          image6.Hint:=image3.Hint;
          image3.Hint:='0';
      end;
    if image10.Hint = '0' then
      begin
          image10.Picture:=image3.Picture;
          image3.Picture:=p10.Picture;
          image10.Hint:=image3.Hint;
          image3.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
    if image3.Hint = '0' then
      begin
          image3.Picture:=image10.Picture;
          image10.Picture:=p10.Picture;
          image3.Hint:=image10.Hint;
          image10.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
    if image1.Hint = '0' then
      begin
          image1.Picture:=image4.Picture;
          image4.Picture:=p10.Picture;
          image1.Hint:=image4.Hint;
          image4.Hint:='0';
      end;
    if image5.Hint = '0' then
      begin
          image5.Picture:=image4.Picture;
          image4.Picture:=p10.Picture;
          image5.Hint:=image4.Hint;
          image4.Hint:='0';
      end;
    if image7.Hint = '0' then
      begin
          image7.Picture:=image4.Picture;
          image4.Picture:=p10.Picture;
          image7.Hint:=image4.Hint;
          image4.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
    if image2.Hint = '0' then
      begin
          image2.Picture:=image5.Picture;
          image5.Picture:=p10.Picture;
          image2.Hint:=image5.Hint;
          image5.Hint:='0';
      end;
    if image4.Hint = '0' then
      begin
          image4.Picture:=image5.Picture;
          image5.Picture:=p10.Picture;
          image4.Hint:=image5.Hint;
          image5.Hint:='0';
      end;
    if image8.Hint = '0' then
      begin
          image8.Picture:=image5.Picture;
          image5.Picture:=p10.Picture;
          image8.Hint:=image5.Hint;
          image5.Hint:='0';
      end;
    if image6.Hint = '0' then
      begin
          image6.Picture:=image5.Picture;
          image5.Picture:=p10.Picture;
          image6.Hint:=image5.Hint;
          image5.Hint:='0';
      end;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
    if image3.Hint = '0' then
      begin
          image3.Picture:=image6.Picture;
          image6.Picture:=p10.Picture;
          image3.Hint:=image6.Hint;
          image6.Hint:='0';
      end;
    if image5.Hint = '0' then
      begin
          image5.Picture:=image6.Picture;
          image6.Picture:=p10.Picture;
          image5.Hint:=image6.Hint;
          image6.Hint:='0';
      end;
    if image9.Hint = '0' then
      begin
          image9.Picture:=image6.Picture;
          image6.Picture:=p10.Picture;
          image9.Hint:=image6.Hint;
          image6.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
    if image4.Hint = '0' then
      begin
          image4.Picture:=image7.Picture;
          image7.Picture:=p10.Picture;
          image4.Hint:=image7.Hint;
          image7.Hint:='0';
      end;
    if image8.Hint = '0' then
      begin
          image8.Picture:=image7.Picture;
          image7.Picture:=p10.Picture;
          image8.Hint:=image7.Hint;
          image7.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
    if image5.Hint = '0' then
      begin
          image5.Picture:=image8.Picture;
          image8.Picture:=p10.Picture;
          image5.Hint:=image8.Hint;
          image8.Hint:='0';
      end;
    if image7.Hint = '0' then
      begin
          image7.Picture:=image8.Picture;
          image8.Picture:=p10.Picture;
          image7.Hint:=image8.Hint;
          image8.Hint:='0';
      end;
    if image9.Hint = '0' then
      begin
          image9.Picture:=image8.Picture;
          image8.Picture:=p10.Picture;
          image9.Hint:=image8.Hint;
          image8.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
    if image6.Hint = '0' then
      begin
          image6.Picture:=image9.Picture;
          image9.Picture:=p10.Picture;
          image6.Hint:=image9.Hint;
          image9.Hint:='0';
      end;
    if image8.Hint = '0' then
      begin
          image8.Picture:=image9.Picture;
          image9.Picture:=p10.Picture;
          image8.Hint:=image9.Hint;
          image9.Hint:='0';
      end;
    IsWon();
end;

procedure TForm1.RandomRank();
var  MyArray: array[1..9] of Integer;
     I,temp:integer;
     MySet:ToneSet;
begin
    //   用随机函数打乱图片的排列顺序
    {首先随机产生一个1~9的整数数组，然后根据数组的值来给每个图片赋值}
    edit1.Text:='';
    image10.Picture:=p10.Picture;
    image10.Hint:='0';
    MySet:=[0];
    randomize;
    for I:=1 to 9 do
    begin
         repeat
            temp:=random(10);
         until not (temp in MySet);
         Include(MySet,temp);
         MyArray[I]:=temp;
    end;
    {将image3换成3}
    for I:=1 to 9 do
    begin
        if MyArray[I] = 3 then
        begin
            MyArray[I]:=MyArray[3];
            MyArray[3]:=3;
        end;
    end;
    {将随机数组表示出来}
    for I:=1 to 9 do
    begin
        edit1.Text:=edit1.Text + IntToStr(MyArray[I]);
    end;


    {根据随机数组打乱图片次序}
    SetPic(image1,Myarray[1]);
    SetPic(image2,Myarray[2]);
    SetPic(image3,Myarray[3]);
    SetPic(image4,Myarray[4]);
    SetPic(image5,Myarray[5]);
    SetPic(image6,Myarray[6]);
    SetPic(image7,Myarray[7]);
    SetPic(image8,Myarray[8]);
    SetPic(image9,Myarray[9]);


end;

procedure TForm1.SetPic(image:Timage;PicNO:integer);
begin
    case PicNO of
    1:
      begin
           image.Picture:=p1.Picture;
           image.Hint:='1';
      end;
    2:
      begin
           image.Picture:=p2.Picture;
           image.Hint:='2';
      end;
    3:
      begin
           image.Picture:=p3.Picture;
           image.Hint:='3';
      end;
    4:
      begin
           image.Picture:=p4.Picture;
           image.Hint:='4';
      end;
    5:
      begin
           image.Picture:=p5.Picture;
           image.Hint:='5';
      end;
    6:
      begin
           image.Picture:=p6.Picture;
           image.Hint:='6';
      end;
    7:
      begin
           image.Picture:=p7.Picture;
           image.Hint:='7';
      end;
    8:
      begin
           image.Picture:=p8.Picture;
           image.Hint:='8';
      end;
    9:
      begin
           image.Picture:=p9.Picture;
           image.Hint:='9';
      end;
end;
end;

procedure TForm1.X1Click(Sender: TObject);
begin
    close;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
    RandomRank();
end;

procedure TForm1.Button2Click(Sender: TObject);
var I,J:integer;
begin
    button3.Height:=73;
    button3.Enabled:=True;
{先产生一个随机步数}
    RefreshPic();//每次先让图片归位
    J:=10;
    for I:=0 to 50 do
    begin
        edit3.Text:=edit3.Text+IntToStr(J)+'->';
        J:=AutoRun(J);
    end;
    edit3.Text:=edit3.Text+IntToStr(J);
end;

function TForm1.AutoRun(imageNum:integer):integer;       //自动随机挪动一张图片
var tempRandom:integer;
begin
    randomize;
    case imageNum of
    1:               {如果是第一张图片}
    begin
        tempRandom:=random(2);
        case tempRandom of
        0:         {与2交换}
        begin
            image1.Picture:=image2.Picture;
            image1.Hint:=image2.Hint;
            image2.Picture:=p10.Picture;
            image2.Hint:='0';
            result:=2;               {返回交换结果，那张图片被换成空的}
        end;
        1:         {与4交换}
        begin
            image1.Picture:=image4.Picture;
            image1.Hint:=image4.Hint;
            image4.Picture:=p10.Picture;
            image4.Hint:='0';
            result:=4;
        end;
        end;
    end;
    2:
    begin
        tempRandom:=random(3);
        case tempRandom of
        0:
        begin
            image2.Picture:=image1.Picture;
            image2.Hint:=image1.Hint;
            image1.Picture:=p10.Picture;
            image1.Hint:='0';
            result:=1;
        end;
        1:
        begin
            image2.Picture:=image5.Picture;
            image2.Hint:=image5.Hint;
            image5.Picture:=p10.Picture;
            image5.Hint:='0';
            result:=5;
        end;
        2:
        begin
            image2.Picture:=image3.Picture;
            image2.Hint:=image3.Hint;
            image3.Picture:=p10.Picture;
            image3.Hint:='0';
            result:=3;
        end;
        end;
    end;
    3:
    begin
        tempRandom:=random(2);
        case tempRandom of
        0:         {与2交换}
        begin
            image3.Picture:=image2.Picture;
            image3.Hint:=image2.Hint;
            image2.Picture:=p10.Picture;
            image2.Hint:='0';
            result:=2;               {返回交换结果，那张图片被换成空的}
        end;
        1:         {与6交换}
        begin
            image3.Picture:=image6.Picture;
            image3.Hint:=image6.Hint;
            image6.Picture:=p10.Picture;
            image6.Hint:='0';
            result:=6;
        end;
        end;
    end;
    4:
    begin
        tempRandom:=random(3);
        case tempRandom of
        0:
        begin
            image4.Picture:=image1.Picture;
            image4.Hint:=image1.Hint;
            image1.Picture:=p10.Picture;
            image1.Hint:='0';
            result:=1;
        end;
        1:
        begin
            image4.Picture:=image5.Picture;
            image4.Hint:=image5.Hint;
            image5.Picture:=p10.Picture;
            image5.Hint:='0';
            result:=5;
        end;
        2:
        begin
            image4.Picture:=image7.Picture;
            image4.Hint:=image7.Hint;
            image7.Picture:=p10.Picture;
            image7.Hint:='0';
            result:=7;
        end;
        end;
    end;
    5:
    begin
        tempRandom:=random(4);
        case tempRandom of
        0:
        begin
            image5.Picture:=image2.Picture;
            image5.Hint:=image2.Hint;
            image2.Picture:=p10.Picture;
            image2.Hint:='0';
            result:=2;
        end;
        1:
        begin
            image5.Picture:=image4.Picture;
            image5.Hint:=image4.Hint;
            image4.Picture:=p10.Picture;
            image4.Hint:='0';
            result:=4;
        end;
        2:
        begin
            image5.Picture:=image6.Picture;
            image5.Hint:=image6.Hint;
            image6.Picture:=p10.Picture;
            image6.Hint:='0';
            result:=6;
        end;
        3:
        begin
            image5.Picture:=image8.Picture;
            image5.Hint:=image8.Hint;
            image8.Picture:=p10.Picture;
            image8.Hint:='0';
            result:=8;
        end;
        end;
    end;
    6:
    begin
        tempRandom:=random(3);
        case tempRandom of
        0:
        begin
            image6.Picture:=image3.Picture;
            image6.Hint:=image3.Hint;
            image3.Picture:=p10.Picture;
            image3.Hint:='0';
            result:=3;
        end;
        1:
        begin
            image6.Picture:=image5.Picture;
            image6.Hint:=image5.Hint;
            image5.Picture:=p10.Picture;
            image5.Hint:='0';
            result:=5;
        end;
        2:
        begin
            image6.Picture:=image9.Picture;
            image6.Hint:=image9.Hint;
            image9.Picture:=p10.Picture;
            image9.Hint:='0';
            result:=9;
        end;
        end;
    end;
    7:
    begin
        tempRandom:=random(2);
        case tempRandom of
        0:         {与8交换}
        begin
            image7.Picture:=image8.Picture;
            image7.Hint:=image8.Hint;
            image8.Picture:=p10.Picture;
            image8.Hint:='0';
            result:=8;               {返回交换结果，那张图片被换成空的}
        end;
        1:         {与4交换}
        begin
            image7.Picture:=image4.Picture;
            image7.Hint:=image4.Hint;
            image4.Picture:=p10.Picture;
            image4.Hint:='0';
            result:=4;
        end;
        end;
    end;
    8:
    begin
        tempRandom:=random(3);
        case tempRandom of
        0:
        begin
            image8.Picture:=image7.Picture;
            image8.Hint:=image7.Hint;
            image7.Picture:=p10.Picture;
            image7.Hint:='0';
            result:=7;
        end;
        1:
        begin
            image8.Picture:=image5.Picture;
            image8.Hint:=image5.Hint;
            image5.Picture:=p10.Picture;
            image5.Hint:='0';
            result:=5;
        end;
        2:
        begin
            image8.Picture:=image9.Picture;
            image8.Hint:=image9.Hint;
            image9.Picture:=p10.Picture;
            image9.Hint:='0';
            result:=9;
        end;
        end;
    end;
    9:
    begin
        tempRandom:=random(2);
        case tempRandom of
        0:         {与8交换}
        begin
            image9.Picture:=image8.Picture;
            image9.Hint:=image8.Hint;
            image8.Picture:=p10.Picture;
            image8.Hint:='0';
            result:=8;               {返回交换结果，那张图片被换成空的}
        end;
        1:         {与4交换}
        begin
            image9.Picture:=image6.Picture;
            image9.Hint:=image6.Hint;
            image6.Picture:=p10.Picture;
            image6.Hint:='0';
            result:=6;
        end;
        end;
    end;
    10:
    begin
        image10.Picture:=image3.Picture;
        image10.Hint:=image3.Hint;
        image3.Picture:=p10.Picture;
        image3.Hint:='0';
        result:=3;
    end;
    else
    showmessage('出现未知错误！');

end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    button3.Height:=25;
end;

end.

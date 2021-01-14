unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IdBaseComponent, IdComponent,
  GifImage, Jpeg, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Image1: TImage;
    IdHTTP1: TIdHTTP;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
imagestream:TMemoryStream;
Buffer:Word;
jpg:TjpegImage;
gif:TgifImage;
begin
    image1.Picture.Graphic:=nil  ;
    imagestream := TMemoryStream.Create();
    try
      IdHTTP1.Request.Accept :=  '*/*';
      IdHTTP1.Request.AcceptLanguage := 'zh-cn';
      IdHTTP1.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)';
      IdHTTP1.Request.Connection := 'Keep-Alive';
      IdHTTP1.HTTPOptions:=IdHTTP1.HTTPOptions+[hoKeepOrigProtocol];
      IdHTTP1.ProtocolVersion:=pv1_1;

       try
         idhttp1.Get(Edit1.Text,imagestream);
       except
         showmessage('¡¨Ω” ß∞‹£°');
         exit;
       end;

       imagestream.Position:=0;
       if imagestream.Size = 0 then
        begin
           imagestream.Free;
           ShowMessage('¥ÌŒÛ!');
           exit;
        end;

       imagestream.ReadBuffer(Buffer,2);
       imagestream.Position:=0;

         if Buffer=$4D42 then //bmp
         begin
           image1.Picture.Bitmap.LoadFromStream(imagestream);
         end
         else if Buffer=$D8FF then //jpg
         begin
           ShowMessage('jpg');
           jpg:=TjpegImage.Create;
           jpg.LoadFromStream(imagestream);
           image1.Picture.Assign(jpg);
           jpg.Free;
         end
         else if Buffer=$4947 then  //gif
         begin
           gif:=TGifImage.Create;
           gif.LoadFromStream(imagestream);
           image1.Picture.Assign(gif);
           gif.Free;
         end
         else if Buffer=$050A then
         begin
           ShowMessage('PCX');
         end
         else if Buffer=$5089 then
         begin
           ShowMessage('PNG');
         end
         else if Buffer=$4238 then
         begin
            ShowMessage('PSD');
         end
         else if Buffer=$A659 then
         begin
           ShowMessage('RAS');
         end
         else if Buffer=$DA01 then
         begin
           ShowMessage('SGI');
         end
         else if Buffer=$4949 then
         begin
           ShowMessage('TIFF');
         end
         else  
         begin
           ShowMessage('ERROR');
         end;

    finally
       imagestream.Free;
    end;


end;

end.


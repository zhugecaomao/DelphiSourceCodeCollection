unit UClearHistory;

interface

uses
  Windows, Classes, Controls, Forms, ExtCtrls,
  RzPanel, RzRadGrp, RzButton, RzRadChk;

type
  TFrmClearHistory = class(TForm)
    RzChkGupCleHis: TRzCheckGroup;
    RzChkBoxSelAll: TRzCheckBox;
    RzBtnCleHis: TRzButton;
    RzBtnCleHisCancel: TRzButton;
    procedure RzChkBoxSelAllClick(Sender: TObject);
    procedure RzBtnCleHisClick(Sender: TObject);
    procedure RzBtnCleHisCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClearHistory: TFrmClearHistory;

implementation

uses Registry, ShlObj;

var reg: TRegistry;

{$R *.dfm}

procedure TFrmClearHistory.RzChkBoxSelAllClick(Sender: TObject);
var i:word;
begin //全选 / 全部不选
  case RzChkBoxSelAll.Checked of
  true:  //全选
    for i:=0 to 24 do RzChkGupCleHis.ItemChecked[i]:=true;
  false:  //全部不选
    for i:=0 to 24 do RzChkGupCleHis.ItemChecked[i]:=false;
  end;
end;

procedure TFrmClearHistory.RzBtnCleHisClick(Sender: TObject);
//var reg: TRegistry;
begin //清除
  try
    reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
    if RzChkGupCleHis.ItemChecked[0] then  //Microsoft Word
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      if reg.OpenKey('\Software\Microsoft\Office\8.0\Word\Data',false) then reg.DeleteValue('Settings');
      if reg.OpenKey('\Software\Microsoft\Office\9.0\Word\Data',false) then reg.DeleteValue('Settings');
      if reg.OpenKey('\Software\Microsoft\Office\10.0\Word\Data',false) then reg.DeleteValue('Settings');
      if reg.OpenKey('\Software\Microsoft\Office\11.0\Word\Data',false) then reg.DeleteValue('Settings');
    end;

    if RzChkGupCleHis.ItemChecked[1] then  //Microsoft Excel
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Office\9.0\Excel\Recent Files');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Excel\Recent Files');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Excel\Recent Files');
    end;

    if RzChkGupCleHis.ItemChecked[2] then  //Microsoft PowerPoint
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Office\9.0\PowerPoint\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\10.0\PowerPoint\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\11.0\PowerPoint\Recent File List');
    end;

    if RzChkGupCleHis.ItemChecked[3] then  //Microsoft FrontPage
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent File List');
      reg.DeleteKey('Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent Page List');
      reg.DeleteKey('Software\Microsoft\FrontPage\Explorer\FrontPage Explorer\Recent Web List');
    end;

    if RzChkGupCleHis.ItemChecked[4] then //Microsoft Project
    begin    
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Office\9.0\MS Project\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\10.0\MS Project\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\11.0\MS Project\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Project\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Project\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Project\Settings\另存为\File Name MRU');
    end;

    if RzChkGupCleHis.ItemChecked[5] then  //Microsoft Visio
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office Visio\Settings\插入图片\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office Visio\Settings\插入图片\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office Visio\Settings\插入图片\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office Visio\Settings\打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office Visio\Settings\打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office Visio\Settings\打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office Visio\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office Visio\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office Visio\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office Visio\Settings\浏览模板\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office Visio\Settings\浏览模板\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office Visio\Settings\浏览模板\File Name MRU');
      if reg.OpenKey('\Software\Microsoft\Office\9.0\Visio\Application',false) then
      begin
        reg.DeleteValue('LastFile1'); reg.DeleteValue('LastFile2');
        reg.DeleteValue('LastFile3'); reg.DeleteValue('LastFile4');
        reg.DeleteValue('LastFile5'); reg.DeleteValue('LastFile6');
        reg.DeleteValue('LastFile7'); reg.DeleteValue('LastFile8');
        reg.DeleteValue('LastFile9'); reg.DeleteValue('LastFile10');
      end;
      if reg.OpenKey('\Software\Microsoft\Office\10.0\Visio\Application',false) then
      begin
        reg.DeleteValue('LastFile1'); reg.DeleteValue('LastFile2');
        reg.DeleteValue('LastFile3'); reg.DeleteValue('LastFile4');
        reg.DeleteValue('LastFile5'); reg.DeleteValue('LastFile6');
        reg.DeleteValue('LastFile7'); reg.DeleteValue('LastFile8');
        reg.DeleteValue('LastFile9'); reg.DeleteValue('LastFile10');
      end;
      if reg.OpenKey('\Software\Microsoft\Office\11.0\Visio\Application',false) then
      begin
        reg.DeleteValue('LastFile1'); reg.DeleteValue('LastFile2');
        reg.DeleteValue('LastFile3'); reg.DeleteValue('LastFile4');
        reg.DeleteValue('LastFile5'); reg.DeleteValue('LastFile6');
        reg.DeleteValue('LastFile7'); reg.DeleteValue('LastFile8');
        reg.DeleteValue('LastFile9'); reg.DeleteValue('LastFile10');      
      end;            
    end;

    if RzChkGupCleHis.ItemChecked[6] then  //Microsoft Publisher
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Office\9.0\Publisher\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Publisher\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Publisher\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office Publisher\Settings\打开出版物\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office Publisher\Settings\打开出版物\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office Publisher\Settings\打开出版物\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office Publisher\Settings\导入 Word 文档\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office Publisher\Settings\导入 Word 文档\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office Publisher\Settings\导入 Word 文档\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office Publisher\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office Publisher\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office Publisher\Settings\另存为\File Name MRU');
    end;

    if RzChkGupCleHis.ItemChecked[7] then  //Microsoft InfoPath
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Office\9.0\InfoPath\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\10.0\InfoPath\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\11.0\InfoPath\Recent File List');
      reg.DeleteKey('Software\Microsoft\Office\9.0\InfoPath\Recent Templates');
      reg.DeleteKey('Software\Microsoft\Office\10.0\InfoPath\Recent Templates');
      reg.DeleteKey('Software\Microsoft\Office\11.0\InfoPath\Recent Templates');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office InfoPath\Settings\打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office InfoPath\Settings\打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office InfoPath\Settings\打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office InfoPath\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office InfoPath\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office InfoPath\Settings\另存为\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\9.0\Common\Open Find\Microsoft Office InfoPath\Settings\在设计模式中打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\10.0\Common\Open Find\Microsoft Office InfoPath\Settings\在设计模式中打开\File Name MRU');
      reg.DeleteKey('Software\Microsoft\Office\11.0\Common\Open Find\Microsoft Office InfoPath\Settings\在设计模式中打开\File Name MRU');
    end;

    if RzChkGupCleHis.ItemChecked[8] then  //Windows Media Player
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\MediaPlayer\Player\RecentFileList');
      reg.DeleteKey('Software\Microsoft\MediaPlayer\Player\RecentURLList');
    end;

    if RzChkGupCleHis.ItemChecked[9] then  //RealPlayer
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips1');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips2');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips3');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips4');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips5');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips6');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips7');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\MostRecentClips8');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips1');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips2');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips3');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips4');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips5');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips6');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips7');
      reg.DeleteKey('Software\RealNetworks\RealPlayer\6.0\Preferences\OpenLocationClips8');
    end;

    if RzChkGupCleHis.ItemChecked[10] then  //Dreamweaver MX 2004
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\macromedia\Dreamweaver MX 2004\Recent File List');
    end;

    if RzChkGupCleHis.ItemChecked[11] then  //Flash MX 2004
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\macromedia\Flash 7\Recent File List');
    end;

    if RzChkGupCleHis.ItemChecked[12] then  //Fireworks MX 2004
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\macromedia\Fireworks\7\ini\Recent File List');
    end;

    if RzChkGupCleHis.ItemChecked[13] then  //Delphi
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Borland\Delphi\5.0\Closed Files');
      reg.DeleteKey('Software\Borland\Delphi\6.0\Closed Files');
      reg.DeleteKey('Software\Borland\Delphi\7.0\Closed Files');
      reg.DeleteKey('Software\Borland\Delphi\8.0\Closed Files');
      reg.DeleteKey('Software\Borland\Delphi\9.0\Closed Files');
      reg.DeleteKey('Software\Borland\Delphi\10.0\Closed Files');
      reg.DeleteKey('Software\Borland\Delphi\2005\Closed Files');
      reg.DeleteKey('Software\Borland\Delphi\5.0\Closed Projects');
      reg.DeleteKey('Software\Borland\Delphi\6.0\Closed Projects');
      reg.DeleteKey('Software\Borland\Delphi\7.0\Closed Projects');
      reg.DeleteKey('Software\Borland\Delphi\8.0\Closed Projects');
      reg.DeleteKey('Software\Borland\Delphi\9.0\Closed Projects');
      reg.DeleteKey('Software\Borland\Delphi\10.0\Closed Projects');
      reg.DeleteKey('Software\Borland\Delphi\2005\Closed Projects');
      reg.DeleteKey('Software\Borland\BDS\3.0\Closed Files');
      reg.DeleteKey('Software\Borland\BDS\3.0\Closed Projects');
    end;

    if RzChkGupCleHis.ItemChecked[14] then  //Visual Basic 6.0
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Visual Basic\6.0\RecentFiles');
    end;

    if RzChkGupCleHis.ItemChecked[15] then  //Visual C++ 6.0
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Devstudio\6.0\Recent File List');
      reg.DeleteKey('Software\Microsoft\Devstudio\6.0\最近文件列表    ');
    end;

    if RzChkGupCleHis.ItemChecked[16] then  //PhotoImpact 10.0
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Ulead Systems\Ulead PhotoImpact\10.0\Recent Batch Convert Source Folder');
      reg.DeleteKey('Software\Ulead Systems\Ulead PhotoImpact\10.0\Recent File List');
    end;

    if RzChkGupCleHis.ItemChecked[17] then  //WinRAR
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\WinRAR\ArcHistory');
      reg.DeleteKey('Software\WinRAR\DialogEditHistory');
    end;

    if RzChkGupCleHis.ItemChecked[18] then  //画图
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List');
    end;

    if RzChkGupCleHis.ItemChecked[19] then  //写字板
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List');
    end;

    if RzChkGupCleHis.ItemChecked[20] then  //“浏览”对话框
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU');
    end;

    if RzChkGupCleHis.ItemChecked[21] then  //“运行”
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU');
    end;

    if RzChkGupCleHis.ItemChecked[22] then  //“搜索”
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Search Assistant\ACMru');    
    end;

    if RzChkGupCleHis.ItemChecked[23] then  //最近的文档
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs');
    end;

    if RzChkGupCleHis.ItemChecked[24] then  //IE 地址栏
    begin
      reg:=TRegistry.Create; reg.RootKey:=HKEY_CURRENT_USER;
      reg.DeleteKey('Software\Microsoft\Internet Explorer\TypedUrls');    
    end;

  except //处理异常
    reg.CloseKey; reg.Free;
  end;

  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, NiL, NiL); //刷新
end;

procedure TFrmClearHistory.RzBtnCleHisCancelClick(Sender: TObject);
begin //关闭
  close
end;

end.

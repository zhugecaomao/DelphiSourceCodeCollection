unit Unit1;
//----------------------------------------------------------//
//   新型农村合作医疗慢性病医疗证管理

//   程序简单实用
//   方便的报表模板设计
//   打印机套打

//   数据库采用 Access,文件名称 : YLZ.mdb
//   使用控件 ReportBuilder 7.03 for Delphi 7.0

//   第一次往 盒子 2ccc.com 上传自己做的小东东,感谢大家支持.
//   以后多多交流!

//   Author : thplus
//   Email  : thplus@sina.com
//   QQ     : 419157190
//   2008.06.15

//   如有转载,请保留以上信息!谢谢!
//----------------------------------------------------------//

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ppPrnabl, ppClass, ppCtrls, ppDB,
  ppBands, ppCache, ppEndUsr, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,
  ExtCtrls, ppViewr, ComCtrls, Grids, DBGrids, ppParameter{, ppParameter};

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ADOQSelect: TADOQuery;
    dsSelect: TDataSource;
    ADOQPrint2: TADOQuery;
    ADOQPrint: TADOQuery;
    Panel1: TPanel;
    bbtnSelect: TBitBtn;
    Edit1: TEdit;
    RB01: TRadioButton;
    RB02: TRadioButton;
    Edit2: TEdit;
    RB03: TRadioButton;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    bbtnPrint: TBitBtn;
    CheckBox1: TCheckBox;
    bbtnSave: TBitBtn;
    bbtnExit: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Label11: TLabel;
    ADOQSave: TADOQuery;
    Label12: TLabel;
    Edit11: TEdit;
    bbtnClear: TBitBtn;
    Label13: TLabel;
    Edit12: TEdit;
    BitBtn2: TBitBtn;
    RB04: TRadioButton;
    Edit13: TEdit;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    procedure bbtnSelectClick(Sender: TObject);
    procedure bbtnExitClick(Sender: TObject);
    procedure bbtnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure ModifyDBGrid1Title;
    procedure ADOQSelectAfterScroll(DataSet: TDataSet);
    procedure bbtnSaveClick(Sender: TObject);
    procedure bbtnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WriteLog(ErrStr:String);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit13Enter(Sender: TObject);
    //function InttoFixedStr(i : integer):String;
  private
    { Private declarations }
  public
    { Public declarations }
  yyyymm : String;
  mxb1     : String;
  mxb2     : String;
  mxb3     : String;
  mxb4     : String;
  mxb      : String;

  yx_yy : String;
  yx_mm : String;
  yx_dd : String;

  fz_yyyy : String;
  fz_mm   : String;
  fz_dd   : String;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function InttoFixedStr(i : integer):String;
var
  i_len : integer;
begin
  Result := '0000';
  i_len := Length(inttostr(i));
  if i_len = 1 then
    Result := '000' + inttostr(i);
  if i_len = 2 then
    Result := '00' + inttostr(i);
  if i_len = 3 then
    Result := '0' + inttostr(i);
  if i_len = 4 then
    Result :=  inttostr(i);

end;

procedure TForm1.WriteLog(ErrStr:String);
var
  LogFilename: String;
  LogFile: TextFile;
begin
  LogFilename:=ExtractFilePath(ParamStr(0)) + 'YLZP_' + FormatDateTime('yyyymmdd',Now)+ '.LOG';
  AssignFile(LogFile, LogFilename);
  if FileExists(LogFilename) then Append(LogFile)
  else Rewrite(LogFile);
  Writeln(Logfile,DateTimeToStr(now)+': '+ErrStr);
  CloseFile(LogFile);
end;

procedure TForm1.ModifyDBGrid1Title;
begin
  DBGrid1.Repaint;
  DBGrid1.Columns[0].Visible  := False;
  DBGrid1.Columns[1].Title.Caption := '编号';
  DBGrid1.Columns[1].Width := 40;
  DBGrid1.Columns[2].Title.Caption := '姓名';
  DBGrid1.Columns[2].Width := 50;
  DBGrid1.Columns[3].Title.Caption := '性别';
  DBGrid1.Columns[3].Width := 30;
  DBGrid1.Columns[4].Title.Caption := '年龄';
  DBGrid1.Columns[4].Width := 30;
  DBGrid1.Columns[5].Title.Caption := '乡镇';
  DBGrid1.Columns[5].Width := 50;
  DBGrid1.Columns[6].Title.Caption := '住址';
  DBGrid1.Columns[6].Width := 70;
  DBGrid1.Columns[7].Title.Caption := '医疗证号';
  DBGrid1.Columns[7].Width := 140;
  DBGrid1.Columns[8].Title.Caption := '身份证号';
  DBGrid1.Columns[8].Width := 160;
  DBGrid1.Columns[9].Title.Caption := '病种';
  DBGrid1.Columns[9].Width := 140;
  DBGrid1.Columns[10].Title.Caption := '电话';
  DBGrid1.Columns[10].Width := 100;
  DBGrid1.Columns[11].Title.Caption := '门诊编号';
  DBGrid1.Columns[11].Width := 140;

end;

procedure TForm1.bbtnSelectClick(Sender: TObject);
begin
  if RB01.Checked then
  begin
    with ADOQSelect do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from YiLiaoZheng where YiLiaoZhengHao = :YiLiaoZhengHao';
        Parameters.ParamByName('YiLiaoZhengHao').Value := Trim(Edit1.Text);
        Open;
      end;
  end;
  if RB02.Checked then
  begin
    with ADOQSelect do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from YiLiaoZheng where XingMing = :XingMing';
        Parameters.ParamByName('XingMing').Value := Trim(Edit2.Text);
        Open;
      end;
  end;
  if RB03.Checked then
  begin
    if Trim(ComboBox1.Text) = '--全部--' then
    begin
    with ADOQSelect do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from YiLiaoZheng';
        Open;
      end  
    end
    else
    begin
    with ADOQSelect do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from YiLiaoZheng where XiangZhen = :XiangZhen';
        Parameters.ParamByName('XiangZhen').Value := Trim(ComboBox1.Text);
        Open;
      end;
    end
  end;
  if RB04.Checked then
    begin
    with ADOQSelect do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'select * from YiLiaoZheng where ShenFenZheng = :ShenFenZheng';
        Parameters.ParamByName('ShenFenZheng').Value := Trim(Edit13.Text);
        Open;
      end  
    end;

  ModifyDBGrid1Title;

end;

procedure TForm1.bbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.bbtnPrintClick(Sender: TObject);
var
  yy,mm : String;
  ShenFenZheng : String;
  sTemplateName : String;
begin
  if (not ADOQSelect.Active) or (ADOQSelect.RecordCount <= 0 ) then Exit;

      sTemplateName :=  ExtractFilePath(Paramstr (0)) + 'YLZP.rtm';
      ShenFenZheng := Trim(ADOQSelect.FieldByName('ShenFenZheng').AsString);

      if Length(ShenFenZheng) = 15 then
        begin
          yy := '19' + copy(ShenFenZheng,7,2);
          mm := copy(ShenFenZheng,10,2);
        end;
      if Length(ShenFenZheng) = 18 then
        begin
          yy := copy(ShenFenZheng,7,4);
          mm := copy(ShenFenZheng,11,2);
        end;
      yyyymm := yy + '年' + mm + '月';

      mxb := Trim(ADOQSelect.FieldByName('BingZhong').AsString);
      mxb1 := copy(mxb,1,pos(';',mxb) - 1);
      mxb  := copy(mxb,pos(';',mxb) + 1,length(mxb));
      mxb2 := copy(mxb,1,pos(';',mxb) - 1);
      mxb  := copy(mxb,pos(';',mxb) + 1,length(mxb));
      mxb3 := copy(mxb,1,pos(';',mxb) - 1);
      mxb  := copy(mxb,pos(';',mxb) + 1,length(mxb));
      mxb4 := copy(mxb,1,pos(';',mxb) - 1);
      //showmessage(mxb1 + #13#10 + mxb2 + #13#10 + mxb3 + #13#10 + mxb4);

      yx_yy := FormatDatetime('yy',DateTimePicker1.DateTime);
      yx_mm := FormatDatetime('mm',DateTimePicker1.DateTime);
      yx_dd := FormatDatetime('dd',DateTimePicker1.DateTime);

      fz_yyyy := FormatDatetime('yyyy',DateTimePicker2.DateTime);
      fz_mm   := FormatDatetime('mm',DateTimePicker2.DateTime);
      fz_dd   := FormatDatetime('dd',DateTimePicker2.DateTime);

      //showmessage(yx_yy + #13#10 + yx_mm + #13#10 + yx_dd + #13#10 + fz_yyyy + #13#10 + fz_mm + #13#10 + fz_dd);
      with ADOQPrint do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from Print';
          ExecSQL;
        end;
      with ADOQPrint do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into Print(ID,BianHao,XingMing,XingBie,ChuShengNianYue,NianLing,XiangZhen,ZhuZhi,YiLiaoZhengHao,ShenFenZheng,';
          SQL.Add('BingZhong,mxb1,mxb2,mxb3,mxb4,DianHua,yx_yy,yx_mm,yx_dd,fz_yyyy,fz_mm,fz_dd,MenZhenBianHao)');
          SQL.Add(' values(:ID,:BianHao,:XingMing,:XingBie,:ChuShengNianYue,:NianLing,:XiangZhen,:ZhuZhi,:YiLiaoZhengHao,:ShenFenZheng,');
          SQL.Add(':BingZhong,:mxb1,:mxb2,:mxb3,:mxb4,:DianHua,:yx_yy,:yx_mm,:yx_dd,:fz_yyyy,:fz_mm,:fz_dd,:MenZhenBianHao)');
          Parameters.ParamByName('ID').Value              := ADOQSelect.FieldByName('ID').AsString;
          Parameters.ParamByName('BianHao').Value         := ADOQSelect.FieldByName('BianHao').AsString;
          Parameters.ParamByName('XingMing').Value        := ADOQSelect.FieldByName('XingMing').AsString;
          Parameters.ParamByName('XingBie').Value         := ADOQSelect.FieldByName('XingBie').AsString;
          Parameters.ParamByName('ChuShengNianYue').Value := yyyymm;
          Parameters.ParamByName('NianLing').Value        := ADOQSelect.FieldByName('NianLing').AsInteger;
          Parameters.ParamByName('XiangZhen').Value       := ADOQSelect.FieldByName('XiangZhen').AsString;
          Parameters.ParamByName('ZhuZhi').Value          := ADOQSelect.FieldByName('ZhuZhi').AsString;
          Parameters.ParamByName('YiLiaoZhengHao').Value  := Copy(Trim(ADOQSelect.FieldByName('YiLiaoZhengHao').AsString),7,10); //371312 0401001770
          Parameters.ParamByName('ShenFenZheng').Value    := ADOQSelect.FieldByName('ShenFenZheng').AsString;
          Parameters.ParamByName('BingZhong').Value       := ADOQSelect.FieldByName('BingZhong').AsString;
          Parameters.ParamByName('mxb1').Value            := mxb1;
          Parameters.ParamByName('mxb2').Value            := mxb2;
          Parameters.ParamByName('mxb3').Value            := mxb3;
          Parameters.ParamByName('mxb4').Value            := mxb4;
          Parameters.ParamByName('DianHua').Value         := ADOQSelect.FieldByName('DianHua').AsString;
          Parameters.ParamByName('yx_yy').Value           := yx_yy;
          Parameters.ParamByName('yx_mm').Value           := yx_mm;
          Parameters.ParamByName('yx_dd').Value           := yx_dd;
          Parameters.ParamByName('fz_yyyy').Value         := fz_yyyy;
          Parameters.ParamByName('fz_mm').Value           := fz_mm;
          Parameters.ParamByName('fz_dd').Value           := fz_dd;
          Parameters.ParamByName('MenZhenBianHao').Value  := ADOQSelect.FieldByName('MenZhenBianHao').AsString;;
          ExecSQL;
        end;

  with ADOQPrint2 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from Print';
      Open;
    end;

  if ADOQPrint2.RecordCount = 1 then
    begin
     if FileExists(sTemplateName) then
       begin
         ppReport1.Template.FileName := sTemplateName;
         ppReport1.Template.LoadFromFile;
       end
     else
       begin
         ppReport1.Template.New;
         ppReport1.Template.FileName := sTemplateName;
      end;

      if CheckBox1.Checked then
        ppDesigner1.ShowModal
      else
        begin
          ppReport1.DeviceType := 'Printer';
          ppReport1.ShowPrintDialog := False;
          ppReport1.Print;
          StatusBar1.Panels[0].Text :=  ADOQPrint2.FieldByName('XingMing').AsString + ' 的医疗证已打印.';
          WriteLog(ADOQPrint2.FieldByName('XingMing').AsString + '...'+ '371312' +ADOQPrint2.FieldByName('YiLiaoZhengHao').AsString + ' 的医疗证已打印.');
        end
    end;
    
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Form1.Caption := '新型农村合作医疗慢性病医疗证';
  Edit1.Clear;
  Edit2.Clear;
  ComboBox1.ItemIndex := -1;

  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  Edit9.Clear;
  Edit10.Clear;
  Edit11.Clear;
  Edit12.Clear;
  Edit13.Clear;

  with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select distinct XiangZhen from YiLiaoZheng';
      Open;
    end;

  ComboBox1.Clear;
  ComboBox1.Items.Add('--全部--');
  while not ADOQuery1.Eof do
    begin
      ComboBox1.Items.Add(Trim(ADOQuery1.FieldByName('XiangZhen').AsString));
      ADOQuery1.Next;
    end;

  ADOQuery1.Close;
  RB03.Checked := True;
  ComboBox1.ItemIndex := 0;
  bbtnSelectClick(Sender);
end;

procedure TForm1.Edit2Enter(Sender: TObject);
begin
  RB02.Checked := True;
end;

procedure TForm1.ComboBox1Enter(Sender: TObject);
begin
  rb03.Checked := True;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  rb01.Checked := True;
end;

procedure TForm1.ADOQSelectAfterScroll(DataSet: TDataSet);
begin
  Edit3.Text := Trim(ADOQSelect.FieldByName('XingMing').AsString);
  Edit4.Text := Trim(ADOQSelect.FieldByName('DianHua').AsString);
  Edit5.Text := Trim(ADOQSelect.FieldByName('XiangZhen').AsString);
  Edit6.Text := Trim(ADOQSelect.FieldByName('ZhuZhi').AsString);
  Edit7.Text := Trim(ADOQSelect.FieldByName('YiLiaoZhengHao').AsString);
  Edit8.Text := Trim(ADOQSelect.FieldByName('ShenFenZheng').AsString);
  Edit9.Text := Trim(ADOQSelect.FieldByName('BingZhong').AsString);
  Edit10.Text := Trim(ADOQSelect.FieldByName('XingBie').AsString);
  Edit11.Text := Trim(ADOQSelect.FieldByName('BianHao').AsString);
  Edit12.Text := Trim(ADOQSelect.FieldByName('MenZhenBianHao').AsString);
end;

procedure TForm1.bbtnSaveClick(Sender: TObject);
var
  i_no_ADOQSelect : integer;
  ManXingBing     : String;
begin
  if (ADOQSelect.Active) and (ADOQSelect.RecordCount > 0 ) then
    i_no_ADOQSelect := ADOQSelect.RecNo
  else
    i_no_ADOQSelect := 0;

  if Trim(Edit11.Text) = '' then
    begin
      ShowMessage('编号 不能为空,只能为数字');
      Edit11.SetFocus;
      Exit;
    end;
  if Trim(Edit3.Text) = '' then
    begin
      ShowMessage('姓名 不能为空');
      Edit3.SetFocus;
      Exit;
    end;
  if Trim(Edit10.Text) = '' then
    begin
      ShowMessage('性别 不能为空');
      Edit10.SetFocus;
      Exit;
    end;

  if Trim(Edit5.Text) = '' then
    begin
      ShowMessage('乡镇 不能为空');
      Edit5.SetFocus;
      Exit;
    end;
  if Trim(Edit6.Text) = '' then
    begin
      ShowMessage('住址 不能为空');
      Edit6.SetFocus;
      Exit;
    end;
  if Trim(Edit7.Text) = '' then
    begin
      ShowMessage('医疗证号 不能为空');
      Edit7.SetFocus;
      Exit;
    end;
  if Trim(Edit8.Text) = '' then
    begin
      ShowMessage('身份证号码不能为空');
      Edit8.SetFocus;
      Exit;
    end;
  if Trim(Edit9.Text) = '' then
    begin
      ShowMessage('慢性病种 不能为空');
      Edit9.SetFocus;
      Exit;
    end;
  if Trim(Edit12.Text) = '' then
    begin
      ShowMessage('门诊医疗证编号 不能为空');
      Edit12.SetFocus;
      Exit;
    end;

  if Copy(Trim(Edit9.Text),Length(Trim(Edit9.Text)), 1) <> ';' then
    ManXingBing := Trim(Edit9.Text) + ';'
  else
    ManXingBing := Trim(Edit9.Text);


  with ADOQSave do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'select * from YiLiaoZheng where ShenFenZheng = :ShenFenZheng';
      Parameters.ParamByName('ShenFenZheng').Value := Trim(Edit8.Text);
      Open;
    end;

  if ADOQSave.RecordCount = 0 then       //insert
    begin
      //showmessage('insert');
      with ADOQSave do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'insert into YiLiaoZheng(BianHao,XingMing,XingBie,XiangZhen,ZhuZhi,YiLiaoZhengHao,ShenFenZheng,BingZhong,DianHua,MenZhenBianHao)';
          SQL.Add(' values(:BianHao,:XingMing,:XingBie,:XiangZhen,:ZhuZhi,:YiLiaoZhengHao,:ShenFenZheng,:BingZhong,:DianHua,:MenZhenBianHao)');
          Parameters.ParamByName('BianHao').Value        := Trim(Edit11.Text);
          Parameters.ParamByName('XingMing').Value       := Trim(Edit3.Text);
          Parameters.ParamByName('XingBie').Value        := Trim(Edit10.Text);
          Parameters.ParamByName('XiangZhen').Value      := Trim(Edit5.Text);
          Parameters.ParamByName('ZhuZhi').Value         := Trim(Edit6.Text);
          Parameters.ParamByName('YiLiaoZhengHao').Value := Trim(Edit7.Text);
          Parameters.ParamByName('ShenFenZheng').Value   := Trim(Edit8.Text);
          Parameters.ParamByName('BingZhong').Value      := ManXingBing;
          Parameters.ParamByName('DianHua').Value        := Trim(Edit4.Text);
          Parameters.ParamByName('MenZhenBianHao').Value := Trim(Edit12.Text);
          ExecSQL;
        end;
      bbtnSelectClick(Sender);
      ADOQSelect.MoveBy(i_no_ADOQSelect);
    end
  else if ADOQSave.RecordCount = 1 then       //Update
    begin
      with ADOQSave do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'update YiLiaoZheng set';
          SQL.Add('BianHao = :BianHao,');
          SQL.Add('XingMing = :XingMing,');
          SQL.Add('XingBie = :XingBie,');
          SQL.Add('XiangZhen = :XiangZhen,');
          SQL.Add('ZhuZhi = :ZhuZhi,');
          SQL.Add('YiLiaoZhengHao = :YiLiaoZhengHao,');
          SQL.Add('BingZhong = :BingZhong,');
          SQL.Add('DianHua = :DianHua,');
          SQL.Add('MenZhenBianHao = :MenZhenBianHao');
          SQL.Add(' where ShenFenZheng = :ShenFenZheng');
          Parameters.ParamByName('BianHao').Value        := Trim(Edit11.Text);
          Parameters.ParamByName('XingMing').Value       := Trim(Edit3.Text);
          Parameters.ParamByName('XingBie').Value        := Trim(Edit10.Text);
          Parameters.ParamByName('XiangZhen').Value      := Trim(Edit5.Text);
          Parameters.ParamByName('ZhuZhi').Value         := Trim(Edit6.Text);
          Parameters.ParamByName('YiLiaoZhengHao').Value := Trim(Edit7.Text);
          Parameters.ParamByName('BingZhong').Value      := ManXingBing;
          Parameters.ParamByName('DianHua').Value        := Trim(Edit4.Text);
          Parameters.ParamByName('MenZhenBianHao').Value := Trim(Edit12.Text);
          Parameters.ParamByName('ShenFenZheng').Value   := Trim(Edit8.Text);
          ExecSQL;
        end;
      bbtnSelectClick(Sender);
      ADOQSelect.MoveBy(i_no_ADOQSelect - 1);  
    end
  else if ADOQSave.RecordCount > 1 then      //Error
    begin
      ShowMessage('身份证号码重复太多,请检查!!!');
      Edit8.SetFocus;
      Exit;
    end;
end;

procedure TForm1.bbtnClearClick(Sender: TObject);
begin
  //RB01.Checked := True;
  if not RB01.Checked then
    Edit1.Clear;
  if not RB02.Checked then
    Edit2.Clear;
  if not RB03.Checked then
    ComboBox1.ItemIndex := -1;
  if not RB04.Checked then
    Edit13.Clear;
      
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  Edit9.Clear;
  Edit10.Clear;
  Edit11.Clear;
  Edit12.Clear;
  CheckBox1.Checked := False;
  //ADOQSelect.Close;
  DateTimePicker1.Date := now;
  DateTimePicker2.Date := now;
  //Edit1.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  FileName : String;
begin
  FileName := ExtractFilePath(Paramstr (0)) + 'YLZ.mdb';
  ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + FileName + ';Persist Security Info=true';

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  i_no_ADOQSelect : integer;
begin
  if (not ADOQSelect.Active) or (ADOQSelect.RecordCount <= 0) then Exit;

  i_no_ADOQSelect := ADOQSelect.RecNo;

  if MessageBox(Handle,PChar('确认要删除?' +  #13#10#13#10 + '姓名:' + ADOQSelect.FieldByName('XingMing').AsString + #13#10 + '医疗证号:' + ADOQSelect.FieldByName('YiLiaoZhengHao').AsString),'提示',MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      with ADOQSave do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'delete from YiLiaoZheng where ID =  :ID';
          Parameters.ParamByName('ID').Value := ADOQSelect.FieldByName('ID').AsInteger;
          ExecSQL;
        end;
      bbtnSelectClick(Sender);
      ADOQSelect.MoveBy(i_no_ADOQSelect - 1);
    end
end;

procedure TForm1.Edit13Enter(Sender: TObject);
begin
  RB04.Checked := True;
end;

end.

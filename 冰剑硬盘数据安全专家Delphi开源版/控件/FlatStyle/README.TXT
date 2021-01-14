附带通用控件安装方法：
---------------------
基本安装
1.对于单个控件,COMPONET-->INSTALL COMPONENT..-->PAS或DCU文件-->INSTALL。
2.对于带*.DPK文件的控件包,FILE-->OPEN(下拉列表框中选*.DPK)-->INSTALL即可。
3.对于带*.BPL文件的控件包,INSTALL PACKAGES-->ADD-->BPL文件名即可。
4.如果以上INSTALL按钮为失效的话,试试COMPILE按钮。
5.是RUN TIME LIB则在OPTION下的PACKAGES下的RUNTIMEPACKES加之。
  如果编译时提示文件找不到的话,一般是控件的安装目录不在DELPHI的LIB目录中,
  有两种方法可以解决：
1.反安装的源文件拷入到DELPHI的LIB目录下。
2.或者TOOLS-->ENVIRONMENT OPTIONS中把控件源代码路径加入到DELPHI的LIB目录中即可。

注意：所安装的控件是否与你所用的DELPHI版本相适应。
---------------------
控件删除
1.在COMPONENT/INSTALL PACKAGES中删除。 
2.选COMPONENT/CONFIGURE PALETTE…
3.有PAGES和COMPONENTS两个区域。
4.双击COMPONENTS区域,选中要删除得控件,下面有得DELETE按钮。
5.但系统提供的控件只能HIDE,不能DELETE。
6.打开控件所在的包文件(*.DPK),从中删除控件那个文件,再重新编译该包即可。
7.如果是整个控件包都要删除的话,PROJECT->OPTION->PACKAGES,删掉那个PACKAGES,收工。
---------------------
(***FlatStyle v4.42.8.0 for DELPHI7 by comerose update***)
2007.04.30 更新说明
1.修正 TFlatListView 标题的平面显示(更加完美).
2.增加 TFlatListView 的属性.
       ①ColorTitleFace以实现对标题平面颜色控制.
       ②ColorTitleCheck选择时的CheckBox的颜色控制.
       ③AllCheck对列表进行全选(只在CheckBoxs为True时有效).
         AllCheck=True时全选列表,AllCheck=False取消全选.
       ④GroundPic背景图像来源.
       ⑤GroundHas是否使用画背景图像(在OnDrawBackground事件中无效).
       ⑥GroundStretch是否放缩背景图像(在OnDrawBackground事件中无效).
       ⑦OnDrawBackground自定义重画事件(在GroundHas=false时,事件中有效).
       ⑧在标题中增加一个列表全选按钮(CheckBoxs=true和ViewStyle=vsReport时有效).
  如果你之前的程序在OnCustomDraw中有代码的,
  请把这些代码复制到OnDrawBackground事件中.
3.修正 TFlatListBoxExt 和 TFlatCheckListExt 鼠标进入时的变色.
  (原来版本当列表数目显示区域少于控件区域时,会有部分地方不变色的BUG).
4.优化一些代码。
5.编译说明
  ①首先打开 FlatVcls.dpk 包, 编译.
  ②再次打开 FlatStyle.dpk 包, 编译.
  ③成功!
---------------------
(***FlatStyle v4.42.3 for DELPHI7 by comerose update***)
2007.04.27 更新说明
1.控件TFlatButton,TFlatSpeedButton平面属性说明
    ColorFocused 控件聚焦时的颜色。
    ColorDown    控件按下时的颜色。
    ColorBorder  控件边框颜色。
    ColorShadow  控件按下时边框的颜色。
    ColorFlat    控件界面的颜色。
2.修正按钮控件不能修改界面颜色的BUG.
3.优化一些代码。
4.编译说明
  ①首先打开 FlatVcls.dpk 包, 编译.
  ②再次打开 FlatStyle.dpk 包, 编译.
  ③成功!
---------------------
(***FlatStyle v4.42.2 for DELPHI7 by comerose update***)
2007.04.08 更新说明
1.控件增加
    TFlatDBGrid
    TFlatDrawGrid
    TFlatStringGrid
2.解决编译找不到文件的BUG.
3.重新分类FlatyStyle Vcl,FlatStyle Sys,FlatStyle DB。
4.编译说明
  ①首先打开 FlatVcls.dpk 包, 编译.
  ②再次打开 FlatStyle.dpk 包, 编译.
  ③成功!
---------------------
(***FlatStyle v4.42.1 for DELPHI7 by comerose update***)
2007.04.08 更新说明
1.控件增加
    TFlatRadioGroup 单选组件平面控件!
    TFlatBarcode 条形码平面控件!
    TFlatWater 水波平面控件!
    TFlatExcel 从数据库导出为MS-Excel电子表格控件!
    TFlatImage 配合水波显示的平面控件!
    TFlatListBoxExt 是在原来的ListBox控件基础上修改!
    TFlatCheckListExt 是在原来的CheckListBox控件基础上修改!
2.属性修改:修改原来默认的边界的颜色,我认为是比较舒服的!
3.修正不能在TFrame上放置多个平面控件的BUG!
4.修正有时候在移动鼠标到控件上自动变颜色的BUG!
5.修正多个内存泄漏的BUG!
6.优化和精简代码!
7.一些控件的使用
  ①TFlatExcel
    EduceType。 导出数据类型:dmDefault 为原始数据类型,dmString:全部作为字符类型导出
    EduceDatas。 导出数据字段属性
    DataSource。 导出数据来源数据的集
    EduceTitle。 导出数据时,是否使用标题
    Interval。 关闭导出进度延时时间,单位为毫秒
    ShowProgress。 导出数据时,是否显示导出进度
  ②其他控件略
8.编译说明
  ①首先打开 FlatVcls.dpk 包, 编译.
  ②再次打开 FlatStyle.dpk 包, 编译.
  ③成功!  
---------------------
(***FlatStyle v4.38 for DELPHI7 by comerose update***)
2007.03.06 更新说明
1.增加TFlatListView,TFlatTreeView两个平面控件!
2.修正TFlatInteger,在创建时,找不到父窗口的BUG!
3.修正多个内存泄漏的BUG!
4.优化和精简代码!
5.重新命名一些文件名称,防止其它控件中的相同文件名!
---------------------
(***FlatStyle v4.35 for DELPHI7 by comerose update***)
2007.02.15 更新说明
1.对TFlatFloat输入小数点的修正(原来版本,会输入多个,这个版本不会存在这个问题)
2.对TFlatListBox,TFlatDBListBox,TFlatCheckListBox共有属性更新
  ①去除原来标签捆绑,用新方法实现标签,并可自由控制标签.    
  ②增加滚动条高度控制属性.
  ③增加界面类控制属性,去除4.30版本中样式,取用新方法来方法,并在Skin中设置
  ④对以上ListBox的Skin公有属性说明
    滚动条属性:
    BarStopColor自定开始颜色
    BarStartColor
    BarColor
    BarArrowColor
    BarOrien
    BarUseBitmap
    BarTopBitmap
    BarDownBitmap
    BarsHeight
    列表背景属性:
    BackStopColor
    BackStartColor
    BackdropColor
    BackBitmap
    BackdropOrien
    BackUseBitmap
    选定列属性:  
    ItemStopColor
    ItemStartColor
    ItemSelectColor
    ItemFrameColor
    ItemLineColor
    ItemOrien
    ItemHeight    
    ItemLineHas
    标题属性:
    TitleStartColor
    TitleStopColor
    TitleColor
    TitlePosition
    TitleHeight
    TitleHas    
    TitleOrien    
    TitleUseBitmap
    TitleBitmap
    TitleAlignment
    其它属性:
    Transparent
    UserFace
    ScrollBars
    BorderColor 
  ⑤以下属性只在TFlatListBox,TFlatDBListBox中存在
    ItemAlignment
  ⑥以下属性只在TFlatCheckListBox中存在
    SelectPosition
    SelectColor
    SelectBackdropColor
    SelectBorderColor
    SelectStartColor
    SelectStopColor
    SelectCheckColor
    SelectOrien
    SelectSize
3.功能增加针对TFlatCheckListBox类的控件
  增加快捷键Ctrl+A为全选列表,Ctrl+Z为取消全选列表
4.功能修正TFlatListBox,TFlatDBListBox,TFlatCheckListBox中.
  原来的版本在多行选定存在255行的限制.这个版本中已经修正了!
5.优化和精简代码!
------------------------
(***FlatStyle v4.34 for DELPHI7 by comerose update***)
2007.02.10 更新说明
1.增加用户自定义标签(Label)控制选项。
  可以在FlatUtilitys.pas单元中,设置DefaultHasTicket的值(True为显示,False为禁止)是
  否标签显示。但是要重新编译FlatStyle.dpk工程,这个设置才能生效。
2.对TFlatColorBox增加Language属性,进行设置颜色的中英文名称。
  ---------------------
  对TFlatGauge增加下面属性：
     StyleFace为界面样式。
     StyleColorStart为界面渐变开始颜色。
     StyleColorStop为界面渐变结束颜色。
     StyleOrien为渐变颜色方向。
     TextAfrer为进度提示后文字属性。
     TextFront为进度提示前文字属性。
  ---------------------   
  对TFlatListBox,TFlatCheckListBox,TFlatDBListBox增加下面属性：
     StyleFace为界面样式。
     StyleOrien为滚动条渐变颜色方向。     
     StyleColorStart为滚动条渐变开始颜色。
     StyleColorStop为滚动条渐变结束颜色。
     StyleSelect为选定条渐变颜色方向。
     StyleItemColorStart为选定条渐变开始颜色。
     StyleItemColorStop为选定条渐变开始颜色。
     以控制界面样式。
     并修改ScrollBars的默认值为True。并增加焦点框！
  ---------------------
  对控件标签属性：
     Ticket为标签属性集合。
     TicketPosition为标签位置属性。
     TictetSpace为标签距离控件属性。
3.优化部分代码。 
---------------------
(***FlatStyle v4.32 for DELPHI7 by comerose update***)
2007.02.04 更新部分说明
1.修正一些BUG。
2.在大部分控件增加标签(Label)。
3.在编辑类控件中增加功能输入提示功能(通过Hint属性来控制,Hint为空时不显示,否则
  显示,在运行期显示)。
4.增加了一个FlatIPEdit。
---------------------
(***FlatStyle v4.30 for DELPHI7 by comerose update***)
修正及功能增加:
2006.12.30 更新说明
增加D7版本的编译开关,以支持D7版本。  
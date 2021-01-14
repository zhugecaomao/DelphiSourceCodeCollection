object frmMain: TfrmMain
  Left = 240
  Top = 147
  Width = 577
  Height = 475
  Caption = #32593#32476#25506#32034#32773'   v1.1 '
  Color = clBtnFace
  Constraints.MaxHeight = 475
  Constraints.MaxWidth = 577
  Constraints.MinHeight = 475
  Constraints.MinWidth = 577
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 569
    Height = 428
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TabWidth = 65
    object TabSheet1: TTabSheet
      Caption = #31471#21475#25195#25551
      OnHide = TabSheet1Hide
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 11
        Top = 8
        Width = 76
        Height = 13
        AutoSize = False
        Caption = #24320#22987#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label2: TLabel
        Left = 11
        Top = 30
        Width = 72
        Height = 13
        AutoSize = False
        Caption = #32467#26463#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label3: TLabel
        Left = 8
        Top = 61
        Width = 76
        Height = 13
        AutoSize = False
        Caption = #25195#25551#32467#26524':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label4: TLabel
        Left = 292
        Top = 91
        Width = 71
        Height = 13
        AutoSize = False
        Caption = #31471#21475#21015#34920':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label5: TLabel
        Left = 294
        Top = 65
        Width = 68
        Height = 13
        AutoSize = False
        Caption = #24320#22987#31471#21475':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label6: TLabel
        Left = 425
        Top = 67
        Width = 71
        Height = 13
        AutoSize = False
        Caption = #32467#26463#31471#21475':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label7: TLabel
        Left = 295
        Top = 41
        Width = 68
        Height = 13
        AutoSize = False
        Caption = #31471#21475#36873#39033':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label34: TLabel
        Left = 328
        Top = 384
        Width = 67
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'PING'#32479#35745':'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label35: TLabel
        Left = 10
        Top = 382
        Width = 57
        Height = 13
        AutoSize = False
        Caption = 'IP'#22320#22336':'
      end
      object Label36: TLabel
        Left = 437
        Top = 384
        Width = 71
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #31471#21475#32479#35745':'
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Label37: TLabel
        Left = 219
        Top = 383
        Width = 58
        Height = 13
        AutoSize = False
        Caption = #24403#21069#32447#31243':'
      end
      object Tree_port: TTreeView
        Left = 7
        Top = 75
        Width = 264
        Height = 302
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HideSelection = False
        Images = scan_image
        Indent = 19
        ParentFont = False
        PopupMenu = share_tree_m
        ShowRoot = False
        TabOrder = 0
        OnKeyDown = Tree_portKeyDown
      end
      object Edit1: TEdit
        Left = 76
        Top = 5
        Width = 114
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '10.168.0.1'
      end
      object Edit2: TEdit
        Left = 76
        Top = 28
        Width = 114
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = '10.168.0.254'
      end
      object Button1: TButton
        Left = 198
        Top = 8
        Width = 46
        Height = 31
        Caption = #24320#22987
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button1Click
      end
      object CheckBox1: TCheckBox
        Left = 294
        Top = 8
        Width = 141
        Height = 17
        Caption = #21482#25195#25551#33021'Ping '#30340#20027#26426
        Checked = True
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 426
        Top = 7
        Width = 89
        Height = 17
        Caption = #35299#26512#26426#21517
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnClick = CheckBox2Click
      end
      object port_option: TComboBox
        Left = 357
        Top = 36
        Width = 183
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 6
        Text = '2.'#25195#25551#21015#34920#20013#36873#20013#30340#31471#21475
        Items.Strings = (
          '1.'#25195#25551#21015#34920#20013#30340#20840#37096#31471#21475
          '2.'#25195#25551#21015#34920#20013#36873#20013#30340#31471#21475
          '3.'#33258#23450#20041'('#38480#20110#21015#34920')'
          '4.'#33258#23450#20041'('#20840#37096#31471#21475')')
      end
      object port_list: TCheckListBox
        Left = 291
        Top = 109
        Width = 262
        Height = 266
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        Items.Strings = (
          '1->TCP Port Service Multiplexer '
          '2->Management Utility '
          '3->Compression Process '
          '5->Remote Job Entry '
          '7->Echo '
          '9->Discard '
          '11->Active Users '
          '13->Daytime '
          '17->Quote of the Day '
          '18->Message Send Protocol '
          '19->Character Generator '
          '20->File Transfer [Default Data] '
          '21->File Transfer Protocol [Control]->->ftp://%a:%p/->\r\n'
          '22->SSH Remote Login Protocol '
          '23->Telnet->telnet.exe->%a %p->\r\n'
          '24->any private mail system '
          '25->Simple Mail Transfer '
          '27->NSW User System FE '
          '29->MSG ICP '
          '31->MSG Authentication '
          '33->Display Support Protocol '
          '35->any private printer server '
          '37->Time '
          '38->Route Access Protocol '
          '39->Resource Location Protocol '
          '41->Graphics '
          '42->WINS Host Name Server '
          '43->Who Is '
          '44->MPM FLAGS Protocol '
          '45->Message Processing Module [recv] '
          '46->MPM [default send] '
          '47->NI FTP '
          '48->Digital Audit Daemon '
          '49->Login Host Protocol (TACACS) '
          '50->Remote Mail Checking Protocol '
          '51->IMP Logical Address Maintenance '
          '52->XNS Time Protocol '
          '53->Domain Name Server '
          '54->XNS Clearinghouse '
          '55->ISI Graphics Language '
          '56->XNS Authentication '
          '57->any private terminal access '
          '58->XNS Mail '
          '59->any private file service '
          '60->Unassigned '
          '61->NI MAIL '
          '62->ACA Services '
          '63->whois++ '
          '64->Communications Integrator (CI) '
          '65->TACACS-Database Service '
          '66->Oracle SQL*NET '
          '67->Bootstrap Protocol Server '
          '68->Bootstrap Protocol Client '
          '69->Trivial File Transfer '
          '70->Gopher '
          '71->Remote Job Service '
          '72->Remote Job Service '
          '73->Remote Job Service '
          '74->Remote Job Service '
          '75->any private dial out service '
          '76->Distributed External Object Store '
          '77->any private RJE service '
          '78->vettcp '
          '79->Finger \r\n\r\n'
          
            '80->World Wide Web HTTP->C:\Program Files\Internet Explorer\IEXP' +
            'LORE.EXE->http://%a:%p/->HEAD / HTTP/1.0\r\n\r\n'
          '81->HOSTS2 Name Server '
          '82->XFER Utility '
          '83->MIT ML Device '
          '84->Common Trace Facility '
          '85->MIT ML Device '
          '86->Micro Focus Cobol '
          '87->any private terminal link '
          '88->Kerberos '
          '89->SU/MIT Telnet Gateway '
          '90->DNSIX Securit Attribute Token Map '
          '91->MIT Dover Spooler '
          '92->Network Printing Protocol '
          '93->Device Control Protocol '
          '94->Tivoli Object Dispatcher '
          '95->SUPDUP '
          '96->DIXIE Protocol Specification '
          '97->Swift Remote Virtural File Protocol '
          '98->TAC News '
          '99->Metagram Relay/srv.exe '
          '100->[unauthorized use] '
          '101->NIC Host Name Server '
          '102->ISO-TSAP Class 0 '
          '103->Genesis Point-to-Point Trans Net '
          '104->ACR-NEMA Digital Imag. & Comm. 300 '
          '105->CCSO name server protocol '
          '106->3COM-TSMUX '
          '107->Remote Telnet Service '
          '108->SNA Gateway Access Server '
          '109->Post Office Protocol - Version 2 '
          '110->Post Office Protocol - Version 3 '
          '111->SUN Remote Procedure Call '
          '112->McIDAS Data Transmission Protocol '
          '113->Authentication Service '
          '114->Audio News Multicast '
          '115->Simple File Transfer Protocol '
          '116->ANSA REX Notify '
          '117->UUCP Path Service '
          '118->SQL Services '
          '119->Network News Transfer Protocol '
          '120->CFDPTKT '
          '121->Encore Expedited Remote Pro.Call '
          '122->SMAKYNET '
          '123->Network Time Protocol '
          '124->ANSA REX Trader '
          '125->Locus PC-Interface Net Map Ser '
          '126->Unisys Unitary Login '
          '127->Locus PC-Interface Conn Server '
          '128->GSS X License Verification '
          '129->Password Generator Protocol '
          '130->cisco FNATIVE '
          '131->cisco TNATIVE '
          '132->cisco SYSMAINT '
          '133->Statistics Service '
          '134->INGRES-NET Service '
          '135->DCE endpoint resolution '
          '136->PROFILE Naming System '
          '137->NETBIOS Name Service '
          '138->NETBIOS Datagram Service '
          '139->NETBIOS Session Service->explorer.exe->\\%a->'
          '140->EMFIS Data Service '
          '141->EMFIS Control Service '
          '142->Britton-Lee IDM '
          '143->Internet Message Access Protocol '
          '144->NewS '
          '145->UAAC Protocol '
          '146->ISO-IP0 '
          '147->ISO-IP '
          '148->Jargon '
          '149->AED 512 Emulation Service '
          '150->SQL-NET '
          '151->HEMS '
          '152->Background File Transfer Program '
          '153->SGMP '
          '154->NETSC '
          '155->NETSC '
          '156->SQL Service '
          '157->KNET/VM Command/Message Protocol '
          '158->PCMail Server '
          '159->NSS-Routing '
          '160->SGMP-TRAPS '
          '161->SNMP '
          '162->SNMPTRAP '
          '163->CMIP Manager '
          '164->CMIP Agent '
          '165->Xerox '
          '166->Sirius Systems '
          '167->NAMP '
          '168->RSVD '
          '169->SEND '
          '170->Network PostScript '
          '171->Network Innovations Multiplex '
          '172->Network Innovations CL/1 '
          '173->Xyplex '
          '174->MAILQ '
          '175->VMNET '
          '176->GENRAD-MUX '
          '177->X Display Manager Control Protocol '
          '178->NextStep Window Server '
          '179->Border Gateway Protocol '
          '180->Intergraph '
          '181->Unify '
          '182->Unisys Audit SITP '
          '183->OCBinder '
          '184->OCServer '
          '185->Remote-KIS '
          '186->KIS Protocol '
          '187->Application Communication Interface '
          '188->Plus Five'#39's MUMPS '
          '189->Queued File Transport '
          '190->Gateway Access Control Protocol '
          '191->Prospero Directory Service '
          '192->OSU Network Monitoring System '
          '193->Spider Remote Monitoring Protocol '
          '194->Internet Relay Chat Protocol '
          '195->DNSIX Network Level Module Audit '
          '196->DNSIX Session Mgt Module Audit Redir '
          '197->Directory Location Service '
          '198->Directory Location Service Monitor '
          '199->SMUX '
          '200->IBM System Resource Controller '
          '201->AppleTalk Routing Maintenance '
          '202->AppleTalk Name Binding '
          '203->AppleTalk Unused '
          '204->AppleTalk Echo '
          '205->AppleTalk Unused '
          '206->AppleTalk Zone Information '
          '207->AppleTalk Unused '
          '208->AppleTalk Unused '
          '209->The Quick Mail Transfer Protocol '
          '210->ANSI Z39.50 '
          '211->Texas Instruments 914C/G Terminal '
          '212->ATEXSSTR '
          '213->IPX '
          '214->VM PWSCS '
          '215->Insignia Solutions '
          '216->Computer Associates Int'#39'l License Server '
          '217->dBASE Unix '
          '218->Netix Message Posting Protocol '
          '219->Unisys ARPs '
          '220->Interactive Mail Access Protocol v3 '
          '221->Berkeley rlogind with SPX auth '
          '222->Berkeley rshd with SPX auth '
          '223->Certificate Distribution Center '
          '242->Direct '
          '243->Survey Measurement '
          '244->Dayna '
          '245->LINK '
          '246->Display Systems Protocol '
          '256->RAP '
          '257->Secure Electronic Transaction '
          '258->Yak Winsock Personal Chat '
          '259->Efficient Short Remote Operations '
          '260->Openport '
          '261->IIOP Naming Service (SSL) '
          '262->Arcisdms '
          '263->HDAP '
          '280->http-mgmt '
          '281->Personal Link '
          '282->Cable Port A/X '
          '309->EntrustTime '
          '344->Prospero Data Access Protocol '
          '345->Perf Analysis Workbench '
          '346->Zebra server '
          '347->Fatmen Server '
          '348->Cabletron Management Protocol '
          '349->mftp '
          '350->MATIP Type A '
          '351->MATIP Type B '
          '371->Clearcase '
          '372->ListProcessor '
          '373->Legent Corporation '
          '374->Legent Corporation '
          '375->Hassle '
          '376->Amiga Envoy Network Inquiry Proto '
          '377->NEC Corporation '
          '378->NEC Corporation '
          '379->TIA/EIA/IS-99 modem client '
          '380->TIA/EIA/IS-99 modem server '
          '381->hp performance data collector '
          '382->hp performance data managed node '
          '383->hp performance data alarm manager '
          '384->A Remote Network Server System '
          '385->IBM Application '
          '386->ASA Message Router Object Def. '
          '387->Appletalk Update-Based Routing Pro. '
          '388->Unidata LDM Version 4 '
          '389->Lightweight Directory Access Protocol '
          '390->UIS '
          '391->SynOptics SNMP Relay Port '
          '392->SynOptics Port Broker Port '
          '393->Data Interpretation System '
          '394->EMBL Nucleic Data Transfer '
          '395->NETscout Control Protocol '
          '396->Novell Netware over IP '
          '397->Multi Protocol Trans. Net. '
          '398->Kryptolan '
          '399->ISO Transport Class 2 Non-Control over TCP '
          '400->Workstation Solutions '
          '401->Uninterruptible Power Supply '
          '402->Genie Protocol '
          '403->decap '
          '404->nced '
          '405->ncld '
          '406->Interactive Mail Support Protocol '
          '407->Timbuktu '
          '408->Prospero Resource Manager Sys. Man. '
          '409->Prospero Resource Manager Node Man. '
          '410->DECLadebug Remote Debug Protocol '
          '411->Remote MT Protocol '
          '412->Trap Convention Port '
          '413->SMSP '
          '414->InfoSeek '
          '415->BNet '
          '416->Silverplatter '
          '417->Onmux '
          '418->Hyper-G '
          '419->Ariel '
          '420->SMPTE '
          '421->Ariel '
          '422->Ariel '
          '423->IBM Operations Planning and Control Start '
          '424->IBM Operations Planning and Control Track '
          '425->ICAD '
          '426->smartsdp '
          '427->Server Location '
          '428->OCS_CMU '
          '429->OCS_AMU '
          '430->UTMPSD '
          '431->UTMPCD '
          '432->IASD '
          '433->NNSP '
          '434->MobileIP-Agent '
          '435->MobilIP-MN '
          '436->DNA-CML '
          '437->comscm '
          '438->dsfgw '
          '439->dasp      Thomas Obermair '
          '440->sgcp '
          '441->decvms-sysmgt '
          '442->cvc_hostd '
          '443->https  MCom '
          '444->Simple Network Paging Protocol '
          '445->Microsoft-DS '
          '446->DDM-RDB '
          '447->DDM-RFM '
          '448->DDM-BYTE '
          '449->AS Server Mapper '
          '450->TServer '
          '451->Cray Network Semaphore server '
          '452->Cray SFS config server '
          '453->CreativeServer '
          '454->ContentServer '
          '455->CreativePartnr '
          '456->macon-tcp '
          '457->scohelp '
          '458->apple quick time '
          '459->ampr-rcmd '
          '460->skronk '
          '461->DataRampSrv '
          '462->DataRampSrvSec '
          '463->alpes '
          '464->kpasswd '
          '465->ssmtp '
          '466->digital-vrc '
          '467->mylex-mapd '
          '468->proturis '
          '469->Radio Control Protocol '
          '470->scx-proxy '
          '471->Mondex '
          '472->ljk-login '
          '473->hybrid-pop '
          '474->tn-tl-w1 '
          '475->tcpnethaspsrv '
          '476->tn-tl-fd1 '
          '477->ss7ns '
          '478->spsc '
          '479->iafserver '
          '480->iafdbase '
          '481->Ph service '
          '482->bgs-nsi '
          '483->ulpnet '
          '484->Integra Software Management Environment '
          '485->Air Soft Power Burst '
          '486->avian '
          '487->saft '
          '488->gss-http '
          '489->nest-protocol '
          '490->micom-pfs '
          '491->go-login '
          '492->Transport Independent Convergence for FNA '
          '493->Transport Independent Convergence for FNA '
          '494->POV-Ray '
          '495->intecourier '
          '496->PIM-RP-DISC '
          '497->dantz '
          '498->siam '
          '499->ISO ILL Protocol '
          '500->isakmp '
          '501->STMF '
          '502->asa-appl-proto '
          '503->Intrinsa '
          '504->citadel '
          '505->mailbox-lm '
          '506->ohimsrv '
          '507->crs '
          '508->xvttp '
          '509->snare '
          '510->FirstClass Protocol '
          '511->mynet-as '
          '512->remote process execution; '
          '513->remote login a la telnet; '
          '514->cmd '
          '515->spooler '
          '516->videotex '
          '517->like tenex link '
          '518->'#26410#30693' '
          '519->unixtime '
          '520->extended file name server '
          '521->ripng '
          '522->ULP '
          '523->IBM-DB2 '
          '524->NCP '
          '525->timeserver '
          '526->newdate '
          '527->Stock IXChange '
          '528->Customer IXChange '
          '529->IRC-SERV '
          '530->rpc '
          '531->chat '
          '532->readnews '
          '533->for emergency broadcasts '
          '534->MegaMedia Admin '
          '535->iiop '
          '536->opalis-rdv '
          '537->Networked Media Streaming Protocol '
          '538->gdomap '
          '539->Apertus Technologies Load Determination '
          '540->uucpd '
          '541->uucp-rlogin '
          '542->commerce '
          '543->'#26410#30693' '
          '544->krcmd '
          '545->appleqtcsrvr '
          '546->DHCPv6 Client '
          '547->DHCPv6 Server '
          '548->AFP over TCP '
          '549->IDFP '
          '550->new-who '
          '551->cybercash '
          '552->deviceshare '
          '553->pirp '
          '554->Real Time Stream Control Protocol '
          '555->'#26410#30693' '
          '556->rfs server '
          '557->openvms-sysipc '
          '558->SDNSKMP '
          '559->TEEDTAP '
          '560->rmonitord '
          '561->'#26410#30693' '
          '562->chcmd '
          '563->snews '
          '564->plan 9 file service '
          '565->whoami '
          '566->streettalk '
          '567->banyan-rpc '
          '568->microsoft shuttle '
          '569->microsoft rome '
          '570->demon '
          '571->udemon '
          '572->sonar '
          '573->banyan-vip '
          '574->FTP Software Agent System '
          '575->VEMMI '
          '576->ipcd '
          '577->vnas '
          '578->ipdd '
          '579->decbsrv '
          '580->SNTP HEARTBEAT '
          '581->Bundle Discovery Protocol '
          '600->Sun IPC server '
          '606->Cray Unified Resource Manager '
          '607->nqs '
          '608->Sender-Initiated/Unsolicited File Transfer '
          '609->npmp-trap '
          '610->npmp-local '
          '611->npmp-gui '
          '612->HMMP Indication '
          '613->HMMP Operation '
          '614->SSLshell '
          '615->Internet Configuration Manager '
          '616->SCO System Administration Server '
          '617->SCO Desktop Administration Server '
          '618->DEI-ICDA '
          '619->Digital EVM '
          '620->SCO WebServer Manager '
          '633->Service Status update (Sterling Software) '
          '634->ginad '
          '635->RLZ DBase '
          '636->ssl-ldap '
          '637->lanserver '
          '666->'#26410#30693' '
          '667->campaign contribution disclosures -  SDR Technologies '
          '668->MeComm '
          '669->MeRegister '
          '670->VACDSM-SWS '
          '671->VACDSM-APP '
          '672->VPPS-QUA '
          '673->CIMPLEX '
          '674->ACAP '
          '704->errlog copy/server daemon '
          '705->AgentX '
          '709->Entrust Key Management Service Handler '
          '710->Entrust Administration Service Handler '
          '729->IBM NetView DM/6000 Server/Client '
          '730->IBM NetView DM/6000 send '
          '731->IBM NetView DM/6000 receive '
          '741->netGW '
          '742->Network based Rev. Cont. Sys. '
          '744->Flexible License Manager '
          '747->Fujitsu Device Control '
          '748->Russell Info Sci Calendar Manager '
          '749->kerberos administration '
          '750->'#26410#30693' '
          '751->'#26410#30693' '
          '752->'#26410#30693' '
          '753->'#26410#30693' '
          '754->send '
          '758->'#26410#30693' '
          '759->'#26410#30693' '
          '760->'#26410#30693' '
          '761->'#26410#30693' '
          '762->'#26410#30693' '
          '763->'#26410#30693' '
          '764->'#26410#30693' '
          '765->'#26410#30693' '
          '767->phone '
          '769->'#26410#30693' '
          '770->'#26410#30693' '
          '771->'#26410#30693' '
          '772->'#26410#30693' '
          '773->'#26410#30693' '
          '774->'#26410#30693' '
          '775->'#26410#30693' '
          '776->'#26410#30693' '
          '780->'#26410#30693' '
          '786->Concert '
          '799->Remotely Possible '
          '800->'#26410#30693' '
          '801->'#26410#30693' '
          '886->ICL coNETion locate server '
          '887->ICL coNETion server info '
          '888->AccessBuilder '
          '911->xact-backup '
          '991->Netnews Administration System '
          '995->SSL based POP3 '
          '996->vsinet '
          '997->'#26410#30693' '
          '998->'#26410#30693' '
          '999->'#26410#30693' '
          '1000->'#26410#30693' '
          '1001->WEB ex trojan '
          '1010->Doly Trojan 1.30 (Subm.Cronco) '
          '1011->Doly Trojan 1.1+1.2 '
          '1015->Doly Trojan 1.5 (Subm.Cronco) '
          '1023->Reserved '
          '1024->Reserved '
          '1025->network blackjack '
          '1027->ICQ'#26410#30693' '
          '1030->BBN IAD '
          '1031->BBN IAD '
          '1032->BBN IAD '
          '1033->Netspy '
          '1042->Bla1.1 '
          '1047->Sun'#39's NEO Object Request Broker '
          '1048->Sun'#39's NEO Object Request Broker '
          '1058->nim '
          '1059->nimreg '
          '1067->Installation Bootstrap Proto. Serv. '
          '1068->Installation Bootstrap Proto. Cli. '
          '1080->Socks '
          '1083->Anasoft License Manager '
          '1084->Anasoft License Manager '
          '1089->SocksServer trojan '
          '1110->Cluster status info '
          '1123->Murray '
          '1155->Network File Access '
          '1170->Streaming Audio Trojan '
          '1207->SoftWar '
          '1212->lupa '
          '1222->SNI R&D network '
          '1243->SubSeven '
          '1245->Vodoo '
          '1248->'#26410#30693' '
          '1269->Maverick'#39's Matrix '
          '1313->BMC_PATROLDB '
          '1314->Photoscript Distributed Printing System '
          '1345->VPJP '
          '1346->Alta Analytics License Manager '
          '1347->multi media conferencing '
          '1348->multi media conferencing '
          '1349->Registration Network Protocol '
          '1350->Registration Network Protocol '
          '1351->Digital Tool Works (MIT) '
          '1352->Lotus Note '
          '1353->Relief Consulting '
          '1354->RightBrain Software '
          '1355->Intuitive Edge '
          '1356->CuillaMartin Company '
          '1357->Electronic PegBoard '
          '1358->CONNLCLI '
          '1359->FTSRV '
          '1360->MIMER '
          '1361->LinX '
          '1362->TimeFlies '
          '1363->Network DataMover Requester '
          '1364->Network DataMover Server '
          '1365->Network Software Associates '
          '1366->Novell NetWare Comm Service Platform '
          '1367->DCS '
          '1368->ScreenCast '
          '1369->GlobalView to Unix Shell '
          '1370->Unix Shell to GlobalView '
          '1371->Fujitsu Config Protocol '
          '1372->Fujitsu Config Protocol '
          '1373->Chromagrafx '
          '1374->EPI Software Systems '
          '1375->Bytex '
          '1376->IBM Person to Person Software '
          '1377->Cichlid License Manager '
          '1378->Elan License Manager '
          '1379->Integrity Solutions '
          '1380->Telesis Network License Manager '
          '1381->Apple Network License Manager '
          '1382->'#26410#30693' '
          '1383->GW Hannaway Network License Manager '
          '1384->Objective Solutions License Manager '
          '1385->Atex Publishing License Manager '
          '1386->CheckSum License Manager '
          '1387->Computer Aided Design Software Inc LM '
          '1388->Objective Solutions DataBase Cache '
          '1389->Document Manager '
          '1390->Storage Controller '
          '1391->Storage Access Server '
          '1392->Print Manager '
          '1393->Network Log Server '
          '1394->Network Log Client '
          '1395->PC Workstation Manager software '
          '1396->DVL Active Mail '
          '1397->Audio Active Mail '
          '1398->Video Active Mail '
          '1399->Cadkey License Manager '
          '1400->Cadkey Tablet Daemon '
          '1401->Goldleaf License Manager '
          '1402->Prospero Resource Manager '
          '1403->Prospero Resource Manager '
          '1404->Infinite Graphics License Manager '
          '1405->IBM Remote Execution Starter '
          '1406->NetLabs License Manager '
          '1407->DBSA License Manager '
          '1408->Sophia License Manager '
          '1409->Here License Manager '
          '1410->HiQ License Manager '
          '1411->AudioFile '
          '1412->InnoSys '
          '1413->Innosys-ACL '
          '1414->IBM MQSeries '
          '1415->DBStar '
          '1416->Novell LU6.2 '
          '1417->Timbuktu Service 1 Port '
          '1418->Timbuktu Service 2 Port '
          '1419->Timbuktu Service 3 Port '
          '1420->Timbuktu Service 4 Port '
          '1421->Gandalf License Manager '
          '1422->Autodesk License Manager '
          '1423->Essbase Arbor Software '
          '1424->Hybrid Encryption Protocol '
          '1425->Zion Software License Manager '
          '1426->Satellite-data Acquisition System 1 '
          '1427->mloadd monitoring tool '
          '1428->Informatik License Manager '
          '1429->Hypercom NMS '
          '1430->Hypercom TPDU '
          '1431->Reverse Gossip Transport '
          '1432->Blueberry Software License Manager '
          '1433->Microsoft-SQL-Server '
          '1434->Microsoft-SQL-Monitor '
          '1435->IBM CICS '
          '1436->Satellite-data Acquisition System 2 '
          '1437->Tabula '
          '1438->Eicon Security Agent/Server '
          '1439->Eicon X25/SNA Gateway '
          '1440->Eicon Service Location Protocol '
          '1441->Cadis License Management '
          '1442->Cadis License Management '
          '1443->Integrated Engineering Software '
          '1444->Marcam  License Management '
          '1445->Proxima License Manager '
          '1446->Optical Research Associates License Manager '
          '1447->Applied Parallel Research LM '
          '1448->OpenConnect License Manager '
          '1449->PEport '
          '1450->Tandem Distributed Workbench Facility '
          '1451->IBM Information Management '
          '1452->GTE Government Systems License Man '
          '1453->Genie License Manager '
          '1454->interHDL License Manager '
          '1455->ESL License Manager '
          '1456->DCA '
          '1457->Valisys License Manager '
          '1458->Nichols Research Corp. '
          '1459->Proshare Notebook Application '
          '1460->Proshare Notebook Application '
          '1461->IBM Wireless LAN '
          '1462->World License Manager '
          '1463->Nucleus '
          '1464->MSL License Manager '
          '1465->Pipes Platform '
          '1466->Ocean Software License Manager '
          '1467->CSDMBASE '
          '1468->CSDM '
          '1469->Active Analysis Limited License Manager '
          '1470->Universal Analytics '
          '1471->csdmbase '
          '1472->csdm '
          '1473->OpenMath '
          '1474->Telefinder '
          '1475->Taligent License Manager '
          '1476->clvm-cfg '
          '1477->ms-sna-server '
          '1478->ms-sna-base '
          '1479->dberegister '
          '1480->PacerForum '
          '1481->AIRS '
          '1482->Miteksys License Manager '
          '1483->AFS License Manager '
          '1484->Confluent License Manager '
          '1485->LANSource '
          '1486->nms_topo_serv '
          '1487->LocalInfoSrvr '
          '1488->DocStor '
          '1489->dmdocbroker '
          '1490->insitu-conf '
          '1491->anynetgateway '
          '1492->stone-design-1 '
          '1493->netmap_lm '
          '1494->ica '
          '1495->cvc '
          '1496->liberty-lm '
          '1497->rfx-lm '
          '1498->Watcom-SQL '
          '1499->Federico Heinz Consultora '
          '1500->VLSI License Manager '
          '1501->Satellite-data Acquisition System 3 '
          '1502->Shiva '
          '1503->Databeam '
          '1504->EVB Software Engineering License Manager '
          '1505->Funk Software '
          '1506->Universal Time daemon (utcd) '
          '1507->symplex '
          '1508->diagmond '
          '1509->Robcad '
          '1510->Midland Valley Exploration Ltd. Lic. Man. '
          '1511->3l-l1 '
          '1512->Microsoft'#39's Windows Internet Name Service '
          '1513->Fujitsu Systems Business of America '
          '1514->Fujitsu Systems Business of America '
          '1515->ifor-protocol '
          '1516->Virtual Places Audio data '
          '1517->Virtual Places Audio control '
          '1518->Virtual Places Video data '
          '1519->Virtual Places Video control '
          '1520->atm zip office '
          '1521->nCube License Manager '
          '1522->Ricardo North America License Manager '
          '1523->cichild '
          '1524->ingres '
          '1525->oracle '
          '1526->Prospero Data Access Prot non-priv '
          '1527->oracle '
          '1528->micautoreg '
          '1529->oracle '
          '1530->rap-service '
          '1531->rap-listen '
          '1532->miroconnect '
          '1533->Virtual Places Software '
          '1534->micromuse-lm '
          '1535->ampr-info '
          '1536->ampr-inter '
          '1537->isi-lm '
          '1538->3ds-lm '
          '1539->Intellistor License Manager '
          '1540->rds '
          '1541->rds2 '
          '1542->gridgen-elmd '
          '1543->simba-cs '
          '1544->aspeclmd '
          '1545->vistium-share '
          '1546->abbaccuray '
          '1547->laplink '
          '1548->Axon License Manager '
          '1549->Shiva Hose '
          '1550->Image Storage license manager 3M Company '
          '1551->HECMTL-DB '
          '1552->pciarray '
          '1553->sna-cs '
          '1554->CACI Products Company License Manager '
          '1555->livelan '
          '1556->AshWin CI Tecnologies '
          '1557->ArborText License Manager '
          '1558->xingmpeg '
          '1559->web2host '
          '1560->asci-val '
          '1561->facilityview '
          '1562->pconnectmgr '
          '1563->Cadabra License Manager '
          '1564->Pay-Per-View '
          '1565->WinDD '
          '1566->CORELVIDEO '
          '1567->jlicelmd '
          '1568->tsspmap '
          '1569->ets '
          '1570->orbixd '
          '1571->Oracle Remote Data Base '
          '1572->Chipcom License Manager '
          '1573->itscomm-ns '
          '1574->mvel-lm '
          '1575->oraclenames '
          '1576->moldflow-lm '
          '1577->hypercube-lm '
          '1578->Jacobus License Manager '
          '1579->ioc-sea-lm '
          '1580->tn-tl-r1 '
          '1581->vmf-msg-port '
          '1582->MSIMS '
          '1583->simbaexpress '
          '1584->tn-tl-fd2 '
          '1585->intv '
          '1586->ibm-abtact '
          '1587->pra_elmd '
          '1588->triquest-lm '
          '1589->VQP '
          '1590->gemini-lm '
          '1591->ncpm-pm '
          '1592->commonspace '
          '1593->mainsoft-lm '
          '1594->sixtrak '
          '1595->radio '
          '1596->radio-sm '
          '1597->orbplus-iiop '
          '1598->picknfs '
          '1599->simbaservices '
          '1600->'#26410#30693' '
          '1601->aas '
          '1602->inspect '
          '1603->pickodbc '
          '1604->icabrowser '
          '1605->Salutation Manager (Salutation Protocol) '
          '1606->Salutation Manager (SLM-API) '
          '1607->stt '
          '1608->Smart Corp. License Manager '
          '1609->isysg-lm '
          '1610->taurus-wh '
          '1611->Inter Library Loan '
          '1612->NetBill Transaction Server '
          '1613->NetBill Key Repository '
          '1614->NetBill Credential Server '
          '1615->NetBill Authorization Server '
          '1616->NetBill Product Server '
          '1617->Nimrod Inter-Agent Communication '
          '1618->skytelnet '
          '1619->xs-openstorage '
          '1620->faxportwinport '
          '1621->softdataphone '
          '1622->ontime '
          '1623->jaleosnd '
          '1624->udp-sr-port '
          '1625->svs-omagent '
          '1636->CableNet Control Protocol '
          '1637->CableNet Admin Protocol '
          '1638->CableNet Info Protocol '
          '1639->cert-initiator '
          '1640->cert-responder '
          '1641->InVision '
          '1642->isis-am '
          '1643->isis-ambc '
          '1644->Satellite-data Acquisition System 4 '
          '1645->datametrics '
          '1646->sa-msg-port '
          '1647->rsap '
          '1648->concurrent-lm '
          '1649->inspect '
          '1650->'#26410#30693' '
          '1651->shiva_confsrvr '
          '1652->xnmp '
          '1653->alphatech-lm '
          '1654->stargatealerts '
          '1655->dec-mbadmin '
          '1656->dec-mbadmin-h '
          '1657->fujitsu-mmpdc '
          '1658->sixnetudr '
          '1659->Silicon Grail License Manager '
          '1660->skip-mc-gikreq '
          '1661->netview-aix-1 '
          '1662->netview-aix-2 '
          '1663->netview-aix-3 '
          '1664->netview-aix-4 '
          '1665->netview-aix-5 '
          '1666->netview-aix-6 '
          '1667->netview-aix-7 '
          '1668->netview-aix-8 '
          '1669->netview-aix-9 '
          '1670->netview-aix-10 '
          '1671->netview-aix-11 '
          '1672->netview-aix-12 '
          '1673->Intel Proshare Multicast '
          '1674->Intel Proshare Multicast '
          '1675->Pacific Data Products '
          '1676->netcomm1 '
          '1677->groupwise '
          '1678->prolink '
          '1679->darcorp-lm '
          '1680->microcom-sbp '
          '1681->sd-elmd '
          '1682->lanyon-lantern '
          '1683->ncpm-hip '
          '1684->SnareSecure '
          '1685->n2nremote '
          '1686->cvmon '
          '1687->nsjtp-ctrl '
          '1688->nsjtp-data '
          '1689->firefox '
          '1690->ng-umds '
          '1691->empire-empuma '
          '1692->sstsys-lm '
          '1693->rrirtr '
          '1694->rrimwm '
          '1695->rrilwm '
          '1696->rrifmm '
          '1697->rrisat '
          '1698->RSVP-ENCAPSULATION-1 '
          '1699->RSVP-ENCAPSULATION-2 '
          '1700->mps-raft '
          '1701->l2f '
          '1702->deskshare '
          '1703->hb-engine '
          '1704->bcs-broker '
          '1705->slingshot '
          '1706->jetform '
          '1707->vdmplay '
          '1708->gat-lmd '
          '1709->centra '
          '1710->impera '
          '1711->pptconference '
          '1712->resource monitoring service '
          '1713->ConferenceTalk '
          '1714->sesi-lm '
          '1715->houdini-lm '
          '1716->xmsg '
          '1717->fj-hdnet '
          '1718->h323gatedisc '
          '1719->h323gatestat '
          '1720->h323hostcall '
          '1721->caicci '
          '1722->HKS License Manager '
          '1723->pptp '
          '1724->csbphonemaster '
          '1725->iden-ralp '
          '1726->IBERIAGAMES '
          '1727->winddx '
          '1728->TELINDUS '
          '1729->CityNL License Management '
          '1730->roketz '
          '1731->MSICCP '
          '1732->proxim '
          '1733->sipat '
          '1734->Camber Corporation License Management '
          '1735->PrivateChat '
          '1736->street-stream '
          '1737->ultimad '
          '1738->GameGen1 '
          '1739->webaccess '
          '1740->encore '
          '1741->cisco-net-mgmt '
          '1742->3Com-nsd '
          '1743->Cinema Graphics License Manager '
          '1744->ncpm-ft '
          '1745->remote-winsock '
          '1746->ftrapid-1 '
          '1747->ftrapid-2 '
          '1748->oracle-em1 '
          '1749->aspen-services '
          '1750->Simple Socket Library'#39's PortMaster '
          '1751->SwiftNet '
          '1752->Leap of Faith Research License Manager '
          '1753->Translogic License Manager '
          '1754->oracle-em2 '
          '1755->ms-streaming '
          '1756->capfast-lmd '
          '1757->cnhrp '
          '1758->tftp-mcast '
          '1759->SPSS License Manager '
          '1760->www-ldap-gw '
          '1761->cft-0 '
          '1762->cft-1 '
          '1763->cft-2 '
          '1764->cft-3 '
          '1765->cft-4 '
          '1766->cft-5 '
          '1767->cft-6 '
          '1768->cft-7 '
          '1769->bmc-net-adm '
          '1770->bmc-net-svc '
          '1771->vaultbase '
          '1772->EssWeb Gateway '
          '1773->KMSControl '
          '1774->global-dtserv '
          '1776->Federal Emergency Management Information System '
          '1777->powerguardian '
          '1778->prodigy-internet '
          '1779->pharmasoft '
          '1780->dpkeyserv '
          '1781->answersoft-lm '
          '1782->hp-hcip '
          '1783->Fujitsu Remote Install Service '
          '1784->Finle License Manager '
          '1785->Wind River Systems License Manager '
          '1786->funk-logger '
          '1787->funk-license '
          '1788->psmond '
          '1789->hello '
          '1790->Narrative Media Streaming Protocol '
          '1791->EA1 '
          '1792->ibm-dt-2 '
          '1793->rsc-robot '
          '1794->cera-bcm '
          '1795->dpi-proxy '
          '1796->Vocaltec Server Administration '
          '1797->UMA '
          '1798->Event Transfer Protocol '
          '1799->NETRISK '
          '1800->ANSYS-License manager '
          '1801->Microsoft Message Que '
          '1802->ConComp1 '
          '1803->HP-HCIP-GWY '
          '1804->ENL '
          '1805->ENL-Name '
          '1806->Musiconline '
          '1807->Fujitsu Hot Standby Protocol '
          '1808->Oracle-VP2 '
          '1809->Oracle-VP1 '
          '1810->Jerand License Manager '
          '1811->Scientia-SDB '
          '1812->RADIUS '
          '1813->RADIUS Accounting '
          '1814->TDP Suite '
          '1815->MMPFT '
          '1818->Enhanced Trivial File Transfer Protocol '
          '1819->Plato License Manager '
          '1820->mcagent '
          '1821->donnyworld '
          '1822->es-elmd '
          '1823->Unisys Natural Language License Manager '
          '1824->metrics-pas '
          '1901->Fujitsu ICL Terminal Emulator Program A '
          '1902->Fujitsu ICL Terminal Emulator Program B '
          '1903->Local Link Name Resolution '
          '1904->Fujitsu ICL Terminal Emulator Program C '
          '1905->Secure UP.Link Gateway Protocol '
          '1906->TPortMapperReq '
          '1907->IntraSTAR '
          '1908->Dawn '
          '1909->Global World Link '
          '1911->Starlight Networks Multimedia Transport Protocol '
          '1912->Unassigned '
          '1913->armadp '
          '1914->Elm-Momentum '
          '1915->FACELINK '
          '1916->Persoft Persona '
          '1917->nOAgent '
          '1918->Candle Directory Service - NDS '
          '1919->Candle Directory Service - DCH '
          '1920->Candle Directory Service - FERRET '
          '1944->close-combat '
          '1945->dialogic-elmd '
          '1946->tekpls '
          '1947->hlserver '
          '1948->eye2eye '
          '1949->ISMA Easdaq Live '
          '1950->ISMA Easdaq Test '
          '1951->bcs-lmserver '
          '1973->Data Link Switching Remote Access Protocol '
          '1981->ShockRave '
          '1985->Folio Remote Server '
          '1986->cisco license management '
          '1987->cisco RSRB Priority 1 port '
          '1988->cisco RSRB Priority 2 port '
          '1989->cisco RSRB Priority 3 port '
          '1990->cisco STUN Priority 1 port '
          '1991->cisco STUN Priority 2 port '
          '1992->cisco STUN Priority 3 port '
          '1993->cisco SNMP TCP port '
          '1994->cisco serial tunnel port '
          '1995->cisco perf port '
          '1996->cisco Remote SRB port '
          '1997->cisco Gateway Discovery Protocol '
          '1998->cisco X.25 service (XOT) '
          '1999->cisco identification port '
          '2000->'#26410#30693' '
          '2001->'#26410#30693' '
          '2002->'#26410#30693' '
          '2004->'#26410#30693' '
          '2005->'#26410#30693' '
          '2006->'#26410#30693' '
          '2007->'#26410#30693' '
          '2008->'#26410#30693' '
          '2009->n '
          '2010->'#26410#30693' '
          '2011->raid '
          '2012->'#26410#30693' '
          '2013->'#26410#30693' '
          '2014->'#26410#30693' '
          '2015->'#26410#30693' '
          '2016->'#26410#30693' '
          '2017->'#26410#30693' '
          '2018->'#26410#30693' '
          '2019->'#26410#30693' '
          '2020->'#26410#30693' '
          '2021->'#26410#30693' '
          '2022->'#26410#30693' '
          '2023->'#26410#30693' '
          '2024->'#26410#30693' '
          '2025->'#26410#30693' '
          '2026->'#26410#30693' '
          '2027->'#26410#30693' '
          '2028->'#26410#30693' '
          '2030->'#26410#30693' '
          '2032->'#26410#30693' '
          '2033->'#26410#30693' '
          '2034->'#26410#30693' '
          '2035->'#26410#30693' '
          '2038->'#26410#30693' '
          '2040->'#26410#30693' '
          '2041->'#26410#30693' '
          '2042->isis '
          '2043->isis-bcast '
          '2044->'#26410#30693' '
          '2045->'#26410#30693' '
          '2046->'#26410#30693' '
          '2047->'#26410#30693' '
          '2048->'#26410#30693' '
          '2049->'#26410#30693' '
          '2065->Data Link Switch Read Port Number '
          '2067->Data Link Switch Write Port Number '
          '2102->Zephyr server '
          '2103->Zephyr serv-hm connection '
          '2104->Zephyr hostmanager '
          '2105->MiniPay '
          '2140->The Invasor  Nikhil G. '
          '2201->Advanced Training System Program '
          '2202->Int. Multimedia Teleconferencing Cosortium '
          '2213->Kali '
          '2221->Allen-Bradley unregistered port '
          '2222->Allen-Bradley unregistered port '
          '2223->Allen-Bradley unregistered port '
          '2232->IVS Video default '
          '2233->INFOCRYPT '
          '2234->DirectPlay '
          '2235->Sercomm-WLink '
          '2236->Nani '
          '2237->Optech Port1 License Manager '
          '2238->AVIVA SNA SERVER '
          '2239->Image Query '
          '2241->IVS Daemon '
          '2279->xmquery '
          '2280->LNVPOLLER '
          '2281->LNVCONSOLE '
          '2282->LNVALARM '
          '2283->LNVSTATUS '
          '2284->LNVMAPS '
          '2285->LNVMAILMON '
          '2286->NAS-Metering '
          '2287->DNA '
          '2288->NETML '
          '2301->Compaq Insight Manager '
          '2307->pehelp '
          '2401->cvspserver '
          '2447->OpenView '
          '2500->Resource Tracking system server '
          '2501->Resource Tracking system client '
          '2564->HP 3000 NS/VT block mode telnet '
          '2565->Striker '
          '2583->Wincrash V2.0 trojan '
          '2592->netrek '
          '2700->tqdata '
          '2784->world wide web - development '
          '2785->aic-np '
          '2786->aic-oncrpc - Destiny MCD database '
          '2787->piccolo - Cornerstone Software '
          '2788->NetWare Loadable Module - Seagate Software '
          '2789->Media Agent '
          '2801->Phineas trojan '
          '2908->mao '
          '2909->Funk Dialout '
          '2910->TDAccess '
          '2911->Blockade '
          '2912->Epicon '
          '2998->RealSecure '
          '3000->HBCI '
          '3001->Redwood Broker '
          '3002->EXLM Agent '
          '3010->Telerate Workstation '
          '3011->Trusted Web '
          '3047->Fast Security HL Server '
          '3048->Sierra Net PC Trader '
          '3049->'#26410#30693' '
          '3128->Squid Proxy '
          '3141->VMODEM '
          '3142->RDC WH EOS '
          '3143->Sea View '
          '3144->Tarantella '
          '3145->CSI-LFAP '
          '3264->cc:mail/lotus '
          '3300->BMC Patrol agent '
          '3306->mysql '
          '3333->DEC Notes '
          '3421->Bull Apprise portmapper '
          '3454->Apple Remote Access Protocol '
          '3455->RSVP Port '
          '3456->VAT default data '
          '3457->VAT default control '
          '3791->Total Eclypse (FTP) '
          '3883->Deep Throat 2 trojan '
          '3900->Unidata UDT OS '
          '3984->MAPPER network node manager '
          '3985->MAPPER TCP/IP server '
          '3986->MAPPER workstation server '
          '4000->'#33150#36805'OICQ'
          '4001->Cisci router management '
          '4008->NetCheque accounting '
          '4009->Chimera HWM '
          '4045->NFS lock '
          '4132->NUTS Daemon '
          '4133->NUTS Bootp Server '
          '4134->NIFTY-Serve HMI protocol '
          '4321->Remote Who Is '
          '4343->UNICALL '
          '4444->KRB524 '
          '4445->UPNOTIFYP '
          '4446->N1-FWP '
          '4447->N1-RMGMT '
          '4448->ASC Licence Manager '
          '4449->ARCrypto IP '
          '4450->Camp '
          '4451->CTI System Msg '
          '4452->CTI Program Load '
          '4453->NSS Alert Manager '
          '4454->NSS Agent Manager '
          '4500->sae-urn '
          '4501->urn-x-cdchoice '
          '4567->FileNail Danny '
          '4672->remote file access server '
          '4950->IcqTrojan '
          '5000->'#26410#30693' '
          '5001->'#26410#30693' '
          '5002->radio free ethernet '
          '5003->Claris FileMaker Pro '
          '5004->avt-profile-1 '
          '5005->avt-profile-2 '
          '5010->TelepathStart '
          '5011->TelepathAttack '
          '5020->zenginkyo-1 '
          '5021->zenginkyo-2 '
          '5031->NetMetro1.0 '
          '5050->multimedia conference control tool '
          '5145->'#26410#30693' '
          '5150->Ascend Tunnel Management Protocol '
          '5190->America-Online '
          '5191->AmericaOnline1 '
          '5192->AmericaOnline2 '
          '5193->AmericaOnline3 '
          '5236->'#26410#30693' '
          '5300-># HA cluster heartbeat '
          '5301-># HA cluster general services '
          '5302-># HA cluster configuration '
          '5303-># HA cluster probing '
          '5304-># HA Cluster Commands '
          '5305-># HA Cluster Test '
          '5400->Excerpt Search '
          '5401->Excerpt Search Secure '
          '5521->IllusionMailer '
          '5550->XTCP 2.0 + 2.01 '
          '5555->Personal Agent '
          '5569->RoboHack '
          '5631->pcANYWHEREdata '
          '5632->pcANYWHEREstat '
          '5678->Remote Replication Agent Connection '
          '5679->Direct Cable Connect Manager '
          '5713->proshare conf audio '
          '5714->proshare conf video '
          '5715->proshare conf data '
          '5716->proshare conf request '
          '5717->proshare conf notify '
          '5729->Openmail User Agent Layer '
          '5742->Wincrash V1.03 '
          '5745->fcopy-server '
          '5755->OpenMail Desk Gateway server '
          '5757->OpenMail X.500 Directory Server '
          '5766->OpenMail NewMail Server '
          '5767->OpenMail Suer Agent Layer (Secure) '
          
            '5800->Virtual Network Computing server->C:\Program Files\ORL\VNC' +
            '\vncviewer.exe->%a:0->'
          
            '5900->Virtual Network Computing server->C:\Program Files\ORL\VNC' +
            '\vncviewer.exe->%a:0->'
          '6000->6000-6063   X Window System '
          '6001->Cisci router management '
          '6110->HP SoftBench CM '
          '6111->HP SoftBench Sub-Process Control '
          '6112->dtspcd '
          '6123->Backup Express '
          '6141->Meta Corporation License Manager '
          '6142->Aspen Technology License Manager '
          '6143->Watershed License Manager '
          '6144->StatSci License Manager - 1 '
          '6145->StatSci License Manager - 2 '
          '6146->Lone Wolf Systems License Manager '
          '6147->Montage License Manager '
          '6148->Ricardo North America License Manager '
          '6149->tal-pod '
          '6253->CRIP '
          '6389->clariion-evr01 '
          '6400->The tHing '
          '6455->SKIP Certificate Receive '
          '6456->SKIP Certificate Send '
          '6558->'#26410#30693' '
          '6588->AnalogX Web Proxy '
          '6667->Internet Relay Chat server '
          '6669->Vampire 1.0 '
          '6670->Vocaltec Global Online Directory '
          '6672->vision_server '
          '6673->vision_elmd '
          '6831->ambit-lm '
          '6883->DeltaSource (DarkStar) '
          '6912->Shitheep '
          '6939->Indoctrination '
          '6969->acmsoda '
          '7000->file server itself '
          '7001->callbacks to cache managers '
          '7002->users & groups database '
          '7003->volume location database '
          '7004->AFS/Kerberos authentication service '
          '7005->volume managment server '
          '7006->error interpretation service '
          '7007->basic overseer process '
          '7008->server-to-server updater '
          '7009->remote cache manager service '
          '7010->onlinet uninterruptable power supplies '
          '7099->lazy-ptop '
          '7100->X Font Service '
          '7121->Virtual Prototypes License Manager '
          '7174->Clutild '
          '7200->FODMS FLIP '
          '7201->DLIP '
          '7306->NetMonitor '
          '7395->winqedit '
          '7491->telops-lmd '
          '7511->pafec-lm '
          '7777->cbt '
          '7781->accu-lmgr '
          '7789->iCkiller '
          '7999->iRDMI2 '
          '8000->iRDMI/Shoutcast Server '
          '8001->Web '
          '8002->Web '
          '8010->Wingate web logfile '
          '8032->ProEd '
          '8080->Standard HTTP Proxy '
          '8450->npmp '
          '8888->NewsEDGE server TCP (TCP 1) '
          '8889->Desktop Data TCP 1 '
          '8890->Desktop Data TCP 2 '
          '8891->Desktop Data TCP 3: NESS application '
          '8892->Desktop Data TCP 4: FARM product '
          '8893->Desktop Data TCP 5: NewsEDGE/Web application '
          '8894->Desktop Data TCP 6: COAL application '
          '9000->CSlistener '
          '9001->Cisco xremote '
          '9100->HP JetDirect Printer Server '
          '9535->'#26410#30693' '
          '9872->PortalOfDoom '
          '9875->Portal of Doom '
          '9876->Session Director '
          '9989->iNi-Killer '
          '9992->Palace '
          '9993->Palace '
          '9994->Palace '
          '9995->Palace '
          '9996->Palace '
          '9997->Palace '
          '9998->Distinct32 '
          '9999->distinct '
          '10000->Network Data Management Protocol '
          '10607->Coma Danny '
          '11000->SSTROJG trojan '
          '11223->ProgenicTrojan '
          '12076->Gjamer '
          '12223->Hack'#26410#30693'9 KeyLogger '
          '12345->Win95/NT Netbus backdoor->->%a->'
          '12346->NetBus 1.x (avoiding Netbuster) '
          '12701->Eclipse 2000 '
          '12753->tsaf port '
          '13223->PowWow chat program '
          '16969->Priotrity '
          '17007->'#26410#30693' '
          '18000->Beckman Instruments '
          '20000->Millenium '
          '20001->Millenium trojan '
          '20024->Netbus 2.0 Pro '
          '20034->NetBus Pro '
          '20203->Logged! '
          '20331->Bla '
          '21544->GirlFriend '
          '21554->GirlFriend trojan '
          '21845->webphone '
          '21846->NetSpeak Corp. Directory Services '
          '21847->NetSpeak Corp. Connection Services '
          '21848->NetSpeak Corp. Automatic Call Distribution '
          '21849->NetSpeak Corp. Credit Processing System '
          '22222->Prosiak 0.47 '
          '22273->wnn6 '
          '22347->WIBU dongle server '
          '22555->Vocaltec Web Conference '
          '22800->Telerate Information Platform LAN '
          '22951->Telerate Information Platform WAN '
          '23456->Evil FTP trojan '
          '25000->icl-twobase1 '
          '25001->icl-twobase2 '
          '25002->icl-twobase3 '
          '25003->icl-twobase4 '
          '25004->icl-twobase5 '
          '25005->icl-twobase6 '
          '25006->icl-twobase7 '
          '25007->icl-twobase8 '
          '25008->icl-twobase9 '
          '25009->icl-twobase10 '
          '25793->Vocaltec Address Server '
          '25867->WebCam32 Admin '
          '26000->quake '
          '26208->wnn6-ds '
          '27374->Sub-7 2.1 '
          '29891->The Unexplained '
          '30029->AOLTrojan1.1 '
          '30100->NetSphere '
          '30303->Sockets De Troie trojan '
          '30999->Kuang '
          '31787->Hack'#39'a'#39'tack '
          '32771->Solaris RPC '
          '33911->Trojan Spirit 2001 a '
          '34324->Tiny Telnet Server '
          '40412->TheSpy '
          '40423->Master Paradise '
          '43188->Reachout '
          '47557->Databeam Corporation '
          '47806->ALC Protocol '
          '47808->Building Automation and Control Networks '
          '50766->Fore '
          '53001->RemoteWindowsShutdown '
          '54320->Back Orifice 2000 '
          '54321->Schoolbus 1.6+2.0 '
          '61466->Telecommando '
          '65000->Devil trojan '
          '65301->pcAnywhere ')
        ParentFont = False
        TabOrder = 7
      end
      object BitBtn1: TBitBtn
        Left = 354
        Top = 87
        Width = 43
        Height = 20
        Caption = #23548#20837'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = BitBtn1Click
      end
      object BitBtn3: TBitBtn
        Left = 399
        Top = 87
        Width = 43
        Height = 20
        Caption = #23548#20986'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = BitBtn3Click
      end
      object port_stop: TEdit
        Left = 489
        Top = 62
        Width = 58
        Height = 21
        TabOrder = 10
        Text = '1024'
      end
      object port_start: TEdit
        Left = 357
        Top = 62
        Width = 58
        Height = 21
        TabOrder = 11
        Text = '1'
      end
      object CheckBox6: TCheckBox
        Left = 75
        Top = 57
        Width = 107
        Height = 17
        Caption = #20445#30041#21015#34920
        TabOrder = 12
      end
      object scan_edit3: TEdit
        Left = 394
        Top = 379
        Width = 44
        Height = 19
        Color = clGreen
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        Text = '0'
      end
      object scan_ip: TEdit
        Left = 54
        Top = 380
        Width = 161
        Height = 19
        Color = clGreen
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        Text = '0'
      end
      object BitBtn2: TBitBtn
        Left = 451
        Top = 86
        Width = 43
        Height = 20
        Caption = #28165#38500'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnClick = BitBtn2Click
      end
      object BitBtn8: TBitBtn
        Left = 498
        Top = 87
        Width = 43
        Height = 20
        Caption = #20840#36873'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        OnClick = BitBtn8Click
      end
      object scan_edit4: TEdit
        Left = 506
        Top = 379
        Width = 45
        Height = 19
        Color = clGreen
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
        Text = '0'
      end
      object scan_edit2: TEdit
        Left = 280
        Top = 380
        Width = 49
        Height = 19
        Color = clGreen
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        Text = '0'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20849#20139#25195#25551
      ImageIndex = 1
      object Bevel1: TBevel
        Left = 1
        Top = 356
        Width = 550
        Height = 38
        Shape = bsFrame
      end
      object Label8: TLabel
        Left = 11
        Top = 11
        Width = 76
        Height = 13
        AutoSize = False
        Caption = #24320#22987#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label9: TLabel
        Left = 11
        Top = 34
        Width = 72
        Height = 13
        AutoSize = False
        Caption = #32467#26463#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label10: TLabel
        Left = 5
        Top = 61
        Width = 62
        Height = 13
        AutoSize = False
        Caption = 'PING'#24773#20917':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label12: TLabel
        Left = 12
        Top = 266
        Width = 127
        Height = 13
        AutoSize = False
        Caption = #25195#25551#28608#27963#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label13: TLabel
        Left = 12
        Top = 310
        Width = 118
        Height = 13
        AutoSize = False
        Caption = #25195#25551#20849#20139#36164#26009'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label14: TLabel
        Left = 200
        Top = 263
        Width = 50
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #32479#35745
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 200
        Top = 308
        Width = 49
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #32479#35745
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label19: TLabel
        Left = 143
        Top = 262
        Width = 50
        Height = 13
        AutoSize = False
        Caption = #32447#31243#25968
      end
      object Label21: TLabel
        Left = 143
        Top = 307
        Width = 49
        Height = 13
        AutoSize = False
        Caption = #32447#31243#25968
      end
      object Label15: TLabel
        Left = 16
        Top = 372
        Width = 45
        Height = 13
        AutoSize = False
        Caption = #29992#25143#21517':'
      end
      object Label41: TLabel
        Left = 144
        Top = 371
        Width = 36
        Height = 13
        AutoSize = False
        Caption = #23494#30721':'
      end
      object BitBtn7: TBitBtn
        Left = 256
        Top = 185
        Width = 23
        Height = 25
        Hint = #26597#25214#36873#20013#30340#22312#32447#30005#33041#20849#20139#36164#26009
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        OnClick = BitBtn7Click
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          04000000000070000000120B0000120B00000200000002000000C0C0C0000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000110001100000000110001100000000110001100
          0000000011000110000000000110001100000000000000000000000000000000
          000000000000000000000000000000000000}
      end
      object share_check: TCheckBox
        Left = 200
        Top = 9
        Width = 74
        Height = 17
        Caption = #33258#21160#26597#25214
        Checked = True
        State = cbChecked
        TabOrder = 10
        OnClick = share_checkClick
      end
      object Edit5: TEdit
        Left = 76
        Top = 8
        Width = 114
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '10.168.0.1'
      end
      object Edit6: TEdit
        Left = 76
        Top = 32
        Width = 114
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '10.168.0.254'
      end
      object Button2: TButton
        Left = 197
        Top = 29
        Width = 70
        Height = 24
        Caption = #24320#22987
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button2Click
      end
      object Edit7: TEdit
        Left = 13
        Top = 281
        Width = 122
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = #20934#22791#23601#32490'...'
      end
      object Edit8: TEdit
        Left = 15
        Top = 325
        Width = 120
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = #20934#22791#23601#32490'...'
      end
      object Edit9: TEdit
        Left = 200
        Top = 280
        Width = 52
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '0'
      end
      object Edit10: TEdit
        Left = 199
        Top = 325
        Width = 53
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '0'
      end
      object Button3: TButton
        Left = 318
        Top = 363
        Width = 69
        Height = 25
        Caption = #20840#37096#27979#35797
        TabOrder = 7
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 397
        Top = 363
        Width = 69
        Height = 25
        Caption = #36873#20013#27979#35797
        TabOrder = 8
        OnClick = Button5Click
      end
      object CheckBox3: TCheckBox
        Left = 68
        Top = 59
        Width = 122
        Height = 17
        Caption = #20445#30041#21015#34920#20013#20869#23481
        TabOrder = 9
      end
      object BitBtn4: TBitBtn
        Left = 255
        Top = 111
        Width = 23
        Height = 25
        Hint = #26597#25214#20840#37096#22312#32447#30005#33041#30340#20849#20139#36164#26009
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = BitBtn4Click
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          04000000000070000000120B0000120B00000200000002000000C0C0C0000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000011000110000000000110001100000000001100011
          0000000011000110000000011000110000000000000000000000000000000000
          000000000000000000000000000000000000}
      end
      object BitBtn5: TBitBtn
        Left = 255
        Top = 147
        Width = 23
        Height = 25
        Hint = #26597#25214#36873#20013#30340#22312#32447#30005#33041#20849#20139#36164#26009
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = BitBtn5Click
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          04000000000070000000120B0000120B00000200000002000000C0C0C0000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000110000000000000001100000000000000011000
          0000000000110000000000000110000000000000000000000000000000000000
          000000000000000000000000000000000000}
      end
      object Edit14: TEdit
        Left = 143
        Top = 279
        Width = 52
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        Text = '0'
      end
      object Edit16: TEdit
        Left = 142
        Top = 323
        Width = 53
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        Text = '0'
      end
      object CheckBox5: TCheckBox
        Left = 192
        Top = 58
        Width = 74
        Height = 17
        Caption = #26174#31034#20840#37096
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 15
        OnClick = CheckBox1Click
      end
      object tree_ping: TTreeView
        Left = 10
        Top = 80
        Width = 241
        Height = 180
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HideSelection = False
        Images = scan_image
        Indent = 19
        ParentFont = False
        PopupMenu = share_tree_m
        RowSelect = True
        ShowRoot = False
        TabOrder = 16
        OnKeyDown = Tree_portKeyDown
      end
      object Edit4: TEdit
        Left = 58
        Top = 367
        Width = 76
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object Button4: TButton
        Left = 245
        Top = 364
        Width = 61
        Height = 25
        Caption = #23383#20856#35774#32622
        TabOrder = 18
        OnClick = Button13Click
      end
      object Edit11: TEdit
        Left = 176
        Top = 367
        Width = 64
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
      end
      object PageControl2: TPageControl
        Left = 283
        Top = 2
        Width = 272
        Height = 345
        ActivePage = TabSheet9
        TabOrder = 20
        TabWidth = 65
        object TabSheet6: TTabSheet
          Caption = #20849#20139#36164#26009
          object tree_share: TTreeView
            Left = 0
            Top = 0
            Width = 264
            Height = 317
            Align = alClient
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HideSelection = False
            Indent = 15
            ParentFont = False
            PopupMenu = share_tree_m
            TabOrder = 0
            OnDblClick = tree_shareDblClick
            OnKeyDown = Tree_portKeyDown
          end
        end
        object TabSheet7: TTabSheet
          Caption = #29992#25143#36164#26009
          ImageIndex = 1
          object share_user: TTreeView
            Left = 0
            Top = 0
            Width = 264
            Height = 317
            Align = alClient
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HideSelection = False
            Indent = 15
            ParentFont = False
            PopupMenu = share_tree_m
            TabOrder = 0
            OnDblClick = tree_shareDblClick
            OnKeyDown = Tree_portKeyDown
          end
        end
        object TabSheet8: TTabSheet
          Caption = #26381#21153#36164#26009
          ImageIndex = 2
          object share_svr: TTreeView
            Left = 0
            Top = 0
            Width = 264
            Height = 317
            Align = alClient
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HideSelection = False
            Indent = 15
            ParentFont = False
            PopupMenu = share_tree_m
            TabOrder = 0
            OnDblClick = tree_shareDblClick
            OnKeyDown = Tree_portKeyDown
          end
        end
        object TabSheet9: TTabSheet
          Caption = #31995#32479#29256#26412
          ImageIndex = 3
          object share_system: TTreeView
            Left = 0
            Top = 0
            Width = 264
            Height = 317
            Align = alClient
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            HideSelection = False
            Indent = 15
            ParentFont = False
            PopupMenu = share_tree_m
            TabOrder = 0
            OnDblClick = tree_shareDblClick
            OnKeyDown = Tree_portKeyDown
          end
        end
      end
      object Button7: TButton
        Left = 477
        Top = 363
        Width = 66
        Height = 25
        Caption = #29305#27530#26816#27979'...'
        TabOrder = 22
        OnClick = Button6Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'SQL '#25195#25551
      ImageIndex = 2
      object Bevel2: TBevel
        Left = 7
        Top = 358
        Width = 550
        Height = 38
        Shape = bsFrame
      end
      object Label22: TLabel
        Left = 6
        Top = 10
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #22320#22336#33539#22260':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label23: TLabel
        Left = 7
        Top = 34
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #25195#25551#31471#21475':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label24: TLabel
        Left = 14
        Top = 61
        Width = 101
        Height = 13
        AutoSize = False
        Caption = #36816#34892'SQL '#20027#26426':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label26: TLabel
        Left = 12
        Top = 272
        Width = 127
        Height = 13
        AutoSize = False
        Caption = #25195#25551#28608#27963#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label27: TLabel
        Left = 12
        Top = 314
        Width = 118
        Height = 13
        AutoSize = False
        Caption = #25195#25551'SQL...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label28: TLabel
        Left = 200
        Top = 269
        Width = 50
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #32479#35745
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label29: TLabel
        Left = 16
        Top = 372
        Width = 45
        Height = 13
        AutoSize = False
        Caption = #29992#25143#21517':'
      end
      object Label30: TLabel
        Left = 200
        Top = 312
        Width = 49
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #32479#35745
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label31: TLabel
        Left = 143
        Top = 268
        Width = 50
        Height = 13
        AutoSize = False
        Caption = #32447#31243#25968
      end
      object Label32: TLabel
        Left = 143
        Top = 311
        Width = 49
        Height = 13
        AutoSize = False
        Caption = #32447#31243#25968
      end
      object Label25: TLabel
        Left = 284
        Top = 7
        Width = 61
        Height = 13
        AutoSize = False
        Caption = #30446#26631#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label38: TLabel
        Left = 288
        Top = 31
        Width = 53
        Height = 13
        AutoSize = False
        Caption = #29992#25143#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label39: TLabel
        Left = 402
        Top = 33
        Width = 36
        Height = 13
        AutoSize = False
        Caption = #23494#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label40: TLabel
        Left = 144
        Top = 371
        Width = 36
        Height = 13
        AutoSize = False
        Caption = #23494#30721':'
      end
      object Edit17: TEdit
        Left = 63
        Top = 7
        Width = 88
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '10.168.0.1'
      end
      object Edit18: TEdit
        Left = 158
        Top = 7
        Width = 96
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '10.168.0.254'
      end
      object Button8: TButton
        Left = 159
        Top = 31
        Width = 88
        Height = 20
        Caption = #24320#22987'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button8Click
      end
      object Edit19: TEdit
        Left = 14
        Top = 287
        Width = 122
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = #20934#22791#23601#32490'...'
      end
      object Edit20: TEdit
        Left = 15
        Top = 329
        Width = 120
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = #20934#22791#23601#32490'...'
      end
      object Edit21: TEdit
        Left = 200
        Top = 286
        Width = 52
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '0'
      end
      object Edit22: TEdit
        Left = 199
        Top = 329
        Width = 53
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '0'
      end
      object Edit23: TEdit
        Left = 58
        Top = 367
        Width = 76
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object Button10: TButton
        Left = 316
        Top = 364
        Width = 75
        Height = 25
        Caption = #23545#20840#37096#27979#35797
        TabOrder = 8
        OnClick = Button10Click
      end
      object Button12: TButton
        Left = 398
        Top = 364
        Width = 73
        Height = 25
        Caption = #23545#36873#20013#27979#35797
        TabOrder = 9
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 245
        Top = 364
        Width = 61
        Height = 25
        Caption = #23383#20856#35774#32622
        TabOrder = 10
        OnClick = Button13Click
      end
      object ListBox2: TListBox
        Left = 12
        Top = 78
        Width = 241
        Height = 184
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        MultiSelect = True
        ParentFont = False
        PopupMenu = listbox_m
        TabOrder = 11
        OnDblClick = ListBox2DblClick
        OnKeyDown = ListBox2KeyDown
      end
      object CheckBox4: TCheckBox
        Left = 102
        Top = 60
        Width = 113
        Height = 17
        Caption = #20445#30041#21015#34920#20013#20869#23481
        TabOrder = 12
      end
      object Edit24: TEdit
        Left = 143
        Top = 285
        Width = 52
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        Text = '0'
      end
      object Edit25: TEdit
        Left = 142
        Top = 328
        Width = 53
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        Text = '0'
      end
      object Edit29: TEdit
        Left = 339
        Top = 2
        Width = 173
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        Text = '10.168.0.1'
      end
      object Edit30: TEdit
        Left = 330
        Top = 29
        Width = 67
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        Text = 'sa'
      end
      object Edit31: TEdit
        Left = 436
        Top = 29
        Width = 77
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object BitBtn9: TBitBtn
        Left = 529
        Top = 329
        Width = 25
        Height = 22
        Caption = 'DO'
        TabOrder = 18
        OnClick = BitBtn9Click
      end
      object Button18: TButton
        Left = 517
        Top = 29
        Width = 37
        Height = 20
        Caption = #36830#25509
        TabOrder = 19
        OnClick = Button18Click
      end
      object sql_cmd: TMemo
        Left = 261
        Top = 53
        Width = 292
        Height = 276
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PopupMenu = memo_m
        ScrollBars = ssBoth
        TabOrder = 20
        WordWrap = False
        OnDblClick = sql_cmdDblClick
      end
      object Edit3: TEdit
        Left = 176
        Top = 367
        Width = 64
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
      end
      object Edit27: TEdit
        Left = 63
        Top = 32
        Width = 86
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 22
        Text = '1433'
      end
      object Edit32: TComboBox
        Left = 261
        Top = 328
        Width = 269
        Height = 24
        Color = clBlack
        DropDownCount = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 0
        ParentFont = False
        TabOrder = 23
        Text = 'ver'
        OnDblClick = sql_cmdDblClick
        OnKeyDown = Edit32KeyDown
      end
      object Button6: TButton
        Left = 477
        Top = 364
        Width = 73
        Height = 25
        Caption = #26816#27979#24773#20917'...'
        TabOrder = 24
        OnClick = Button6Click
      end
    end
    object TabSheet10: TTabSheet
      Caption = #20449#31665#26816#27979
      object Bevel3: TBevel
        Left = 4
        Top = 355
        Width = 558
        Height = 38
        Shape = bsFrame
      end
      object Label47: TLabel
        Left = 5
        Top = 51
        Width = 91
        Height = 13
        AutoSize = False
        Caption = #26377#25928'POP3'#20027#26426':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label48: TLabel
        Left = 12
        Top = 275
        Width = 127
        Height = 13
        AutoSize = False
        Caption = #25195#25551'POP3'#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label49: TLabel
        Left = 12
        Top = 313
        Width = 118
        Height = 13
        AutoSize = False
        Caption = #26816#27979#30005#23376#20449#31665'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label50: TLabel
        Left = 200
        Top = 273
        Width = 50
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #32479#35745
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label51: TLabel
        Left = 200
        Top = 312
        Width = 49
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #32479#35745
        Color = clAqua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label52: TLabel
        Left = 143
        Top = 272
        Width = 50
        Height = 13
        AutoSize = False
        Caption = #32447#31243#25968
      end
      object Label53: TLabel
        Left = 144
        Top = 313
        Width = 49
        Height = 13
        AutoSize = False
        Caption = #32447#31243#25968
      end
      object Label45: TLabel
        Left = 6
        Top = 5
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #22320#22336#33539#22260':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label46: TLabel
        Left = 7
        Top = 28
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #25195#25551#31471#21475':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label55: TLabel
        Left = 8
        Top = 367
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #26816#27979#27425#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Edit38: TEdit
        Left = 13
        Top = 289
        Width = 122
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = #20934#22791#23601#32490'...'
      end
      object Edit39: TEdit
        Left = 15
        Top = 327
        Width = 120
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = #20934#22791#23601#32490'...'
      end
      object Edit40: TEdit
        Left = 200
        Top = 288
        Width = 52
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '0'
      end
      object Edit41: TEdit
        Left = 199
        Top = 327
        Width = 53
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '0'
      end
      object CheckBox8: TCheckBox
        Left = 102
        Top = 51
        Width = 122
        Height = 17
        Caption = #20445#30041#21015#34920#20013#20869#23481
        TabOrder = 5
      end
      object Edit42: TEdit
        Left = 143
        Top = 288
        Width = 52
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '0'
      end
      object Edit43: TEdit
        Left = 142
        Top = 327
        Width = 53
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = '0'
      end
      object pop3_list: TListBox
        Left = 8
        Top = 90
        Width = 241
        Height = 178
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        MultiSelect = True
        ParentFont = False
        PopupMenu = listbox_m
        TabOrder = 10
        OnKeyDown = ListBox2KeyDown
      end
      object Edit36: TEdit
        Left = 62
        Top = 2
        Width = 88
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Text = '10.168.0.1'
      end
      object Edit37: TEdit
        Left = 158
        Top = 2
        Width = 96
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Text = '10.168.0.254'
      end
      object Button9: TButton
        Left = 162
        Top = 26
        Width = 88
        Height = 20
        Caption = #24320#22987'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnClick = Button9Click
      end
      object Edit44: TEdit
        Left = 63
        Top = 25
        Width = 87
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        Text = '110'
      end
      object BitBtn12: TBitBtn
        Left = 225
        Top = 361
        Width = 157
        Height = 25
        Caption = #23545#20840#37096'POP3'#20027#26426#36827#34892#26816#27979
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnClick = BitBtn12Click
      end
      object BitBtn16: TBitBtn
        Left = 387
        Top = 361
        Width = 165
        Height = 25
        Caption = #23545#36873#25321#30340'POP3'#20027#26426#36827#34892#26816#27979
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        OnClick = BitBtn16Click
      end
      object Button15: TButton
        Left = 154
        Top = 361
        Width = 67
        Height = 25
        Caption = #23383#20856#35774#32622
        TabOrder = 8
        OnClick = Button13Click
      end
      object new_pop3: TEdit
        Left = 9
        Top = 69
        Width = 195
        Height = 21
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        Text = 'pop.163.com'
      end
      object BitBtn13: TBitBtn
        Left = 204
        Top = 69
        Width = 43
        Height = 20
        Caption = #28155#21152
        TabOrder = 18
        OnClick = BitBtn13Click
      end
      object Edit46: TEdit
        Left = 70
        Top = 363
        Width = 69
        Height = 21
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
        Text = '0'
      end
      object PageControl3: TPageControl
        Left = 256
        Top = 2
        Width = 301
        Height = 351
        ActivePage = TabSheet12
        TabOrder = 9
        TabWidth = 85
        object TabSheet12: TTabSheet
          Caption = #26816#27979#32467#26524
          ImageIndex = 1
          object Splitter1: TSplitter
            Left = 0
            Top = 162
            Width = 293
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object pop3_pass: TMemo
            Left = 0
            Top = 165
            Width = 293
            Height = 158
            Align = alClient
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PopupMenu = memo_m
            ScrollBars = ssVertical
            TabOrder = 0
            WordWrap = False
            OnDblClick = pop3_infoDblClick
          end
          object pop3_info: TMemo
            Left = 0
            Top = 0
            Width = 293
            Height = 162
            Align = alTop
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clAqua
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            PopupMenu = memo_m
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 1
            WordWrap = False
            OnDblClick = pop3_infoDblClick
          end
        end
      end
      object pop3_auto: TCheckBox
        Left = 477
        Top = 5
        Width = 74
        Height = 17
        Caption = #33258#21160#26597#25214
        TabOrder = 0
        OnClick = pop3_autoClick
      end
    end
    object TabSheet11: TTabSheet
      Caption = #32593#32476#24037#20855
      ImageIndex = 6
      DesignSize = (
        561
        400)
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 561
        Height = 52
        Align = alTop
        Caption = #22320#22336#36716#25442
        TabOrder = 0
        object Label57: TLabel
          Left = 10
          Top = 24
          Width = 77
          Height = 13
          AutoSize = False
          Caption = 'IP'#22320#22336':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Label58: TLabel
          Left = 322
          Top = 24
          Width = 68
          Height = 13
          AutoSize = False
          Caption = #20027#26426#21517':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object SpeedButton1: TSpeedButton
          Left = 245
          Top = 19
          Width = 24
          Height = 23
          Hint = #24471#21040'IP'#22320#22336
          Caption = '<<'
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 271
          Top = 19
          Width = 24
          Height = 23
          Hint = #24471#21040#20027#26426#21517
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton2Click
        end
        object Edit48: TEdit
          Left = 56
          Top = 20
          Width = 152
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '10.168.0.9'
        end
        object Edit49: TEdit
          Left = 367
          Top = 20
          Width = 153
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'www.sina.com.cn'
        end
      end
      object rgTools: TRadioGroup
        Left = 0
        Top = 52
        Width = 353
        Height = 76
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #23567#24037#20855
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'PING'
          'TRACERT'
          'IPCONFIG'
          'NET VIEW'
          'ROUTE'
          'NETSTAT'
          'NET CONFIG'
          'NBTSTAT'
          'CMD.EXE')
        TabOrder = 1
      end
      object RichEdit1: TRichEdit
        Left = 0
        Top = 128
        Width = 561
        Height = 272
        Align = alBottom
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edParameter: TEdit
        Left = 367
        Top = 58
        Width = 153
        Height = 21
        Anchors = [akTop, akRight]
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '127.0.0.1'
        OnKeyPress = edParameterKeyPress
      end
      object Button11: TButton
        Left = 445
        Top = 85
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #25191#34892'(&E)'
        TabOrder = 4
        OnClick = Button11Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = #22522#26412#35774#32622
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 8
        Top = 11
        Width = 166
        Height = 78
        Caption = 'Ping'#36873#39033
        TabOrder = 0
        object Label17: TLabel
          Left = 10
          Top = 24
          Width = 77
          Height = 13
          AutoSize = False
          Caption = #21709#24212'('#27627#31186'):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Label18: TLabel
          Left = 12
          Top = 46
          Width = 68
          Height = 13
          AutoSize = False
          Caption = #32447#31243#25968#37327':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Edit12: TEdit
          Left = 85
          Top = 20
          Width = 59
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '2000'
        end
        object Edit13: TEdit
          Left = 84
          Top = 44
          Width = 60
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '40'
        end
      end
      object GroupBox2: TGroupBox
        Left = 7
        Top = 97
        Width = 166
        Height = 118
        Caption = #20849#20139#26597#25214
        TabOrder = 1
        object Label20: TLabel
          Left = 11
          Top = 26
          Width = 68
          Height = 13
          AutoSize = False
          Caption = #32447#31243#25968#37327':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Edit15: TEdit
          Left = 83
          Top = 24
          Width = 60
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '40'
        end
        object check_system: TCheckBox
          Left = 33
          Top = 58
          Width = 97
          Height = 17
          Caption = #26597#31995#32479#20449#24687
          TabOrder = 1
          OnClick = check_systemClick
        end
        object check_user: TCheckBox
          Left = 33
          Top = 76
          Width = 97
          Height = 17
          Caption = #26597#29992#25143#20449#24687
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = check_userClick
        end
        object check_Services: TCheckBox
          Left = 33
          Top = 95
          Width = 97
          Height = 17
          Caption = #26597#26381#21153#20449#24687
          TabOrder = 3
          OnClick = check_ServicesClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 192
        Top = 97
        Width = 166
        Height = 60
        Caption = #31471#21475#25195#25551
        TabOrder = 2
        object Label33: TLabel
          Left = 11
          Top = 26
          Width = 68
          Height = 13
          AutoSize = False
          Caption = #32447#31243#25968#37327':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Edit26: TEdit
          Left = 83
          Top = 24
          Width = 60
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '50'
        end
      end
      object GroupBox4: TGroupBox
        Left = 192
        Top = 11
        Width = 166
        Height = 78
        Caption = 'SQL '#36873#39033
        TabOrder = 3
        object Label42: TLabel
          Left = 13
          Top = 24
          Width = 67
          Height = 13
          AutoSize = False
          Caption = #21709#24212'('#31186'):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Label43: TLabel
          Left = 12
          Top = 46
          Width = 68
          Height = 13
          AutoSize = False
          Caption = #32447#31243#25968#37327':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Edit28: TEdit
          Left = 85
          Top = 20
          Width = 59
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '25'
        end
        object Edit33: TEdit
          Left = 84
          Top = 43
          Width = 60
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '50'
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 225
        Width = 166
        Height = 75
        Caption = 'POP3'#25195#25551
        TabOrder = 4
        object Label54: TLabel
          Left = 11
          Top = 22
          Width = 84
          Height = 13
          AutoSize = False
          Caption = #26597#25214#20027#26426#32447#31243':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Label56: TLabel
          Left = 9
          Top = 49
          Width = 84
          Height = 13
          AutoSize = False
          Caption = #26816#27979#20449#31665#32447#31243':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object Edit45: TEdit
          Left = 96
          Top = 19
          Width = 57
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '50'
        end
        object Edit47: TEdit
          Left = 96
          Top = 46
          Width = 57
          Height = 21
          Color = clGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clAqua
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '50'
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #31995#32479#26434#39033
      ImageIndex = 3
      OnHide = TabSheet4Hide
      OnShow = TabSheet4Show
      object Label11: TLabel
        Left = 11
        Top = 5
        Width = 114
        Height = 13
        AutoSize = False
        Caption = #31995#32479#27491#24120#20803#20214#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Label44: TLabel
        Left = 11
        Top = 32
        Width = 116
        Height = 13
        AutoSize = False
        Caption = #31995#32479#29616#22312#20803#20214#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
      end
      object Memo1: TMemo
        Left = 4
        Top = 57
        Width = 469
        Height = 338
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Memo1')
        ParentFont = False
        TabOrder = 0
      end
      object BitBtn10: TBitBtn
        Left = 261
        Top = 3
        Width = 75
        Height = 47
        Caption = #24378#21046#24674#22797
        TabOrder = 1
      end
      object Edit34: TEdit
        Left = 118
        Top = 28
        Width = 114
        Height = 19
        Color = clGreen
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object Edit35: TEdit
        Left = 118
        Top = 3
        Width = 114
        Height = 19
        Color = clGreen
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '170'
      end
      object BitBtn11: TBitBtn
        Left = 359
        Top = 3
        Width = 75
        Height = 47
        Caption = #20803#20214#25968
        TabOrder = 4
        OnClick = BitBtn11Click
      end
    end
  end
  object Bar: TProgressBar
    Left = 0
    Top = 428
    Width = 569
    Height = 20
    Align = alBottom
    Step = 1
    TabOrder = 1
  end
  object BitBtn6: TBitBtn
    Left = 521
    Top = 1
    Width = 48
    Height = 19
    Caption = #20572#27490
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn6Click
  end
  object memo_m: TPopupMenu
    Left = 176
    Top = 251
    object N9: TMenuItem
      Caption = #23548#20986
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #23548#20837
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #28165#31354
      OnClick = N4Click
    end
  end
  object scan_image: TImageList
    Left = 476
    Top = 164
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      84000000840000000000000000000000000000000000000000000000FF000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF0000008400000084000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF0000008400000084000000840000000000000000000000FF000000FF000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000084000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000840000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF00000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000008400000084000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000FF000000FF000000FF000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000000000000000000000000000FF000000FF000000FF0000008400000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF0000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FFFF0000FFFF0000FF000000FF00000084
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF00000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FF00000084
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      0000008400000084000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      8400000084000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FFFF0000FFFF0000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF00000084000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000FF000000FF000000FF000000
      FF00000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF0000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      FF000000FF000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF0000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF0000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F0FFC7C7FFFFFE7FE07FC187FFFFFE7FE07FC18FFFFFFE7FC03FE01FFE1FFE7F
      C41FF03FFC0FFE7FCE0FF81FF80FC003FE07F80FF80FC003FF03F007F81FFE7F
      FF83E103FC3FFE7FFFC3C383FFFFFE7FFFE3C7C3FFFFFE7FFFF3CFE3FFFFFE7F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object open_port: TOpenDialog
    DefaultExt = '*.txt'
    Filter = #25991#26412#25991#20214'(*.txt)|*.txt|'#25152#26377#25991#20214'(*.*)|*.*'
    Left = 467
    Top = 218
  end
  object save_port: TSaveDialog
    DefaultExt = '*.txt'
    Filter = #25991#26412#25991#20214'(*.txt)|*.txt|'#25152#26377#25991#20214'(*.*)|*.*'
    Left = 468
    Top = 250
  end
  object ado_q: TADOQuery
    Connection = ado_pub
    CursorType = ctStatic
    AfterOpen = ado_qAfterOpen
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'exec xp_cmdshell '#39'dir c:\'#39)
    Left = 481
    Top = 323
  end
  object ado_pub: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=autoexec;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=master;Data Source=server'
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    AfterConnect = ado_pubAfterConnect
    BeforeConnect = ado_pubBeforeConnect
    AfterDisconnect = ado_pubAfterDisconnect
    OnConnectComplete = ado_pubConnectComplete
    Left = 435
    Top = 218
  end
  object listbox_m: TPopupMenu
    Left = 176
    Top = 218
    object N5: TMenuItem
      Caption = #23548#20986
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #23548#20837
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #28165#38500
      OnClick = N8Click
    end
  end
  object share_tree_m: TPopupMenu
    Left = 344
    Top = 245
    object MenuItem1: TMenuItem
      Caption = #23637#24320
      OnClick = N1Click
    end
    object MenuItem2: TMenuItem
      Caption = #25910#36215
      OnClick = N2Click
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Caption = #23548#20986
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = #23548#20837
      OnClick = MenuItem5Click
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object share_con: TMenuItem
      Caption = #36830#25509'...'
      OnClick = share_conClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Caption = #28165#31354
      OnClick = MenuItem7Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 493
    Top = 65533
  end
  object thread_time: TTimer
    Enabled = False
    OnTimer = thread_timeTimer
    Left = 463
    Top = 65534
  end
end

program  AddSynth;

{$R AddSynth.Res}

uses
  Windows, Messages, MMSystem, Math;

const
  szAppName = 'AddSynth';
  SAMPLE_RATE = 22050;

type
  PENV = ^TENV;
  TENV = record
    iTime, iValue: Integer;
  end;

  PPRT = ^TPRT;
  TPRT = record
    iNumAmp: Integer;
    pEnvAmp: PENV;
    iNumFrq: Integer;
    pEnvFrq: PENV;
  end;

  PINS = ^TINS;
  TINS = record
    iMsecTime: Integer;
    iNumPartials: Integer;
    pprt: PPRT;
  end;

const
  envTrumAmp01: array[0..5] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 20; iValue: 305), (iTime: 36; iValue: 338),
    (iTime: 141; iValue: 288), (iTime: 237; iValue: 80), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq01: array[0..5] of TENV = (
    (iTime: 1; iValue: 321), (iTime: 16; iValue: 324), (iTime: 32; iValue: 312),
    (iTime: 109; iValue: 310), (iTime: 317; iValue: 314), (iTime: 360; iValue: 310)
                                      );

  envTrumAmp02: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue: 0), (iTime: 25; iValue: 317),
    (iTime: 39; iValue: 361), (iTime: 123; iValue: 295), (iTime: 222; iValue: 40),
    (iTime: 326; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq02: array[0..9] of TENV = (
   (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 3; iValue: 607),
   (iTime: 16; iValue: 657), (iTime: 24; iValue: 621), (iTime: 133; iValue: 621),
   (iTime: 275; iValue: 628), (iTime: 326; iValue: 628), (iTime: 327; iValue: 0),
   (iTime: 360; iValue: 0)            );

  envTrumAmp03: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 19; iValue: 100),
    (iTime: 34; iValue: 369), (iTime: 111; iValue: 342), (iTime: 207; iValue: 41),
    (iTime: 273; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq03: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 977), (iTime: 5; iValue: 782),
    (iTime: 15; iValue: 987), (iTime: 24; iValue: 932), (iTime: 128; iValue: 932),
    (iTime: 217; iValue: 936), (iTime: 273; iValue: 945), (iTime: 275; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envTrumAmp04: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue: 0), (iTime: 24; iValue: 113),
    (iTime: 29; iValue: 257), (iTime: 118; iValue: 231), (iTime: 187; iValue: 35),
    (iTime: 235; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq04: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 3; iValue: 718),
    (iTime: 16; iValue: 1335), (iTime: 24; iValue: 1243), (iTime: 108; iValue: 1240),
    (iTime: 199; iValue: 1248), (iTime: 235; iValue: 1248), (iTime: 236; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envTrumAmp05: array[0..6] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 27; iValue: 52), (iTime: 34; iValue: 130),
    (iTime: 110; iValue: 126), (iTime: 191; iValue: 13), (iTime: 234; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envTrumFrq05: array[0..9] of TENV = (
    (iTime: 1; iValue: 1225), (iTime: 9; iValue: 1569), (iTime: 12; iValue: 1269),
    (iTime: 21; iValue: 1573), (iTime: 37; iValue: 1553), (iTime: 97; iValue: 1552),
    (iTime: 181; iValue: 1556), (iTime: 234; iValue: 1566), (iTime: 235; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envTrumAmp06: array[0..6] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 46; iValue: 83), (iTime: 64; iValue: 100),
    (iTime: 100; iValue: 100), (iTime: 189; iValue: 11), (iTime: 221; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envTrumFrq06: array[0..8] of TENV = (
    (iTime: 1; iValue: 1483), (iTime: 12; iValue: 1572), (iTime: 23; iValue: 1988),
    (iTime: 33; iValue: 1864), (iTime: 114; iValue: 1864), (iTime: 177; iValue: 1868),
    (iTime: 221; iValue: 1879), (iTime: 222; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumAmp07: array[0..7] of TENV = (
     (iTime: 1; iValue: 0), (iTime: 37; iValue: 39), (iTime: 45; iValue: 77),
     (iTime: 110; iValue: 79), (iTime: 176; iValue: 11), (iTime: 205; iValue: 0),
     (iTime: 207; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq07: array[0..8] of TENV = (
    (iTime: 1; iValue: 1792), (iTime: 9; iValue: 1612), (iTime: 29; iValue: 2242),
    (iTime: 36; iValue: 2174), (iTime: 93; iValue: 2176), (iTime: 126; iValue: 2170),
    (iTime: 205; iValue: 2188), (iTime: 207; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumAmp08: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 28; iValue: 17),
    (iTime: 43; iValue: 71), (iTime: 109; iValue: 66), (iTime: 172; iValue: 8),
    (iTime: 201; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq08: array[0..8] of TENV = (
    (iTime: 1;  iValue: 0), (iTime: 2; iValue: 1590), (iTime: 29; iValue: 2539),
    (iTime: 36; iValue: 2491), (iTime: 114; iValue: 2481), (iTime: 153; iValue: 2489),
    (iTime: 201; iValue: 2491), (iTime: 203; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumAmp09: array[0..8] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2;  iValue: 0), (iTime: 29;iValue: 16),
    (iTime: 43; iValue: 53), (iTime: 54; iValue: 66), (iTime: 105; iValue: 64),
    (iTime: 165; iValue: 7), (iTime: 191; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq09: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 1993), (iTime: 25; iValue: 2121),
    (iTime: 32; iValue: 2821), (iTime: 37; iValue: 2796), (iTime: 84; iValue: 2798),
    (iTime: 105; iValue: 2792), (iTime: 191; iValue: 2797), (iTime: 192; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envTrumAmp10: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 27; iValue: 6), (iTime: 41; iValue: 25),
    (iTime: 56; iValue: 29), (iTime: 72; iValue: 22), (iTime: 95; iValue: 24),
    (iTime: 180; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq10: array[0..8] of TENV = (
    (iTime: 1; iValue: 1792), (iTime: 12; iValue: 1849), (iTime: 32; iValue: 3131),
    (iTime: 37; iValue: 3111), (iTime: 114; iValue: 3103), (iTime: 164; iValue: 3116),
    (iTime: 180; iValue: 3116), (iTime: 181; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumAmp11: array[0..8] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 37; iValue: 6),
    (iTime: 55; iValue: 25), (iTime: 88; iValue: 29), (iTime: 114; iValue: 28),
    (iTime: 164; iValue: 3), (iTime: 186; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq11: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 1398), (iTime: 31; iValue: 3419),
    (iTime: 42; iValue: 3419), (iTime: 91; iValue: 3419), (iTime: 106; iValue: 3406),
    (iTime: 150; iValue: 3421), (iTime: 186; iValue: 3421), (iTime: 187; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envTrumAmp12: array[0..8] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 7; iValue: 0), (iTime: 39; iValue: 3),
    (iTime: 43; iValue: 8), (iTime: 88; iValue: 11), (iTime: 118; iValue: 9),
    (iTime: 138; iValue: 3), (iTime: 165; iValue: 0), (iTime: 360; iValue: 0)
                                      );

  envTrumFrq12: array[0..12] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 6; iValue: 0), (iTime: 7; iValue: 1806),
    (iTime: 23; iValue: 2942), (iTime: 36; iValue: 2759), (iTime: 37; iValue: 3746),
    (iTime: 50; iValue: 3723), (iTime: 84; iValue: 3731), (iTime: 110; iValue: 3721),
    (iTime: 156; iValue: 3741), (iTime: 165; iValue: 3620), (iTime: 167; iValue: 0),
    (iTime: 360; iValue: 0)           );

  envOboeAmp01: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 9; iValue: 0), (iTime: 14; iValue: 10),
    (iTime: 26; iValue: 10), (iTime: 52; iValue: 140), (iTime: 94; iValue: 187),
    (iTime: 153; iValue: 170), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq01: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 8; iValue: 0), (iTime: 9; iValue: 314),
    (iTime: 25; iValue: 292), (iTime: 43; iValue: 311), (iTime: 144; iValue: 311),
    (iTime: 272; iValue: 313), (iTime: 313; iValue: 309)
                                      );

  envOboeAmp02: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 10; iValue: 0), (iTime: 26; iValue: 17),
    (iTime: 40; iValue: 139), (iTime: 159; iValue: 115), (iTime: 239; iValue: 62),
    (iTime: 307; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq02: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 9; iValue: 0), (iTime: 10; iValue: 708),
    (iTime: 16; iValue: 617), (iTime: 41; iValue: 625), (iTime: 105; iValue: 621),
    (iTime: 265; iValue: 630), (iTime: 307; iValue: 626), (iTime: 308; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp03: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 10; iValue: 0), (iTime: 25; iValue: 19),
    (iTime: 36; iValue: 163), (iTime: 71; iValue: 191), (iTime: 129; iValue: 187),
    (iTime: 297; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq03: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 9; iValue: 0), (iTime: 10; iValue: 915),
    (iTime: 21; iValue: 931), (iTime: 72; iValue: 938), (iTime: 148; iValue: 935),
    (iTime: 249; iValue: 941), (iTime: 297; iValue: 938), (iTime: 299; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp04: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 10; iValue: 0), (iTime: 25; iValue: 16),
    (iTime: 43; iValue: 221), (iTime: 64; iValue: 173), (iTime: 114; iValue: 171),
    (iTime: 284; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq04: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 9; iValue: 0), (iTime: 10; iValue: 1209),
    (iTime: 18; iValue: 1261), (iTime: 37; iValue: 1246), (iTime: 109; iValue: 1245),
    (iTime: 238; iValue: 1255), (iTime: 284; iValue: 1253), (iTime: 285; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp05: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 6; iValue: 0), (iTime: 13; iValue: 3),
    (iTime: 21; iValue: 0), (iTime: 28; iValue: 0), (iTime: 44; iValue: 210),
    (iTime: 59; iValue: 238), (iTime: 126; iValue: 224), (iTime: 199; iValue: 85),
    (iTime: 292; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq05: array[0..12] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 6; iValue: 1553),
    (iTime: 21; iValue: 1582), (iTime: 25; iValue: 1237), (iTime: 28; iValue: 1533),
    (iTime: 35; iValue: 1564), (iTime: 56; iValue: 1557), (iTime: 113; iValue: 1555),
    (iTime: 185; iValue: 1565), (iTime: 292; iValue: 1566), (iTime: 293; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp06: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 13; iValue: 0), (iTime: 17; iValue: 1),
    (iTime: 24; iValue: 0), (iTime: 30; iValue: 0), (iTime: 41; iValue: 63),
    (iTime: 67; iValue: 40), (iTime: 121; iValue: 38), (iTime: 278; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeFrq06: array[0..13] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 12; iValue: 0), (iTime: 13; iValue: 1907),
    (iTime: 22; iValue: 1883), (iTime: 28; iValue: 1544), (iTime: 30; iValue: 1856),
    (iTime: 36; iValue: 1878), (iTime: 52; iValue: 1871), (iTime: 113; iValue: 1866),
    (iTime: 169; iValue: 1878), (iTime: 225; iValue: 1876), (iTime: 278; iValue: 1891),
    (iTime: 280; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeAmp07: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 8; iValue: 0), (iTime: 14; iValue: 0),
    (iTime: 21; iValue: 0), (iTime: 32; iValue: 0), (iTime: 37; iValue: 22),
    (iTime: 119; iValue: 12), (iTime: 146; iValue: 3), (iTime: 194; iValue: 8),
    (iTime: 256; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq07: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 6; iValue: 0), (iTime: 8; iValue: 1978),
    (iTime: 21; iValue: 1923), (iTime: 28; iValue: 1717), (iTime: 32; iValue: 2191),
    (iTime: 111; iValue: 2177), (iTime: 188; iValue: 2193), (iTime: 229; iValue: 2182),
    (iTime: 256; iValue: 2194), (iTime: 257; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeAmp08: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 6; iValue: 0), (iTime: 14; iValue: 0),
    (iTime: 21; iValue: 0), (iTime: 37; iValue: 0), (iTime: 66; iValue: 5),
    (iTime: 106; iValue: 3), (iTime: 129; iValue: 4), (iTime: 199; iValue: 3),
    (iTime: 235; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq08: array[0..12] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 6; iValue: 2506),
    (iTime: 21; iValue: 2491), (iTime: 25; iValue: 1252), (iTime: 37; iValue: 2523),
    (iTime: 56; iValue: 2495), (iTime: 110; iValue: 2489), (iTime: 140; iValue: 2491),
    (iTime: 195; iValue: 2502), (iTime: 235; iValue: 2505), (iTime: 237; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp09: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 4; iValue: 0), (iTime: 14; iValue: 0),
    (iTime: 20; iValue: 0), (iTime: 36; iValue: 0), (iTime: 45; iValue: 32),
    (iTime: 78; iValue: 24), (iTime: 132; iValue: 25), (iTime: 161; iValue: 15),
    (iTime: 241; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq09: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 4; iValue: 2783),
    (iTime: 20; iValue: 2779), (iTime: 29; iValue: 1286), (iTime: 37; iValue: 2803),
    (iTime: 80; iValue: 2806), (iTime: 113; iValue: 2799), (iTime: 167; iValue: 2813),
    (iTime: 241; iValue: 2818), (iTime: 242; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeAmp10: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 6; iValue: 0), (iTime: 17; iValue: 2),
    (iTime: 22; iValue: 0), (iTime: 35; iValue: 0), (iTime: 47; iValue: 121),
    (iTime: 144; iValue: 112), (iTime: 206; iValue: 21), (iTime: 242; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeFrq10: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 6; iValue: 3123),
    (iTime: 22; iValue: 3115), (iTime: 29; iValue: 2229), (iTime: 35; iValue: 3118),
    (iTime: 70; iValue: 3117), (iTime: 113; iValue: 3109), (iTime: 200; iValue: 3130),
    (iTime: 242; iValue: 3131), (iTime: 243; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeAmp11: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 17; iValue: 1),
    (iTime: 24; iValue: 0), (iTime: 37; iValue: 0), (iTime: 47; iValue: 70),
    (iTime: 123; iValue: 67), (iTime: 167; iValue: 44), (iTime: 188; iValue: 16),
    (iTime: 239; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq11: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 4; iValue: 0), (iTime: 5; iValue: 3285),
    (iTime: 24; iValue: 3388), (iTime: 29; iValue: 1270), (iTime: 37; iValue: 3430),
    (iTime: 76; iValue: 3429), (iTime: 110; iValue: 3423), (iTime: 194; iValue: 3444),
    (iTime: 239; iValue: 3444), (iTime: 241; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeAmp12: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 14; iValue: 1), (iTime: 24; iValue: 0),
    (iTime: 37; iValue: 0), (iTime: 44; iValue: 49), (iTime: 79; iValue: 42),
    (iTime: 122; iValue: 46), (iTime: 185; iValue: 8), (iTime: 231; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeFrq12: array[0..9] of TENV = (
    (iTime: 1; iValue: 3627), (iTime: 24; iValue: 3664), (iTime: 29; iValue: 1690),
    (iTime: 37; iValue: 3739), (iTime: 90; iValue: 3742), (iTime: 115; iValue: 3733),
    (iTime: 187; iValue: 3760), (iTime: 231; iValue: 3763), (iTime: 233; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp13: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 4; iValue: 0), (iTime: 16; iValue: 0),
    (iTime: 24; iValue: 0), (iTime: 40; iValue: 0), (iTime: 47; iValue: 27),
    (iTime: 84; iValue: 22), (iTime: 126; iValue: 24), (iTime: 177; iValue: 7),
    (iTime: 229; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq13: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 4; iValue: 4081),
    (iTime: 24; iValue: 4064), (iTime: 30; iValue: 1350), (iTime: 40; iValue: 4064),
    (iTime: 57; iValue: 4049), (iTime: 148; iValue: 4051), (iTime: 181; iValue: 4074),
    (iTime: 229; iValue: 4069), (iTime: 230; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeAmp14: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 4; iValue: 0), (iTime: 16; iValue: 0),
    (iTime: 21; iValue: 0), (iTime: 41; iValue: 0), (iTime: 44; iValue: 13),
    (iTime: 63; iValue: 8), (iTime: 82; iValue: 7), (iTime: 111; iValue: 10),
    (iTime: 175; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq14: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 4; iValue: 4321),
    (iTime: 21; iValue: 4259), (iTime: 29; iValue: 1238), (iTime: 41; iValue: 4346),
    (iTime: 61; iValue: 4367), (iTime: 87; iValue: 4368), (iTime: 102; iValue: 4357),
    (iTime: 175; iValue: 4376), (iTime: 176; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeAmp15: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 47; iValue: 0), (iTime: 72; iValue: 3),
    (iTime: 97; iValue: 3), (iTime: 121; iValue: 1), (iTime: 161; iValue: 2),
    (iTime: 175; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq15: array[0..9] of TENV = (
    (iTime: 1;  iValue: 0), (iTime: 45; iValue: 0), (iTime: 47; iValue: 3164),
    (iTime: 55; iValue: 4557), (iTime: 68; iValue: 4662), (iTime: 98; iValue: 4670),
    (iTime: 142; iValue: 4661), (iTime: 175; iValue: 4666), (iTime: 176; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp16: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 48; iValue: 0), (iTime: 61; iValue: 4),
    (iTime: 86; iValue: 4), (iTime: 126; iValue: 3), (iTime: 137; iValue: 5),
    (iTime: 161; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq16: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 47; iValue: 0), (iTime: 48; iValue: 4567),
    (iTime: 49; iValue: 4978), (iTime: 75; iValue: 4990), (iTime: 109; iValue: 4982),
    (iTime: 138; iValue: 4985), (iTime: 161; iValue: 4996), (iTime: 163; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp17: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 51; iValue: 0), (iTime: 61; iValue: 5),
    (iTime: 76; iValue: 3), (iTime: 132; iValue: 3), (iTime: 164; iValue: 2),
    (iTime: 173; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq17: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 49; iValue: 0), (iTime: 51; iValue: 4634),
    (iTime: 55; iValue: 5313), (iTime: 66; iValue: 5301), (iTime: 99; iValue: 5301),
    (iTime: 129; iValue: 5292), (iTime: 173; iValue: 5318), (iTime: 175; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp18: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 52; iValue: 0), (iTime: 63; iValue: 2),
    (iTime: 91; iValue: 3), (iTime: 126; iValue: 3), (iTime: 156; iValue: 2),
    (iTime: 168; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq18: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 51; iValue: 0), (iTime: 52; iValue: 4729),
    (iTime: 59; iValue: 5606), (iTime: 92; iValue: 5611), (iTime: 122; iValue: 5605),
    (iTime: 152; iValue: 5611), (iTime: 168; iValue: 5628), (iTime: 169; iValue: 0),
    (iTime: 313; iValue: 0)           );

   envOboeAmp19: array[0..7] of TENV = (
     (iTime: 1; iValue: 0), (iTime: 47; iValue: 0), (iTime: 56; iValue: 2),
     (iTime: 80; iValue: 1), (iTime: 117; iValue: 2), (iTime: 159; iValue: 1),
     (iTime: 176; iValue: 0), (iTime: 313; iValue: 0)
                                       );

  envOboeFrq19: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 45; iValue: 0), (iTime: 47; iValue: 5772),
    (iTime: 57; iValue: 5921), (iTime: 86; iValue: 5928), (iTime: 114; iValue: 5914),
    (iTime: 150; iValue: 5938), (iTime: 176; iValue: 5930), (iTime: 177; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp20: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 49; iValue: 0), (iTime: 57; iValue: 2),
    (iTime: 83; iValue: 2), (iTime: 109; iValue: 1), (iTime: 159; iValue: 3),
    (iTime: 195; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq20: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 48; iValue: 0), (iTime: 49; iValue: 5369),
    (iTime: 57; iValue: 6268), (iTime: 76; iValue: 6230), (iTime: 145; iValue: 6234),
    (iTime: 184; iValue: 6263), (iTime: 195; iValue: 6244), (iTime: 196; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envOboeAmp21: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 57; iValue: 0), (iTime: 61; iValue: 0),
    (iTime: 88; iValue: 1), (iTime: 113; iValue: 0), (iTime: 129; iValue: 1),
    (iTime: 140; iValue: 0), (iTime: 313; iValue: 0)
                                      );

  envOboeFrq21: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 56; iValue: 0), (iTime: 57; iValue: 5477),
    (iTime: 61; iValue: 6440), (iTime: 71; iValue: 6550), (iTime: 97; iValue: 6538),
    (iTime: 122; iValue: 6554), (iTime: 140; iValue: 6548), (iTime: 141; iValue: 0),
    (iTime: 313; iValue: 0)           );

  envClarAmp01: array[0..6] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 7; iValue: 0), (iTime: 20; iValue: 6),
    (iTime: 32; iValue: 73), (iTime: 48; iValue: 445), (iTime: 199; iValue: 361),
    (iTime: 330;  iValue: 0)          );

  envClarFrq01: array[0..8] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 6; iValue: 0), (iTime: 7; iValue: 282),
    (iTime: 19; iValue: 368), (iTime: 21; iValue: 314), (iTime: 46; iValue: 310),
    (iTime: 141; iValue: 312), (iTime: 284; iValue: 313), (iTime: 330; iValue: 314)
                                      );

  envClarAmp02: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 24; iValue: 0), (iTime: 43; iValue: 22),
    (iTime: 104; iValue: 2), (iTime: 193; iValue: 4), (iTime: 238; iValue: 10),
    (iTime: 301; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq02: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 23; iValue: 0), (iTime: 24; iValue: 629),
    (iTime: 68; iValue: 619), (iTime: 116; iValue: 616), (iTime: 167; iValue: 633),
    (iTime: 223; iValue: 624), (iTime: 301; iValue: 627), (iTime: 302; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp03: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 15; iValue: 0), (iTime: 37; iValue: 12),
    (iTime: 48; iValue: 159), (iTime: 204; iValue: 122), (iTime: 286; iValue: 17),
    (iTime: 309; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq03: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 14; iValue: 0), (iTime: 15; iValue: 803),
    (iTime: 24; iValue: 928), (iTime: 36; iValue: 898), (iTime: 46; iValue: 931),
    (iTime: 113; iValue: 939), (iTime: 330; iValue: 942)
                                      );

  envClarAmp04: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 9; iValue: 0), (iTime: 19; iValue: 2),
    (iTime: 24; iValue: 0), (iTime: 39; iValue: 0), (iTime: 49; iValue: 26),
    (iTime: 103; iValue: 3), (iTime: 167; iValue: 5), (iTime: 229; iValue: 10),
    (iTime: 291; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq04: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 7; iValue: 0), (iTime: 9; iValue: 1261),
    (iTime: 24; iValue: 1314), (iTime: 30; iValue: 327), (iTime: 39; iValue: 1245),
    (iTime: 105; iValue: 1243), (iTime: 215; iValue: 1257), (iTime: 246; iValue: 1249),
    (iTime: 291; iValue: 1261), (iTime: 292; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarAmp05: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 6; iValue: 0), (iTime: 18; iValue: 5),
    (iTime: 25; iValue: 0), (iTime: 39; iValue: 0), (iTime: 54; iValue: 375),
    (iTime: 212; iValue: 210), (iTime: 266; iValue: 20), (iTime: 295; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq05: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 6; iValue: 1572),
    (iTime: 25; iValue: 1528), (iTime: 32; iValue: 911), (iTime: 38; iValue: 1560),
    (iTime: 67; iValue: 1554), (iTime: 127; iValue: 1565), (iTime: 308; iValue: 1569),
    (iTime: 309; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarAmp06: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue: 0), (iTime: 11; iValue: 0),
    (iTime: 15; iValue: 0), (iTime: 41; iValue: 0), (iTime: 48; iValue: 25),
    (iTime: 108; iValue: 4), (iTime: 216; iValue: 12), (iTime: 282; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq06: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 3; iValue: 1934),
    (iTime: 12; iValue: 1890), (iTime: 33; iValue: 320), (iTime: 46; iValue: 1862),
    (iTime: 186; iValue: 1883), (iTime: 282; iValue: 1875), (iTime: 283; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp07: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 18; iValue: 1),
    (iTime: 24; iValue: 0), (iTime: 42; iValue: 0), (iTime: 52; iValue: 108),
    (iTime: 127; iValue: 46), (iTime: 177; iValue: 42), (iTime: 253; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq07: array[0..8] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 2180), (iTime: 24; iValue: 2148),
    (iTime: 34; iValue: 795), (iTime: 43; iValue: 2167), (iTime: 113; iValue: 2193),
    (iTime: 253; iValue: 2192), (iTime: 255; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarAmp08: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 14; iValue: 1),
    (iTime: 23; iValue: 0), (iTime: 43; iValue: 0), (iTime: 52; iValue: 83),
    (iTime: 110; iValue: 17), (iTime: 199; iValue: 18), (iTime: 242; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq08: array[0..8] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 2458), (iTime: 23; iValue: 2343),
    (iTime: 33; iValue: 328), (iTime: 45; iValue: 2472), (iTime: 125; iValue: 2507),
    (iTime: 242; iValue: 2510), (iTime: 243; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarAmp09: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 20; iValue: 2),
    (iTime: 21; iValue: 3), (iTime: 27; iValue: 0), (iTime: 42; iValue: 0),
    (iTime: 55; iValue: 127), (iTime: 132; iValue: 73), (iTime: 163; iValue: 71),
    (iTime: 255; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq09: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue: 0), (iTime: 5; iValue: 2849),
    (iTime: 27; iValue: 2688), (iTime: 33; iValue: 964), (iTime: 42; iValue: 2792),
    (iTime: 128; iValue: 2822), (iTime: 255; iValue: 2819), (iTime: 256; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp10: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 23; iValue: 1),
    (iTime: 30; iValue: 0), (iTime: 47; iValue: 0), (iTime: 54; iValue: 32),
    (iTime: 92; iValue: 17), (iTime: 232; iValue: 7), (iTime:  247; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq10: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue: 0), (iTime: 5; iValue: 3173),
    (iTime: 30; iValue: 3030), (iTime: 39; iValue: 2320), (iTime: 50; iValue: 3096),
    (iTime: 134; iValue: 3136), (iTime: 247; iValue: 3138), (iTime: 248; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp11: array[0..8] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 23; iValue: 1), (iTime: 28; iValue: 0),
    (iTime: 39; iValue: 0), (iTime: 59; iValue: 44), (iTime: 122; iValue: 26),
    (iTime: 153; iValue: 26), (iTime: 262; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq11: array[0..7] of TENV = (
    (iTime: 1; iValue: 3313), (iTime: 28; iValue: 3279), (iTime: 34; iValue: 1768),
    (iTime: 43; iValue: 3420), (iTime: 127; iValue: 3448), (iTime: 262; iValue: 3441),
    (iTime: 264; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarAmp12: array[0..8] of TENV = (
    (iTime: 1;  iValue: 0), (iTime: 10; iValue: 2), (iTime: 21; iValue: 0),
    (iTime: 46; iValue: 0), (iTime: 52; iValue: 53), (iTime: 158; iValue: 9),
    (iTime: 206; iValue: 28), (iTime: 255; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq12: array[0..7] of TENV = (
    (iTime: 1; iValue: 3756), (iTime: 21; iValue: 3728), (iTime: 33; iValue: 2095),
    (iTime: 47; iValue: 3741), (iTime: 136; iValue: 3762), (iTime: 255; iValue: 3759),
    (iTime: 256; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarAmp13: array[0..10] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue:  0), (iTime: 16; iValue: 1),
    (iTime: 29; iValue: 0), (iTime: 41; iValue: 0), (iTime: 46; iValue: 24),
    (iTime: 52; iValue: 8), (iTime: 77; iValue: 57), (iTime: 192; iValue: 8),
    (iTime: 250; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq13: array[0..11] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 3; iValue: 4152),
    (iTime: 29; iValue: 3868), (iTime: 36; iValue: 2240), (iTime: 46; iValue: 4045),
    (iTime: 85; iValue: 4049), (iTime: 128; iValue: 4078), (iTime: 181; iValue: 4078),
    (iTime: 250; iValue: 4103), (iTime: 251; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarAmp14: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue: 0), (iTime: 16; iValue: 0),
    (iTime: 20; iValue: 0), (iTime: 48; iValue: 0), (iTime: 56; iValue: 38),
    (iTime: 110; iValue: 3), (iTime: 188; iValue: 14), (iTime: 228; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq14: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 2; iValue: 0), (iTime: 3; iValue: 4213),
    (iTime: 20; iValue: 4119), (iTime: 36; iValue: 1566), (iTime: 48; iValue: 4344),
    (iTime: 130; iValue: 4388), (iTime: 228; iValue: 4388), (iTime: 229; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp15: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 5; iValue: 0), (iTime: 23; iValue: 1),
    (iTime: 28; iValue: 0), (iTime: 50; iValue: 0), (iTime: 77; iValue: 14),
    (iTime: 202; iValue: 1), (iTime: 219; iValue: 2), (iTime: 247; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq15: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 3; iValue: 0), (iTime: 5; iValue: 4624),
    (iTime: 28; iValue: 4496), (iTime: 33; iValue: 1012), (iTime: 48; iValue: 4649),
    (iTime: 122; iValue: 4703), (iTime: 247; iValue: 4685), (iTime: 248; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp16: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 14; iValue: 0), (iTime: 24; iValue: 0),
    (iTime: 38; iValue: 0), (iTime: 64; iValue: 12), (iTime: 104; iValue: 4),
    (iTime: 145; iValue: 4), (iTime: 215; iValue: 1), (iTime: 238; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarFrq16: array[0..9] of TENV = (
    (iTime: 1; iValue: 4928), (iTime: 24; iValue: 4751), (iTime: 36; iValue: 1072),
    (iTime: 52; iValue: 4965), (iTime: 117; iValue: 5006), (iTime: 155; iValue: 5003),
    (iTime: 198; iValue: 5020), (iTime: 238; iValue: 3197), (iTime: 239; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp17: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 58; iValue: 0), (iTime: 95; iValue: 12),
    (iTime: 136; iValue: 13), (iTime: 201; iValue: 1), (iTime: 220; iValue: 3),
    (iTime: 233; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq17: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 45; iValue: 0), (iTime: 46; iValue: 5005),
    (iTime: 58; iValue: 3759), (iTime: 63; iValue: 5285), (iTime: 119; iValue: 5325),
    (iTime: 180; iValue: 5325), (iTime: 233; iValue: 5367), (iTime: 234; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp18: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 50; iValue: 0), (iTime: 61; iValue: 5),
    (iTime: 100; iValue: 0), (iTime: 141; iValue: 4), (iTime: 185; iValue: 2),
    (iTime: 208; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq18: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 48; iValue: 0), (iTime: 50; iValue: 4926),
    (iTime: 52; iValue: 5563), (iTime: 94; iValue: 5628), (iTime: 113; iValue: 5602),
    (iTime: 137; iValue: 5634), (iTime: 208; iValue: 5646), (iTime: 210; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp19: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 58; iValue: 0), (iTime: 63; iValue: 1),
    (iTime: 85; iValue: 0), (iTime: 140; iValue: 1), (iTime: 171; iValue: 0),
    (iTime: 183; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq19: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 56; iValue: 0), (iTime: 58; iValue: 3938),
    (iTime: 65; iValue: 5753), (iTime: 79; iValue: 5930), (iTime: 104; iValue: 5889),
    (iTime: 152; iValue: 5916), (iTime: 183; iValue: 5880), (iTime: 184; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp20: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 50; iValue: 0), (iTime: 64; iValue: 5),
    (iTime: 103; iValue: 1), (iTime: 139; iValue: 1), (iTime: 177; iValue: 2),
    (iTime: 219; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq20: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 48; iValue: 0), (iTime: 50; iValue: 5192),
    (iTime: 58; iValue: 6209), (iTime: 121; iValue: 6266), (iTime: 190; iValue: 6266),
    (iTime: 204; iValue: 6238), (iTime: 219; iValue: 6288), (iTime: 220; iValue: 0),
    (iTime: 330; iValue: 0)           );

  envClarAmp21: array[0..7] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 70; iValue: 0), (iTime: 79; iValue: 3),
    (iTime: 113; iValue: 3), (iTime: 141; iValue: 1), (iTime: 206; iValue: 1),
    (iTime: 219; iValue: 0), (iTime: 330; iValue: 0)
                                      );

  envClarFrq21: array[0..9] of TENV = (
    (iTime: 1; iValue: 0), (iTime: 69; iValue: 0), (iTime: 70; iValue: 4245),
    (iTime: 77; iValue: 6537), (iTime: 116; iValue: 6567), (iTime: 140; iValue: 6571),
    (iTime: 176; iValue: 6564), (iTime: 219; iValue: 6583), (iTime: 220; iValue: 0),
    (iTime: 330; iValue: 0)           );

  prtTrum: array[0..11] of TPRT = (
    (iNumAmp: SizeOf(envTrumAmp01) div SizeOf(TENV); pEnvAmp: @envTrumAmp01[0];
     iNumFrq: SizeOf(envTrumFrq01) div SizeOf(TENV); pEnvFrq: @envTrumFrq01[0]),
    (iNumAmp: SizeOf(envTrumAmp02) div SizeOf(TENV); pEnvAmp: @envTrumAmp02[0];
     iNumFrq: SizeOf(envTrumFrq02) div SizeOf(TENV); pEnvFrq: @envTrumFrq02[0]),
    (iNumAmp: SizeOf(envTrumAmp03) div SizeOf(TENV); pEnvAmp: @envTrumAmp03[0];
     iNumFrq: SizeOf(envTrumFrq03) div SizeOf(TENV); pEnvFrq: @envTrumFrq03[0]),
    (iNumAmp: SizeOf(envTrumAmp04) div SizeOf(TENV); pEnvAmp: @envTrumAmp04[0];
     iNumFrq: SizeOf(envTrumFrq04) div SizeOf(TENV); pEnvFrq: @envTrumFrq04[0]),
    (iNumAmp: SizeOf(envTrumAmp05) div SizeOf(TENV); pEnvAmp: @envTrumAmp05[0];
     iNumFrq: SizeOf(envTrumFrq05) div SizeOf(TENV); pEnvFrq: @envTrumFrq05[0]),
    (iNumAmp: SizeOf(envTrumAmp06) div SizeOf(TENV); pEnvAmp: @envTrumAmp06[0];
     iNumFrq: SizeOf(envTrumFrq06) div SizeOf(TENV); pEnvFrq: @envTrumFrq06[0]),
    (iNumAmp: SizeOf(envTrumAmp07) div SizeOf(TENV); pEnvAmp: @envTrumAmp07[0];
     iNumFrq: SizeOf(envTrumFrq07) div SizeOf(TENV); pEnvFrq: @envTrumFrq07[0]),
    (iNumAmp: SizeOf(envTrumAmp08) div SizeOf(TENV); pEnvAmp: @envTrumAmp08[0];
     iNumFrq: SizeOf(envTrumFrq08) div SizeOf(TENV); pEnvFrq: @envTrumFrq08[0]),
    (iNumAmp: SizeOf(envTrumAmp09) div SizeOf(TENV); pEnvAmp: @envTrumAmp09[0];
     iNumFrq: SizeOf(envTrumFrq09) div SizeOf(TENV); pEnvFrq: @envTrumFrq09[0]),
    (iNumAmp: SizeOf(envTrumAmp10) div SizeOf(TENV); pEnvAmp: @envTrumAmp10[0];
     iNumFrq: SizeOf(envTrumFrq10) div SizeOf(TENV); pEnvFrq: @envTrumFrq10[0]),
    (iNumAmp: SizeOf(envTrumAmp11) div SizeOf(TENV); pEnvAmp: @envTrumAmp11[0];
     iNumFrq: SizeOf(envTrumFrq11) div SizeOf(TENV); pEnvFrq: @envTrumFrq11[0]),
    (iNumAmp: SizeOf(envTrumAmp12) div SizeOf(TENV); pEnvAmp: @envTrumAmp12[0];
     iNumFrq: SizeOf(envTrumFrq12) div SizeOf(TENV); pEnvFrq: @envTrumFrq12[0])
                                  );

  prtOboe: array[0..20] of TPRT = (
    (iNumAmp: SizeOf(envOboeAmp01) div SizeOf(TENV); pEnvAmp: @envOboeAmp01[0];
     iNumFrq: SizeOf(envOboeFrq01) div SizeOf(TENV); pEnvFrq: @envOboeFrq01[0]),
    (iNumAmp: SizeOf(envOboeAmp02) div SizeOf(TENV); pEnvAmp: @envOboeAmp02[0];
     iNumFrq: SizeOf(envOboeFrq02) div SizeOf(TENV); pEnvFrq: @envOboeFrq02[0]),
    (iNumAmp: SizeOf(envOboeAmp03) div SizeOf(TENV); pEnvAmp: @envOboeAmp03[0];
     iNumFrq: SizeOf(envOboeFrq03) div SizeOf(TENV); pEnvFrq: @envOboeFrq03[0]),
    (iNumAmp: SizeOf(envOboeAmp04) div SizeOf(TENV); pEnvAmp: @envOboeAmp04[0];
     iNumFrq: SizeOf(envOboeFrq04) div SizeOf(TENV); pEnvFrq: @envOboeFrq04[0]),
    (iNumAmp: SizeOf(envOboeAmp05) div SizeOf(TENV); pEnvAmp: @envOboeAmp05[0];
     iNumFrq: SizeOf(envOboeFrq05) div SizeOf(TENV); pEnvFrq: @envOboeFrq05[0]),
    (iNumAmp: SizeOf(envOboeAmp06) div SizeOf(TENV); pEnvAmp: @envOboeAmp06[0];
     iNumFrq: SizeOf(envOboeFrq06) div SizeOf(TENV); pEnvFrq: @envOboeFrq06[0]),
    (iNumAmp: SizeOf(envOboeAmp07) div SizeOf(TENV); pEnvAmp: @envOboeAmp07[0];
     iNumFrq: SizeOf(envOboeFrq07) div SizeOf(TENV); pEnvFrq: @envOboeFrq07[0]),
    (iNumAmp: SizeOf(envOboeAmp08) div SizeOf(TENV); pEnvAmp: @envOboeAmp08[0];
     iNumFrq: SizeOf(envOboeFrq08) div SizeOf(TENV); pEnvFrq: @envOboeFrq08[0]),
    (iNumAmp: SizeOf(envOboeAmp09) div SizeOf(TENV); pEnvAmp: @envOboeAmp09[0];
     iNumFrq: SizeOf(envOboeFrq09) div SizeOf(TENV); pEnvFrq: @envOboeFrq09[0]),
    (iNumAmp: SizeOf(envOboeAmp10) div SizeOf(TENV); pEnvAmp: @envOboeAmp10[0];
     iNumFrq: SizeOf(envOboeFrq10) div SizeOf(TENV); pEnvFrq: @envOboeFrq10[0]),
    (iNumAmp: SizeOf(envOboeAmp11) div SizeOf(TENV); pEnvAmp: @envOboeAmp11[0];
     iNumFrq: SizeOf(envOboeFrq11) div SizeOf(TENV); pEnvFrq: @envOboeFrq11[0]),
    (iNumAmp: SizeOf(envOboeAmp12) div SizeOf(TENV); pEnvAmp: @envOboeAmp12[0];
     iNumFrq: SizeOf(envOboeFrq12) div SizeOf(TENV); pEnvFrq: @envOboeFrq12[0]),
    (iNumAmp: SizeOf(envOboeAmp13) div SizeOf(TENV); pEnvAmp: @envOboeAmp13[0];
     iNumFrq: SizeOf(envOboeFrq13) div SizeOf(TENV); pEnvFrq: @envOboeFrq13[0]),
    (iNumAmp: SizeOf(envOboeAmp14) div SizeOf(TENV); pEnvAmp: @envOboeAmp14[0];
     iNumFrq: SizeOf(envOboeFrq14) div SizeOf(TENV); pEnvFrq: @envOboeFrq14[0]),
    (iNumAmp: SizeOf(envOboeAmp15) div SizeOf(TENV); pEnvAmp: @envOboeAmp15[0];
     iNumFrq: SizeOf(envOboeFrq15) div SizeOf(TENV); pEnvFrq: @envOboeFrq15[0]),
    (iNumAmp: SizeOf(envOboeAmp16) div SizeOf(TENV); pEnvAmp: @envOboeAmp16[0];
     iNumFrq: SizeOf(envOboeFrq16) div SizeOf(TENV); pEnvFrq: @envOboeFrq16[0]),
    (iNumAmp: SizeOf(envOboeAmp17) div SizeOf(TENV); pEnvAmp: @envOboeAmp17[0];
     iNumFrq: SizeOf(envOboeFrq17) div SizeOf(TENV); pEnvFrq: @envOboeFrq17[0]),
    (iNumAmp: SizeOf(envOboeAmp18) div SizeOf(TENV); pEnvAmp: @envOboeAmp18[0];
     iNumFrq: SizeOf(envOboeFrq18) div SizeOf(TENV); pEnvFrq: @envOboeFrq18[0]),
    (iNumAmp: SizeOf(envOboeAmp19) div SizeOf(TENV); pEnvAmp: @envOboeAmp19[0];
     iNumFrq: SizeOf(envOboeFrq19) div SizeOf(TENV); pEnvFrq: @envOboeFrq19[0]),
    (iNumAmp: SizeOf(envOboeAmp20) div SizeOf(TENV); pEnvAmp: @envOboeAmp20[0];
     iNumFrq: SizeOf(envOboeFrq20) div SizeOf(TENV); pEnvFrq: @envOboeFrq20[0]),
    (iNumAmp: SizeOf(envOboeAmp21) div SizeOf(TENV); pEnvAmp: @envOboeAmp21[0];
     iNumFrq: SizeOf(envOboeFrq21) div SizeOf(TENV); pEnvFrq: @envOboeFrq21[0])
                                  );

  prtClar: array[0..20] of TPRT = (
    (iNumAmp: SizeOf(envClarAmp01) div SizeOf(TENV); pEnvAmp: @envClarAmp01[0];
     iNumFrq: SizeOf(envClarFrq01) div SizeOf(TENV); pEnvFrq: @envClarFrq01[0]),
    (iNumAmp: SizeOf(envClarAmp02) div SizeOf(TENV); pEnvAmp: @envClarAmp02[0];
     iNumFrq: SizeOf(envClarFrq02) div SizeOf(TENV); pEnvFrq: @envClarFrq02[0]),
    (iNumAmp: SizeOf(envClarAmp03) div SizeOf(TENV); pEnvAmp: @envClarAmp03[0];
     iNumFrq: SizeOf(envClarFrq03) div SizeOf(TENV); pEnvFrq: @envClarFrq03[0]),
    (iNumAmp: SizeOf(envClarAmp04) div SizeOf(TENV); pEnvAmp: @envClarAmp04[0];
     iNumFrq: SizeOf(envClarFrq04) div SizeOf(TENV); pEnvFrq: @envClarFrq04[0]),
    (iNumAmp: SizeOf(envClarAmp05) div SizeOf(TENV); pEnvAmp: @envClarAmp05[0];
     iNumFrq: SizeOf(envClarFrq05) div SizeOf(TENV); pEnvFrq: @envClarFrq05[0]),
    (iNumAmp: SizeOf(envClarAmp06) div SizeOf(TENV); pEnvAmp: @envClarAmp06[0];
     iNumFrq: SizeOf(envClarFrq06) div SizeOf(TENV); pEnvFrq: @envClarFrq06[0]),
    (iNumAmp: SizeOf(envClarAmp07) div SizeOf(TENV); pEnvAmp: @envClarAmp07[0];
     iNumFrq: SizeOf(envClarFrq07) div SizeOf(TENV); pEnvFrq: @envClarFrq07[0]),
    (iNumAmp: SizeOf(envClarAmp08) div SizeOf(TENV); pEnvAmp: @envClarAmp08[0];
     iNumFrq: SizeOf(envClarFrq08) div SizeOf(TENV); pEnvFrq: @envClarFrq08[0]),
    (iNumAmp: SizeOf(envClarAmp09) div SizeOf(TENV); pEnvAmp: @envClarAmp09[0];
     iNumFrq: SizeOf(envClarFrq09) div SizeOf(TENV); pEnvFrq: @envClarFrq09[0]),
    (iNumAmp: SizeOf(envClarAmp10) div SizeOf(TENV); pEnvAmp: @envClarAmp10[0];
     iNumFrq: SizeOf(envClarFrq10) div SizeOf(TENV); pEnvFrq: @envClarFrq10[0]),
    (iNumAmp: SizeOf(envClarAmp11) div SizeOf(TENV); pEnvAmp: @envClarAmp11[0];
     iNumFrq: SizeOf(envClarFrq11) div SizeOf(TENV); pEnvFrq: @envClarFrq11[0]),
    (iNumAmp: SizeOf(envClarAmp12) div SizeOf(TENV); pEnvAmp: @envClarAmp12[0];
     iNumFrq: SizeOf(envClarFrq12) div SizeOf(TENV); pEnvFrq: @envClarFrq12[0]),
    (iNumAmp: SizeOf(envClarAmp13) div SizeOf(TENV); pEnvAmp: @envClarAmp13[0];
     iNumFrq: SizeOf(envClarFrq13) div SizeOf(TENV); pEnvFrq: @envClarFrq13[0]),
    (iNumAmp: SizeOf(envClarAmp14) div SizeOf(TENV); pEnvAmp: @envClarAmp14[0];
     iNumFrq: SizeOf(envClarFrq14) div SizeOf(TENV); pEnvFrq: @envClarFrq14[0]),
    (iNumAmp: SizeOf(envClarAmp15) div SizeOf(TENV); pEnvAmp: @envClarAmp15[0];
     iNumFrq: SizeOf(envClarFrq15) div SizeOf(TENV); pEnvFrq: @envClarFrq15[0]),
    (iNumAmp: SizeOf(envClarAmp16) div SizeOf(TENV); pEnvAmp: @envClarAmp16[0];
     iNumFrq: SizeOf(envClarFrq16) div SizeOf(TENV); pEnvFrq: @envClarFrq16[0]),
    (iNumAmp: SizeOf(envClarAmp17) div SizeOf(TENV); pEnvAmp: @envClarAmp17[0];
     iNumFrq: SizeOf(envClarFrq17) div SizeOf(TENV); pEnvFrq: @envClarFrq17[0]),
    (iNumAmp: SizeOf(envClarAmp18) div SizeOf(TENV); pEnvAmp: @envClarAmp18[0];
     iNumFrq: SizeOf(envClarFrq18) div SizeOf(TENV); pEnvFrq: @envClarFrq18[0]),
    (iNumAmp: SizeOf(envClarAmp19) div SizeOf(TENV); pEnvAmp: @envClarAmp19[0];
     iNumFrq: SizeOf(envClarFrq19) div SizeOf(TENV); pEnvFrq: @envClarFrq19[0]),
    (iNumAmp: SizeOf(envClarAmp20) div SizeOf(TENV); pEnvAmp: @envClarAmp20[0];
     iNumFrq: SizeOf(envClarFrq20) div SizeOf(TENV); pEnvFrq: @envClarFrq20[0]),
    (iNumAmp: SizeOf(envClarAmp21) div SizeOf(TENV); pEnvAmp: @envClarAmp21[0];
     iNumFrq: SizeOf(envClarFrq21) div SizeOf(TENV); pEnvFrq: @envClarFrq21[0])
                                  );
                                  
  insTrum: TINS = (iMsecTime: 360; iNumPartials: 12; pprt: @prtTrum[0]);
  insOboe: TINS = (iMsecTime: 313; iNumPartials: 21; pprt: @prtOboe[0]);
  insClar: TINS = (iMsecTime: 330; iNumPartials: 21; pprt: @prtClar[0]);

  // 数组成员地址
function ENVpt(First: PENV; Index: Integer): PENV;
begin
  Result := PENV(Integer(First) + Index * SizeOf(TENV));
end;

  // 数组成员地址
function PRTpt(First: PPRT; Index: Integer): PPRT;
begin
  Result := PPRT(Integer(First) + Index * SizeOf(TPRT));
end;

  // Sine wave generator
function SineGenerator(dFreq: Double; pdAngle: PDouble): Double;
const
  PI = 3.14159;
begin
  Result := Sin(pdAngle^);
  pdAngle^ :=  pdAngle^ + 2 * PI * dFreq / SAMPLE_RATE;
  if (pdAngle^ >= 2 * PI) then pdAngle^ := pdAngle^ - 2 * PI;
end;

  // Fill a buffer with composite waveform
const MAX_PARTIALS = 21;
var dAngle: array[0..MAX_PARTIALS] of Double;
procedure FillBuffer(ins: TINS; pBuffer: PByte; iNumSamples: Integer);
var
  dAmp, dFrq, dComp, dFrac: Double;
  i, iPrt, iMsecTime, iCompMaxAmp, iMaxAmp, iSmp: Integer;
begin  
 // Calculate the composite maximum amplitude
  iCompMaxAmp := 0;
  for iPrt := 0 to ins.iNumPartials - 1 do
  begin
    iMaxAmp := 0;
    for i := 0 to PPRT(Integer(ins.pprt) + iPrt * SizeOf(TPRT)).iNumAmp - 1 do
      iMaxAmp := Max(iMaxAmp, ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i).iValue);
    Inc(iCompMaxAmp, iMaxAmp);
  end;

 // Loop through each sample
  for iSmp := 0 to iNumSamples - 1 do
  begin
    dComp := 0;
    iMsecTime := Trunc(1000 * iSmp / SAMPLE_RATE);

   // Loop through each partial
    for iPrt := 0 to ins.iNumPartials - 1 do
    begin
      dAmp := 0;
      dFrq := 0;
      for i := 0 to PPRT(Integer(ins.pprt) + iPrt * SizeOf(TPRT)).iNumAmp - 2 do
      begin              
        if (iMsecTime >= ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i).iTime) and
          (iMsecTime <= ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i + 1).iTime) then
        begin
          dFrac :=
            (iMsecTime - ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i).iTime) /
            (ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i + 1).iTime -
             ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i).iTime );
          dAmp :=
            dFrac * ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i + 1).iValue +
            (1-dFrac) * ENVpt(PRTpt(ins.pprt, iPrt).pEnvAmp, i).iValue;
          Break;
        end;
      end;
      for i := 0 to PRTpt(ins.pprt, iPrt).iNumFrq - 2 do
      begin
        if (iMsecTime >= ENVpt(PRTpt(ins.pprt, iPrt).pEnvFrq, i).iTime) and
          (iMsecTime <= ENVpt(PRTpt(ins.pprt, iPrt).pEnvFrq, i + 1).iTime) then
        begin
          dFrac := (iMsecTime - ENVpt(PRTpt(ins.pprt, iPrt).pEnvFrq, i).iTime) /
            (ENVpt(PRTpt(ins.pprt, iPrt).pEnvFrq, i + 1).iTime -
            ENVpt(PRTpt(ins.pprt, iPrt).pEnvFrq, i).iTime);
          dFrq := dFrac * ENVpt(PRTpt(ins.pprt, iPrt).pEnvFrq, i + 1).iValue +
            (1 - dFrac) * ENVpt(PRTpt(ins.pprt, iPrt).pEnvFrq, i).iValue;
          Break;
        end;
      end;
      dComp := dComp + dAmp * SineGenerator(dFrq, @dAngle[iPrt]);
    end;
    PByte(Integer(pBuffer) + iSmp)^ := Trunc(127 + 127 * dComp / iCompMaxAmp);
  end;
end;

  // Make a waveform file
function MakeWaveFile(ins: TINS; szFileName: PChar): Boolean;
var
  dwWritten: DWORD;
  hFile: THandle;
  iChunkSize, iPcmSize, iNumSamples: Integer;
  pBuffer: PByte;
  waveform: TWaveForMatex;
begin
  Result := FALSE;

  hFile := CreateFile(szFileName, GENERIC_WRITE, 0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (hFile = INVALID_HANDLE_VALUE) then Exit;
  
  iNumSamples := Trunc((ins.iMsecTime * SAMPLE_RATE / 1000 + 1) / 2 * 2);
  iPcmSize := SizeOf(PCMWAVEFORMAT);
  iChunkSize := 12 + iPcmSize + 8 + iNumSamples;

  GetMem(pBuffer, iNumSamples);
  if (pBuffer = nil) then
  begin
    CloseHandle(hFile);
    Exit;
  end;
  FillBuffer(ins, pBuffer, iNumSamples);
  
  waveform.wFormatTag := WAVE_FORMAT_PCM;
  waveform.nChannels := 1;
  waveform.nSamplesPerSec := SAMPLE_RATE;
  waveform.nAvgBytesPerSec := SAMPLE_RATE;
  waveform.nBlockAlign := 1;
  waveform.wBitsPerSample := 8;
  waveform.cbSize := 0;
  
  WriteFile(hFile, 'RIFF', 4, dwWritten, nil);
  WriteFile(hFile, iChunkSize, 4, dwWritten, nil);
  WriteFile(hFile, 'WAVEfmt ', 8, dwWritten, nil);
  WriteFile(hFile, iPcmSize, 4, dwWritten, nil);
  WriteFile(hFile, waveform, SizeOf(TWaveForMatex) - 2, dwWritten, nil);
  WriteFile(hFile, 'data', 4, dwWritten, nil);
  WriteFile(hFile, iNumSamples, 4, dwWritten, nil);
  WriteFile(hFile, pBuffer^, iNumSamples, dwWritten, nil);

  CloseHandle(hFile);
  FreeMem(pBuffer);

  if (Integer(dwWritten) <> iNumSamples) then
  begin
    DeleteFile(szFileName);
    Exit;
  end;
  
  Result := TRUE;
end;

   // 文件不存在则建立
procedure TestAndCreateFile(hWnd: HWND; ins: TINS; szFileName: PChar; idButton: Integer);
var
  szMessage: array[0..64] of Char;
  List: PChar;
begin
  if (GetFileAttributes(szFileName) <> DWORD(-1)) then
    EnableWindow(GetDlgItem(hWnd, idButton), TRUE)
  else begin
    if (MakeWaveFile(ins, szFileName)) then
      EnableWindow(GetDlgItem(hwnd, idButton), TRUE)
    else begin
      List := szFileName;
      wvsprintf(szMessage, 'Could not create %x.', @List);
      MessageBeep(MB_ICONEXCLAMATION);
      MessageBox(hwnd, szMessage, szAppName, MB_OK or MB_ICONEXCLAMATION);
    end;
  end;  
end;

  // 对话框消息接收回调函数
function DlgProc(hDlg: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; stdcall;
const
  szTrum = 'Trumpet.wav';
  szOboe = 'Oboe.wav';
  szClar = 'Clarinet.wav';
  ID_TIMER = 1; // 定时器ID 
  IDC_TRUMPET  = 1000; // 控件ID..
  IDC_OBOE     = 1001;
  IDC_CLARINET = 1002;
  IDC_TEXT     = 1003;
begin
  Result := TRUE;
  case (Msg) of
    WM_INITDIALOG:
      begin
        SetTimer(hDlg, ID_TIMER, 1, nil);
      end;

    WM_TIMER:
      begin
        KillTimer(hDlg, ID_TIMER);

        SetCursor(LoadCursor(0, IDC_WAIT));
        ShowCursor(TRUE);

        TestAndCreateFile(hDlg, insTrum, szTrum, IDC_TRUMPET);
        TestAndCreateFile(hDlg, insOboe, szOboe, IDC_OBOE);
        TestAndCreateFile(hDlg, insClar, szClar, IDC_CLARINET);
        SetDlgItemText(hDlg, IDC_TEXT, ' ');
        SetFocus(GetDlgItem(hDlg, IDC_TRUMPET));

        ShowCursor(FALSE);
        SetCursor(LoadCursor(0, IDC_ARROW));
      end;

    WM_COMMAND:
      begin
        case LOWORD(wParam) of
          IDC_TRUMPET:
            PlaySound(szTrum, 0, SND_FILENAME or SND_SYNC);
          IDC_OBOE:
            PlaySound(szOboe, 0, SND_FILENAME or SND_SYNC);
          IDC_CLARINET:
            PlaySound(szClar, 0, SND_FILENAME or SND_SYNC);
          else
            Result := FALSE;
        end;
      end;

    WM_SYSCOMMAND:
      if (LOWORD(wParam) = SC_CLOSE) then EndDialog(hDlg, 0) else Result := FALSE;

    else
      Result := FALSE;
  end;
end;

begin
  if (DialogBox(hInstance, szAppName, 0, @DlgProc) = -1) then
    MessageBox(0, 'This program requires Windows NT!', szAppName, MB_ICONERROR);
end.

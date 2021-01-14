RX Library 2.75
===============

Installation
------------

Uninstall previous installed version of RX Library from Delphi 6 IDE.

(Open Component->Install Packages, Select RX Library 'RX xxx' items,

Click 'Remove' button, all 'RX xxx' items must be removed)

Delete previously compiled RX packages (if any) RXCTL6.BPL, RXDB6.BPL,

RXBDE6.BPL, DCLRX6.BPL, DCLRXDB6.BPL and DCLRXBD6.BPL from your hard disk.

(Located in C:\Program Files\Borland\Delphi6\Projects\Bpl)


open RX' runtime package

RXCTL6.DPK      and Compile it
RXDB6.DPK       and Compile it
RXBDE6.DPK      and Compile it

open RX design-time package

DCLRX6.DPK      and Install it
DCLRXDB6.DPK    and Install it
DCLRXBD6.DPK    and Install it

follow the order !!!!!!!!!!!!!

将 Rx\Units 所在目录路径加入 Delphi6 的 Library Path。

编译的顺序不要搞错，严格按我写的顺序做！
否则安装后经常会出问题。

OK. All done.
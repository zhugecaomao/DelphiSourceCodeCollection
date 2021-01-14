@echo off
BRCC32 -fo.\res\My.Res My.rc
dcc32 -B Sky_Coin.dpr -DNODEBUG
del /s *.dcu
del /s *.ddp
del /s *.~*
del *.cfg
del *.dof
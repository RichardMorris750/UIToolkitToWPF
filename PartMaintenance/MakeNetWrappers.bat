@echo off
rem
rem this files generates the required .NET API classes
rem
rem set Logicals
set SYNEXPDIR=%HOME%proto

rem generate wrapper code
del/q "%SRC%PartMaintNET.dbl"
gennet40 -o SRC:PartMaintNET.dbl -s "%SRC%PartMaintNET.xml"

rem protoype wrapper code
del/q "%SYNEXPDIR%\*.*"
dblproto SRC:PartMaintNET.dbl

rem compile wrapper code
dbl -qrelax:interop -o OBJ: SRC:PartMaintNET.dbl

rem build Library
dblink -l EXE:PartMaintNET.elb OBJ:PartMaintNET.dbo




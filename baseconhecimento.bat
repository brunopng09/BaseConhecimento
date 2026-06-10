@echo off
color 0A
title Assistente de Monitoria - FIAP
cls

echo ==================================================
echo       FIAP HACK OPS - ASSISTENTE DE SUPORTE
echo ==================================================
echo.
echo DICA: Copie o comando desejado, cole no CMD e 
echo altere o "X" para a sub-rede da sala (Ex: 15)
echo.
echo ==================================================
echo.
echo [1] DESLIGAR LABORATORIO (COMANDO EM MASSA)
echo for /l %%i in (1,1,50) do start shutdown -s -f -t 0 -m \\10.3.X.%%i
echo.
echo [2] COPIAR ARQUIVO DE CHECKPOINT (PROVA)
echo for /l %%i in (1,1,50) do start copy \\10.3.X.100\c$\Users\labsfiap\Desktop\Prova.txt \\10.3.X.%%i\d$
echo.
echo [3] LIMPAR DISCO D: (REMOVER DIRETORIOS/ARQUIVOS)
echo for /l %%i in (1,1,50) do start rd /s /q \\10.3.X.%%i\d$
echo.
echo [4] LIGAR SERVICO DE AUDIO (Audiosrv)
echo for /l %%i in (1,1,50) do start sc \\10.3.X.%%i start audiosrv
echo.
echo ==================================================
pause
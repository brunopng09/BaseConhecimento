@echo off
color 0A
title Assistente de Monitoria - FIAP Hack Ops

:menu
cls
echo ========================================================================
echo                 FIAP HACK OPS - ASSISTENTE DE SUPORTE
echo ========================================================================
echo.
echo [ATENCAO INICIAL - CREDENCIAIS]
echo Quase todos os comandos exigem privilegios de administrador.
echo Antes de rodar, abra um novo CMD usando o comando abaixo:
echo - runas /noprofile /user:fiap\seuusuario cmd
echo.
echo ========================================================================
echo MENU PRINCIPAL - Selecione um topico:
echo ========================================================================
echo.
echo [1] Controle de Energia (Desligar / Reiniciar Labs)
echo [2] Arquivos e Provas (Aplicar Checkpoints / Limpar D:)
echo [3] Utilitarios de Sala (Audio e Mensagens em Tela)
echo [4] Gerenciamento UWF (Congelamento do Disco C:)
echo [0] Sair do Assistente
echo.
set /p opcao="Digite o numero da opcao desejada: "

if "%opcao%"=="1" goto energia
if "%opcao%"=="2" goto arquivos
if "%opcao%"=="3" goto utilitarios
if "%opcao%"=="4" goto uwf
if "%opcao%"=="0" exit

:: Se o usuario digitar algo invalido, volta pro menu
goto menu


:energia
cls
echo ========================================================================
echo                    TOPICO 1: CONTROLE DE ENERGIA
echo ========================================================================
echo COMO USAR NO LAB: Copie o comando e troque a palavra "LAB" pelo 
echo numero da sub-rede da sala (Ex: 10.3.71.%%i para a sala 701).
echo ------------------------------------------------------------------------
echo.
echo [DESLIGAR SALA TODA]
echo O que faz: Encerra o Windows em 5 segundos forcadamente em 40 maquinas.
echo Comando:
echo for /l %%i in (1,1,40) do start shutdown -s -f -t 5 -m \\10.3.LAB.%%i
echo.
echo [REINICIAR SALA TODA]
echo O que faz: Reinicia 40 maquinas. Ideal para destravar PCs remotamente.
echo Comando:
echo for /l %%i in (1,1,40) do start shutdown -r -f -t 5 -m \\10.3.LAB.%%i
echo.
echo ========================================================================
pause
goto menu


:arquivos
cls
echo ========================================================================
echo                 TOPICO 2: GESTAO DE ARQUIVOS E PROVAS
echo ========================================================================
echo COMO USAR NO LAB: Para provas, usamos o disco D$ pois o C$ reseta. 
echo Nao esqueca de trocar "LAB" pela rede e "MAQ" pelo numero do PC.
echo ------------------------------------------------------------------------
echo.
echo [LIMPAR TODO O DISCO D: - SALA TODA]
echo O que faz: Apaga silenciosamente e forcadamente o D$ antes das provas.
echo Comando:
echo for /l %%i in (1,1,40) do start rd /q /s "\\10.3.LAB.%%i\d$"
echo.
echo [LIMPAR UM ARQUIVO ESPECIFICO NO D: - SALA TODA]
echo Comando:
echo for /l %%i in (1,1,50) do del /q /f "\\10.3.LAB.%%i\d$\arquivo.txt"
echo.
echo [COPIAR PASTA PARA O D: - SALA TODA]
echo O que faz: Espelha pastas/arquivos de Checkpoint para os alunos.
echo Comando:
echo for /l %%i in (1,1,50) do xcopy /h /e /y /i "C:\Pasta_Origem" "\\10.3.LAB.%%i\d$\Pasta_Destino"
echo.
echo [COPIAR ATALHO (URL) PARA O DESKTOP C: - SALA TODA]
echo O que faz: Coloca o link do ZIP da prova direto na area de trabalho.
echo Comando:
echo for /l %%i in (1,1,50) do xcopy /h /e /y /i "C:\Atalho" "\\10.3.LAB.%%i\c$\Users\labsfiap\Desktop"
echo.
echo ========================================================================
pause
goto menu


:utilitarios
cls
echo ========================================================================
echo                 TOPICO 3: UTILITARIOS E COMUNICACAO
echo ========================================================================
echo.
echo [LIGAR AUDIO REMOTAMENTE - SALA TODA]
echo O que faz: Forca o start do servico de som do Windows remotamente.
echo Comando:
echo for /l %%i in (1,1,50) do start sc \\10.3.LAB.%%i start audiosrv
echo.
echo [MANDAR MENSAGEM PARA OUTRA MAQUINA - MAQUINA UNICA]
echo O que faz: Exibe um pop-up na tela de um PC especifico. Util para 
echo avisar o professor ou um aluno sem ir ate a mesa.
echo Comando:
echo msg /server:10.3.LAB.MAQ * "Escreva sua mensagem aqui"
echo.
echo ========================================================================
pause
goto menu


:uwf
cls
echo ========================================================================
echo                  TOPICO 4: GERENCIAMENTO UWF (DISCO C)
echo ========================================================================
echo O QUE E O UWF?
echo E o filtro que reseta o disco C: toda vez que a maquina reinicia, 
echo evitando acúmulo de arquivos. O disco D: nao e afetado.
echo.
echo IMPORTANTE: O CMD deve estar logado com o usuario 'administrator'.
echo ------------------------------------------------------------------------
echo.
echo [DESATIVAR O UWF]
echo Uso: Necessario para instalar softwares permanentes (ex: Photoshop) 
echo ou ativar licencas que nao podem sumir ao reiniciar.
echo Comando:
echo uwfmgr filter disable
echo.
echo [ATIVAR O UWF]
echo Uso: Reativar apos terminar a manutencao para garantir a seguranca.
echo Comando:
echo uwfmgr filter enable
echo.
echo ========================================================================
pause
goto menu

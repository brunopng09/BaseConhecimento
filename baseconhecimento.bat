@echo off
color 0A
title Assistente de Monitoria - FIAP Hack Ops
cls

echo ========================================================================
echo                 FIAP HACK OPS - ASSISTENTE DE SUPORTE
echo ========================================================================
echo.
echo [ATENCAO INICIAL - CREDENCIAIS]
echo Quase todos os comandos abaixo exigem privilegios de administrador.
echo Antes de rodar, abra um novo CMD usando o comando RUNAS:
echo Comando: runas /noprofile /user:fiap\seuusuario cmd
echo.
echo DICA GERAL: Copie o comando desejado, cole no CMD que abriu com RUNAS
echo e altere o "LAB" e a "MAQ" conforme a sala. Ex: 10.3.71.%%i
echo ========================================================================
echo.

echo --- 1. CONTROLE DE ENERGIA (Para o fim da aula ou travamentos) ---
echo [Desligar a sala toda] Encerra o Windows em 5 segundos forcadamente.
echo for /l %%i in (1,1,40) do start shutdown -s -f -t 5 -m \\10.3.LAB.%%i
echo.
echo [Reiniciar a sala toda] Ideal para destravar maquinas remotamente.
echo for /l %%i in (1,1,40) do start shutdown -r -f -t 5 -m \\10.3.LAB.%%i
echo.
echo ------------------------------------------------------------------------

echo --- 2. GESTAO DE ARQUIVOS E PROVAS (Checkpoints e Limpeza) ---
echo [Limpar TODO o disco D:] Apaga todos os arquivos/pastas de forma silenciosa.
echo for /l %%i in (1,1,40) do start rd /q /s "\\10.3.LAB.%%i\d$"
echo.
echo [Apagar um arquivo especifico no D:] Remove apenas o arquivo citado.
echo for /l %%i in (1,1,50) do del /q /f "\\10.3.LAB.%%i\d$\arquivo.txt"
echo.
echo [Copiar Pasta para o D:] Espelha pastas para provas.
echo for /l %%i in (1,1,50) do xcopy /h /e /y /i "C:\Pasta_Origem" "\\10.3.LAB.%%i\d$\Pasta_Destino"
echo.
echo [Copiar Atalho para o Desktop C:] Joga o icone da prova na area de trabalho.
echo for /l %%i in (1,1,50) do xcopy /h /e /y /i "C:\Atalho" "\\10.3.LAB.%%i\c$\Users\labsfiap\Desktop"
echo.
echo ------------------------------------------------------------------------

echo --- 3. UTILITARIOS, AUDIO E COMUNICACAO ---
echo [Ligar Audio remotamente] Forca a ativacao do servico de som.
echo for /l %%i in (1,1,50) do start sc \\10.3.LAB.%%i start audiosrv
echo.
echo [Mandar mensagem na tela do aluno] Exibe um popup na maquina alvo.
echo msg /server:10.3.LAB.MAQ * "Escreva sua mensagem aqui"
echo.
echo [UWF - Congelamento do Disco C:] 
echo OBS: Exige CMD logado como 'administrator'.
echo Para DESATIVAR (ex: instalar licencas): uwfmgr filter disable
echo Para ATIVAR (padrao de seguranca): uwfmgr filter enable
echo.
echo ========================================================================
pause

@echo off
setlocal enabledelayedexpansion

:: Cainux IDE - Instalador para Windows
:: Autor: Caio (@caio2203)

echo.
echo  ██████╗ █████╗ ██╗███╗   ██╗██╗   ██╗██╗  ██╗
echo ██╔════╝██╔══██╗██║████╗  ██║██║   ██║╚██╗██╔╝
echo ██║     ███████║██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
echo ██║     ██╔══██║██║██║╚██╗██║██║   ██║ ██╔██╗ 
echo ╚██████╗██║  ██║██║██║ ╚████║╚██████╔╝██╔╝ ██╗
echo  ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝
echo.
echo    Sua Neovim distro personalizada
echo    Instalador para Windows v1.0
echo.

:: Definir diretórios
set "NVIM_CONFIG_DIR=%LOCALAPPDATA%\nvim"
set "BACKUP_DIR=%LOCALAPPDATA%\nvim.backup.%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "CAINUX_REPO=https://github.com/caio2203/Cainux-IDE.git"

:: Verificar Git
echo [INFO] Verificando Git...
git --version >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Git nao esta instalado!
    echo.
    echo Para instalar o Git:
    echo 1. Baixe em: https://git-scm.com/download/win
    echo 2. Execute o instalador
    echo 3. Reinicie o terminal
    pause
    exit /b 1
)
echo [OK] Git encontrado

:: Verificar Neovim
echo [INFO] Verificando Neovim...
nvim --version >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Neovim nao esta instalado!
    echo.
    echo Para instalar o Neovim:
    echo 1. Baixe em: https://github.com/neovim/neovim/releases
    echo 2. Ou use: winget install Neovim.Neovim
    echo 3. Ou use: choco install neovim
    pause
    exit /b 1
)
echo [OK] Neovim encontrado

:: Verificar se existe configuração
if exist "%NVIM_CONFIG_DIR%" (
    echo.
    echo [ATENCAO] Configuracao existente do Neovim encontrada
    set /p "backup=Deseja fazer backup da configuracao atual? (s/N): "
    
    if /i "!backup!"=="s" (
        echo [INFO] Fazendo backup para: %BACKUP_DIR%
        move "%NVIM_CONFIG_DIR%" "%BACKUP_DIR%" >nul
        echo [OK] Backup criado com sucesso!
    ) else (
        echo [INFO] Removendo configuracao existente...
        rmdir /s /q "%NVIM_CONFIG_DIR%" >nul 2>&1
        echo [OK] Configuracao existente removida
    )
)

:: Clonar repositório
echo.
echo [INFO] Clonando Cainux IDE...
git clone "%CAINUX_REPO%" "%NVIM_CONFIG_DIR%"

if errorlevel 1 (
    echo [ERRO] Falha ao clonar o repositorio
    pause
    exit /b 1
)

echo [OK] Cainux IDE clonado com sucesso!

:: Finalização
echo.
echo [OK] Instalacao concluida!
echo.
echo Proximos passos:
echo   1. Execute: nvim
echo   2. Aguarde a instalacao automatica dos plugins
echo   3. Reinicie o Neovim apos a instalacao
echo   4. Aproveite o Cainux IDE!
echo.
echo Para desinstalar, execute:
echo   rmdir /s /q "%LOCALAPPDATA%\nvim"

if exist "%BACKUP_DIR%" (
    echo   move "%BACKUP_DIR%" "%NVIM_CONFIG_DIR%"  ^(Para restaurar backup^)
)

echo.
echo Bem-vindo ao Cainux IDE! 🎉
echo.
pause

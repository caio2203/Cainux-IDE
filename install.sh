#!/bin/bash

# Cainux IDE - Script de Instalação Automática
# Autor: Caio (@caio2203)
# Repositório: https://github.com/caio2203/Cainux-IDE

set -e  # Sair se algum comando falhar

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Variáveis
CAINUX_REPO="https://github.com/caio2203/Cainux-IDE.git"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"

# Banner
echo -e "${YELLOW}"
cat << "EOF"
 ██████╗ █████╗ ██╗███╗   ██╗██╗   ██╗██╗  ██╗
██╔════╝██╔══██╗██║████╗  ██║██║   ██║╚██╗██╔╝
██║     ███████║██║██╔██╗ ██║██║   ██║ ╚███╔╝ 
██║     ██╔══██║██║██║╚██╗██║██║   ██║ ██╔██╗ 
╚██████╗██║  ██║██║██║ ╚████║╚██████╔╝██╔╝ ██╗
 ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝

    Sua Neovim distro personalizada
    Instalador Automático v1.0
EOF
echo -e "${NC}"

# Função para imprimir mensagens coloridas
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Verificar se o Git está instalado
check_git() {
    if ! command -v git &> /dev/null; then
        print_error "Git não está instalado!"
        print_status "Para instalar o Git:"
        echo "  Ubuntu/Debian: sudo apt update && sudo apt install git"
        echo "  Fedora/RHEL:   sudo dnf install git"
        echo "  Arch Linux:    sudo pacman -S git"
        echo "  macOS:         brew install git"
        exit 1
    fi
    print_success "Git encontrado: $(git --version)"
}

# Verificar se o Neovim está instalado
check_neovim() {
    if ! command -v nvim &> /dev/null; then
        print_error "Neovim não está instalado!"
        print_status "Para instalar o Neovim:"
        echo "  Ubuntu/Debian: sudo apt update && sudo apt install neovim"
        echo "  Fedora/RHEL:   sudo dnf install neovim"
        echo "  Arch Linux:    sudo pacman -S neovim"
        echo "  macOS:         brew install neovim"
        exit 1
    fi
    
    # Verificar versão do Neovim
    NVIM_VERSION=$(nvim --version | head -n1 | grep -o 'v[0-9]\+\.[0-9]\+')
    print_success "Neovim encontrado: $NVIM_VERSION"
    
    # Verificar se a versão é 0.8+
    if ! nvim --version | head -n1 | grep -E "v0\.(8|9|[1-9][0-9])|v[1-9]" &> /dev/null; then
        print_warning "Recomendamos Neovim 0.8+ para melhor compatibilidade"
    fi
}

# Verificar dependências opcionais
check_optional_deps() {
    print_status "Verificando dependências opcionais..."
    
    # Ripgrep para busca de texto
    if ! command -v rg &> /dev/null; then
        print_warning "Ripgrep não encontrado - funcionalidade de busca será limitada"
        print_status "Instale com: sudo apt install ripgrep (Ubuntu/Debian)"
    else
        print_success "Ripgrep encontrado"
    fi
    
    # fd para busca de arquivos
    if ! command -v fd &> /dev/null; then
        print_warning "fd não encontrado - usando find como alternativa"
        print_status "Instale com: sudo apt install fd-find (Ubuntu/Debian)"
    else
        print_success "fd encontrado"
    fi
    
    # Node.js para alguns plugins
    if ! command -v node &> /dev/null; then
        print_warning "Node.js não encontrado - alguns plugins podem ter funcionalidade limitada"
    else
        print_success "Node.js encontrado: $(node --version)"
    fi
}

# Fazer backup da configuração existente
backup_existing_config() {
    if [ -d "$NVIM_CONFIG_DIR" ]; then
        print_warning "Configuração existente do Neovim encontrada"
        read -p "Deseja fazer backup da configuração atual? (s/N): " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[SsYy]$ ]]; then
            print_status "Fazendo backup para: $BACKUP_DIR"
            mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
            print_success "Backup criado com sucesso!"
        else
            print_status "Removendo configuração existente..."
            rm -rf "$NVIM_CONFIG_DIR"
            print_success "Configuração existente removida"
        fi
    fi
}

# Clonar o repositório
clone_cainux() {
    print_status "Clonando Cainux IDE..."
    if git clone "$CAINUX_REPO" "$NVIM_CONFIG_DIR"; then
        print_success "Cainux IDE clonado com sucesso!"
    else
        print_error "Falha ao clonar o repositório"
        exit 1
    fi
}

# Configurar permissões
set_permissions() {
    print_status "Configurando permissões..."
    chmod -R 755 "$NVIM_CONFIG_DIR"
    print_success "Permissões configuradas"
}

# Instalar plugins (primeira execução)
install_plugins() {
    print_status "Iniciando Neovim para instalar plugins..."
    print_warning "Isso pode levar alguns minutos na primeira execução..."
    
    # Executar Neovim em modo headless para instalar plugins
    if nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 2>/dev/null; then
        print_success "Plugins instalados com sucesso!"
    else
        print_warning "Plugins serão instalados na primeira execução manual"
    fi
}

# Função principal
main() {
    echo -e "${CYAN}Iniciando instalação do Cainux IDE...${NC}\n"
    
    # Verificações
    check_git
    check_neovim
    check_optional_deps
    echo
    
    # Backup e instalação
    backup_existing_config
    clone_cainux
    set_permissions
    
    echo
    print_success "Instalação concluída!"
    echo
    print_status "Próximos passos:"
    echo "  1. Execute: nvim"
    echo "  2. Aguarde a instalação automática dos plugins"
    echo "  3. Reinicie o Neovim após a instalação"
    echo "  4. Aproveite o Cainux IDE!"
    echo
    print_status "Para desinstalar, execute:"
    echo "  rm -rf ~/.config/nvim"
    if [ -d "$BACKUP_DIR" ]; then
        echo "  mv $BACKUP_DIR ~/.config/nvim  # Para restaurar backup"
    fi
    echo
    echo -e "${GREEN}Bem-vindo ao Cainux IDE! 🎉${NC}"
}

# Verificar se está sendo executado como root
if [ "$EUID" -eq 0 ]; then
    print_error "Não execute este script como root!"
    exit 1
fi

# Executar função principal
main

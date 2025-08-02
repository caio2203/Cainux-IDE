# CAINUX IDE

> **Sua Neovim distro personalizada** - Uma distribuição moderna e minimalista do Neovim para desenvolvimento profissional

<img width="1904" height="1032" alt="Captura de tela de 2025-08-01 22-46-33" src="https://github.com/user-attachments/assets/9d3ef6ef-84f4-4ca8-a8d2-99afa2e6a4f4" />


## 📖 Sobre o Projeto

Cainux é uma distribuição personalizada do Neovim projetada para oferecer uma experiência de desenvolvimento moderna, eficiente e visualmente atraente. Com uma interface limpa e funcionalidades essenciais pré-configuradas, o Cainux transforma o Neovim em um IDE completo e produtivo.

### ✨ Características Principais

- 🎨 **Interface Moderna**: Design minimalista com tema escuro elegante
- ⚡ **Performance Otimizada**: Configuração leve e rápida
- 🔧 **Pré-configurado**: Plugins essenciais já configurados e prontos para uso
- 🗂️ **Gerenciamento de Arquivos**: Sistema intuitivo de navegação e busca
- 🔍 **Busca Avançada**: Ferramentas de busca em arquivos e texto
- 📝 **Sessões**: Salve e recupere seu ambiente de trabalho
- ⚙️ **Configurações Flexíveis**: Personalize conforme suas necessidades

### 🎯 Funcionalidades

- **📄 Novo arquivo** - Criar novos arquivos rapidamente
- **🔎 Procurar arquivos** - Busca inteligente de arquivos no projeto
- **📂 Arquivos recentes** - Acesso rápido aos arquivos utilizados recentemente
- **🔤 Buscar texto** - Pesquisa avançada de texto em todo o projeto
- **🕒 Última sessão** - Recuperar a última sessão de trabalho
- **⚙️ Configurações** - Painel de configurações personalizáveis
- **🚪 Sair** - Saída segura do editor

## 🚀 Instalação

### ⚡ Instalação Rápida (Recomendada)

#### Linux/macOS
```bash
curl -fsSL https://raw.githubusercontent.com/caio2203/Cainux-IDE/main/install.sh | bash
```

#### Windows PowerShell
```powershell
iwr -useb https://raw.githubusercontent.com/caio2203/Cainux-IDE/main/install.ps1 | iex
```

### 📥 Instalação Manual

#### Pré-requisitos
- **Git** - Para clonar o repositório
- **Neovim 0.8+** - Editor base
- **Node.js** (opcional) - Para alguns plugins
- **Ripgrep** (opcional) - Para busca avançada de texto
- **fd** (opcional) - Para busca rápida de arquivos

#### Passo a Passo

**Linux/macOS:**
```bash
# 1. Backup da configuração atual (se existir)
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# 2. Clone do repositório
git clone https://github.com/caio2203/Cainux-IDE.git ~/.config/nvim

# 3. Iniciar Neovim
nvim
```

**Windows:**
```powershell
# 1. Backup da configuração atual (se existir)
if (Test-Path "$env:LOCALAPPDATA\nvim") { 
    Move-Item "$env:LOCALAPPDATA\nvim" "$env:LOCALAPPDATA\nvim.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')" 
}

# 2. Clone do repositório
git clone https://github.com/caio2203/Cainux-IDE.git "$env:LOCALAPPDATA\nvim"

# 3. Iniciar Neovim
nvim
```

### 🛠️ Instalação com Script Local

```bash
# Download do script
wget https://raw.githubusercontent.com/caio2203/Cainux-IDE/main/install.sh

# Dar permissão de execução
chmod +x install.sh

# Executar
./install.sh
```

### 📦 Instalação de Dependências Opcionais

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install ripgrep fd-find nodejs npm
```

#### Fedora/RHEL
```bash
sudo dnf install ripgrep fd-find nodejs npm
```

#### Arch Linux
```bash
sudo pacman -S ripgrep fd nodejs npm
```

#### macOS
```bash
brew install ripgrep fd node
```

#### Windows
```powershell
# Com Chocolatey
choco install ripgrep fd nodejs

# Com winget
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd
winget install OpenJS.NodeJS
```

### ✅ Verificação da Instalação

Após a instalação, verifique se tudo está funcionando:

```bash
# Verificar Neovim
nvim --version

# Verificar plugins (dentro do Neovim)
:checkhealth
```

### 🔧 Primeira Execução

1. **Abra o Neovim**: `nvim`
2. **Aguarde**: Os plugins serão instalados automaticamente
3. **Reinicie**: Feche e abra novamente após a instalação
4. **Aproveite**: Seu Cainux IDE está pronto!

### 🗑️ Desinstalação

**Linux/macOS:**
```bash
# Remover Cainux IDE
rm -rf ~/.config/nvim

# Restaurar backup (se existir)
mv ~/.config/nvim.backup.TIMESTAMP ~/.config/nvim
```

**Windows:**
```powershell
# Remover Cainux IDE
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim"

# Restaurar backup (se existir)
Move-Item "$env:LOCALAPPDATA\nvim.backup.TIMESTAMP" "$env:LOCALAPPDATA\nvim"
```

### 🆘 Resolução de Problemas

#### Plugin não carregando
```bash
# Dentro do Neovim
:PackerSync
:PackerCompile
```

#### Erro de permissão (Linux/macOS)
```bash
chmod -R 755 ~/.config/nvim
```

#### Neovim não encontrado
- Verifique se está no PATH: `echo $PATH`
- Reinstale o Neovim seguindo as instruções oficiais

#### Git não encontrado
- Linux: `sudo apt install git`
- Windows: Baixe em [git-scm.com](https://git-scm.com)
- macOS: `brew install git`

## 🎮 Como Usar

### Primeira Execução

1. **Abra o Neovim**: Execute `nvim` no terminal
2. **Aguarde a Instalação**: Os plugins serão instalados automaticamente na primeira execução
3. **Reinicie**: Feche e abra novamente o Neovim após a instalação dos plugins

### Navegação Principal

Ao abrir o Cainux, você verá o menu principal com as seguintes opções:

| Ação | Tecla | Descrição |
|------|-------|-----------|
| Novo arquivo | `n` | Criar um novo arquivo |
| Procurar arquivos | `f` | Buscar arquivos no projeto |
| Arquivos recentes | `r` | Acessar arquivos recentes |
| Buscar texto | `g` | Pesquisar texto no projeto |
| Última sessão | `l` | Restaurar última sessão |
| Configurações | `c` | Abrir configurações |
| Sair | `q` | Sair do editor |

### Atalhos Essenciais

```vim
" Navegação de arquivos
<Space>ff  " Buscar arquivos
<Space>fg  " Buscar texto
<Space>fr  " Arquivos recentes

" Gerenciamento de janelas
<C-h>      " Navegar para janela à esquerda
<C-j>      " Navegar para janela abaixo
<C-k>      " Navegar para janela acima
<C-l>      " Navegar para janela à direita

" Edição
<Space>w   " Salvar arquivo
<Space>q   " Fechar arquivo
```

## ⚙️ Configuração

### Personalização

O Cainux pode ser personalizado editando os arquivos de configuração:

```
~/.config/nvim/
├── init.lua          # Configuração principal
├── lua/
│   ├── config/       # Configurações gerais
│   ├── plugins/      # Configurações de plugins
│   └── core/         # Funcionalidades principais
└── README.md
```

### Temas

Para alterar o tema, edite o arquivo de configuração:

```lua
-- Em ~/.config/nvim/lua/config/colorscheme.lua
vim.cmd([[colorscheme your-preferred-theme]])
```

## 🔧 Plugins Incluídos

- **Telescope**: Busca difusa de arquivos e texto
- **Nvim-tree**: Explorador de arquivos
- **Lualine**: Barra de status moderna
- **Treesitter**: Destaque de sintaxe avançado
- **LSP**: Suporte completo a Language Server Protocol
- **Git Integration**: Integração com Git
- **Auto-completion**: Autocompletar inteligente

## 🤝 Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. **Fork** o projeto
2. Crie uma **branch** para sua feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. **Push** para a branch (`git push origin feature/AmazingFeature`)
5. Abra um **Pull Request**

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👤 Autor

**Caio** - [@caio2203](https://github.com/caio2203)

## 🙏 Agradecimentos

- Comunidade Neovim
- Desenvolvedores dos plugins utilizados
- Todos os contribuidores do projeto

---

<p align="center">
  <strong>💛 Cainux - Sua Neovim distro personalizada</strong><br>
  🔗 <a href="https://github.com/caio2203/Cainux-IDE">github.com/caio2203</a>
</p>

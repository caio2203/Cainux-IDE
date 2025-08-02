# 🟨 CAINUX IDE

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

### Pré-requisitos

Certifique-se de ter instalado:

- **Neovim** (versão 0.8+)
- **Git**
- **Node.js** (para alguns plugins)
- **Ripgrep** (para busca de texto)
- **fd** ou **find** (para busca de arquivos)

### 📥 Instalação Automática

```bash
# Clone o repositório
git clone https://github.com/caio2203/Cainux-IDE.git ~/.config/nvim

# Entre no diretório
cd ~/.config/nvim

# Execute o script de instalação (se disponível)
./install.sh
```

### 📥 Instalação Manual

```bash
# Backup da configuração atual (se existir)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone o Cainux IDE
git clone https://github.com/caio2203/Cainux-IDE.git ~/.config/nvim

# Inicie o Neovim
nvim
```

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

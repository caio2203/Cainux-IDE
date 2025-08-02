#!/bin/bash

# Cainux IDE - Instalação Rápida
# Uma versão simplificada do instalador

echo "🟨 Instalando Cainux IDE..."

# Verificar Git e Neovim
if ! command -v git &> /dev/null; then
    echo "❌ Git não encontrado! Instale o Git primeiro."
    exit 1
fi

if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim não encontrado! Instale o Neovim primeiro."
    exit 1
fi

# Backup se existir configuração
if [ -d "$HOME/.config/nvim" ]; then
    echo "📦 Fazendo backup da configuração existente..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Clonar repositório
echo "⬇️  Baixando Cainux IDE..."
git clone https://github.com/caio2203/Cainux-IDE.git "$HOME/.config/nvim"

if [ $? -eq 0 ]; then
    echo "✅ Cainux IDE instalado com sucesso!"
    echo "🚀 Execute 'nvim' para começar!"
else
    echo "❌ Erro na instalação!"
    exit 1
fi

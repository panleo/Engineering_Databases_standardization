#!/bin/bash
# Cores para feedback visual (TDAH-friendly)
GREEN='\033[0;32m'; BLUE='\033[0;34m'; NC='\033[0m'

echo -e "${BLUE}🏗️ Iniciando Setup Pantheon...${NC}"

# 1. Cria ambiente virtual
if [ ! -d ".venv" ]; then
    python -m venv .venv
    echo -e "${GREEN}✅ Ambiente virtual criado.${NC}"
fi

# 2. Instala dependências
source .venv/bin/activate
pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    echo -e "${GREEN}✅ Dependências instaladas.${NC}"
fi

# 3. Garante o arquivo de segredos
if [ ! -f ".env" ] && [ -f ".env.example" ]; then
    cp .env.example .env
    echo -e "${GREEN}✅ Arquivo .env criado a partir do exemplo.${NC}"
fi

echo -e "${GREEN}🚀 Pronto para codar!${NC}"
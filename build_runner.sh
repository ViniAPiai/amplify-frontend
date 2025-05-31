#!/bin/bash

echo "🚧 Gerando arquivos *.g.dart com build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "📂 Procurando arquivos *.g.dart modificados ou novos..."
G_DART_FILES=$(git ls-files -o -m --exclude-standard | grep '\.g\.dart$')

if [ -z "$G_DART_FILES" ]; then
  echo "✅ Nenhum arquivo *.g.dart para adicionar."
else
  echo "➕ Adicionando arquivos ao Git:"
  echo "$G_DART_FILES"
  git add $G_DART_FILES
  echo "✅ Arquivos *.g.dart adicionados com sucesso."
fi

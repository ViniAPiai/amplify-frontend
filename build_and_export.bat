@echo off
setlocal

rem Caminho de destino (altere conforme necessário)
set DESTINO=F:\amplify\amplify-frontend-deploy

echo 🔨 Compilando o projeto Flutter Web...
flutter build web
if errorlevel 1 (
    echo ❌ Erro na compilação. Abortando.
    exit /b 1
)

echo 🧹 Limpando pasta de destino: %DESTINO%
rmdir /s /q "%DESTINO%"
mkdir "%DESTINO%"

echo 📦 Copiando arquivos para %DESTINO%
xcopy /E /Y /I build\web\* "%DESTINO%\"

echo ✅ Build exportada com sucesso para %DESTINO%

endlocal
pause

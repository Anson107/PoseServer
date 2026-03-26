@echo off
chcp 65001 > nul
setlocal
cd /d %~dp0

echo 正在启动开发模式（前端 + 后端）...
call npm install
if errorlevel 1 goto fail
call npm install --prefix backend_rebuild_isolated
if errorlevel 1 goto fail
call npm install --prefix frontend --legacy-peer-deps
if errorlevel 1 goto fail
call npm run dev
if errorlevel 1 goto fail
goto end

:fail
echo 启动失败，请检查错误输出。
pause
exit /b 1

:end
endlocal

@echo off
chcp 65001 > nul
setlocal
cd /d %~dp0

echo [1/3] 安装依赖...
call npm install
if errorlevel 1 goto fail
call npm install --prefix backend_rebuild_isolated
if errorlevel 1 goto fail
call npm install --prefix frontend --legacy-peer-deps
if errorlevel 1 goto fail

echo [2/3] 构建前端...
call npm run build
if errorlevel 1 goto fail

echo [3/3] 启动服务...
call npm run start
if errorlevel 1 goto fail

goto end

:fail
echo 启动失败，请检查上面的错误日志。
pause
exit /b 1

:end
endlocal

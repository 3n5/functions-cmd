# functions-cmd
cmd functions


for /f "delims=" %i in ('dir /b C:\Users\USER\Downloads') do @(echo %~ni)>>C:\Users\USER\Downloads\result.txt

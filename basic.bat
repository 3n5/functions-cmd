::https://www.adminweb.jp/command/bat/
::Home › コマンドプロンプトの使い方>バッチファイルの作成>バッチファイルの使い方

@echo off

@rem バックアップ
:: バックアップ元 C:\Users\user\Desktop\src
:: バックアップ先 C:\Users\user\Desktop\dis

::cd C:\Users\user\Desktop\src
::copy *.* C:\Users\user\Desktop\dist
::del /q C:\Users\user\Desktop\src


@rem 引数
::バッチファイル 引数1 引数2 ... 引数9
::実行> c:\Users\user\Desktop\backup.bat AG リンゴ "1,045円"
::出力> %0 = c:\Users\user\Desktop\backup.bat %1 = AG %2 = リンゴ %3 = 45円
::区切り文字としては半角スペース以外に;や,や=もOK
::上記の記号を引数として扱う場合、値を""で囲い、%1の代わりに%~1とする
::%* は引数に入力された値を全部まとめて参照(*=1~9)

::echo %%0 = %0
::echo %%1 = %1
::echo %%2 = %2
::echo %%3 = %~3
::echo %%* = %*


@rem IF
::IF 条件式 コマンド  or  IF 条件式 コマンドA ELSE コマンドBGah

::set answer=
::set /p answer=Nullpo
::if %answer%==Gah (
::  echo Nice!!
::) else (
::  echo ...
::)


::@echo off
:::start
::set answer=
::set /p answer=input filename

::if not defined answer (
::  echo input again
::  goto start
::)

::if exist %answer% (
::  echo exit file
::) else (
::  echo not exit file
::)

@rem FOR
::FOR (option) %%var IN (ファイルの一覧や数値の範囲) DO 処理
::FOR での変数は、コマンドラインの場合は%変数、バッチファイルの場合は %%変数 
::(開始,ステップ,終了)

::for /l %%n in (1,1,10) do (
::  echo n = %%n
::)
::出力>1~10

::バックアップ
::for %%f in (C:\Users\user\Desktop\src\*.txt) do (
::  echo filename = %%f
::  copy %%f C:\Users\user\Desktop\dist > nul
::)
::nulの意味 https://qiita.com/uhooi/items/b8b25761a5c4efe9025a

::サブディレクトリも　FOR /D %%変数 IN (セット) DO コマンド
::for /r d:\test %%f in (*.txt) do (
::  echo filename = %%f
::)


@rem FOR テキストファイルを読み込んで処理
::FOR /F ["オプション"] %%変数 IN (ファイル セット) DO コマンド
::.txt中の;はコメントとして無視される
::input.txt
::;fluit
::リンゴ 1個 125円
::ブドウ 2房 250円
::for /f "tokens=1,3" %%t in (C:\Users\user\Desktop\src\input.txt) do (
::  echo token = %%t, %%u
::)

::トークンに分割する区切り文字の変更
::FOR /F "delims=, ;" %%変数 IN (ファイル セット) DO コマンド

::スキップ処理　2行目スキップ　FOR /F "skip=2" %%変数 IN (ファイル セット) DO コマンド

::ファイルに空白がある場合
::for /f "usebackq tokens=1-3" %%t in ("input 2.txt") do (
::  echo token = %%t, %%u, %%v
::)

@rem CALL (バッチファイルを呼び出す)
::CALL [ドライブ:][パス]ファイル名 [バッチパラメーター]
::CALL :ラベル [引数]
::set para1=hello
::set para2=world
::call call2.bat %para1% %para2%

::test2.bat
::@echo off
::echo %%0 = %0
::echo %%1 = %1
::echo %%2 = %2
::exit /b


::同じバッチファイル内のラベルの呼び出し
::@echo off
::echo start!
::set var1=hoge
::call :sub %var1%
::echo end!
::goto :EOF

:::sub
::echo %%0 = %0
::echo %%1 = %1
::echo success
::exit /b

@rem エコー機能をオフにする
::コマンドの前に@
::@cd C:\Users\user\Desktop\src
::@dir

::OR
::@echo off

@rem 特殊文字の表示
::@echo.
::@echo  ^|  ^<  ^>  ^^  ^&  %%


@rem PAUSE キーが押されるまで処理を一時停止
::続行するには何かキーを押してください . . .と表示
::@cd C:\Users\user\Desktop\src
::pause
::@dir


#!/bin/bash

#パスワードマネージャーの初期表示
echo -n "パスワードマネージャーへようこそ!"

#サービス名の入力
echo -n " サービス名を入力してください"
read service

#ユーザー名の入力
echo "ユーザー名を入力してください"
read username

#パスワードの入力
echo -n "パスワードを入力してください"
read -s password

#入力をファイルに追記
echo "$service:$username:$password" >> passwords.txt 

#完了メッセージ
echo "Tank you!"
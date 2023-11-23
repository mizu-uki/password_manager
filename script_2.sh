#!/bin/bash

#パスワードファイル
passwords_file="passwords.txt"

#パスワードを追加する関数
add_password(){
    echo -n "サービス名を入力してください"
    read service
    echo -n "ユーザー名を入力してください"
    read username
    echo -n "パスワードを入力してください"
    read password

    #ファイルに保存
    echo "$service:$username:$password" >> $passwords_file
    echo "パスワードの追加は成功しました"
}

#パスワードを取得する関数
get_password(){
    echo -n "サービス名を入力して下さい" 
    read search_service

    while IFS=: read -r service username password
    do
        if [ "$service" == "$search_service" ]; then
        echo "サービス名:$service"
        echo "ユーザー名:$username"
        echo "パスワード:$password"
        return
        fi
    done < $passwords_file

    echo "そのサービスは登録されていません"
}

#最初のメッセージ
echo "パスワードマネージャーへようこそ！"

#メイン機能
while true
do
    echo "次の選択肢から入力してください（Add Password/Get Password/Exit）:"
    read action

    case $action in
        "Add Password") add_password ;;
        "Get Password") get_password ;;
        "Exit") echo "Thank you!" ; break ;;
        *) echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。" ;;
    esac
done
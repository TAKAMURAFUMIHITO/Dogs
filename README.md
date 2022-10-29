# Dogs
![top](https://user-images.githubusercontent.com/108682238/197973024-35ec3f31-dbcc-4bdc-ac58-5a5465a6cadf.png)

## サイト概要

### サイトテーマ
自分の好きなワンちゃんを発信し、犬好きと交流を深められるSNSサイト

### URL
http://3.115.177.12/

### テーマを選んだ理由
もともと犬が好きで、犬を一匹飼っているのですが、他の人がどのような犬を飼っているのか、どのような育て方をしているのかが知れるサービスがあれば便利だと考え、このテーマにしました。
アプリが普及して、ペットショップやドッグフード、どうぶつ病院などの広告をつけることができ、利益に繋げられることが考えられます。
コロナウイルスが長引く中、生活に癒やしを求めてペットを飼う人が増えている昨今に非常にマッチしているアプリだと思います。

### ターゲットユーザ
- 犬を飼っている方
- 犬を飼おうか悩んでいる方
- 犬が好きな方
- 犬を飼っているうえで悩みを抱えている方(育て方、しつけ方、どうぶつ病院等)

### 主な利用シーン
- 飼っているペットの成長記録
- お気に入りのペットの写真を発信
- 同じペット好きな人とのコミュニティを作る
- 育て方や病院の選定で悩んでいる事を解決したい時
- ペットが飼えない方でも写真を見て癒されたい時

### 機能一覧
- ゲストログイン
- 投稿機能(複数の画像投稿可能)
- いいね機能(非同期通信)
- フォロー機能
- コメント機能(非同期通信)
- 検索機能(会員・投稿)
- 通知機能
- チャット機能
- 退会機能(論理削除)
- ソート機能(新着順,古い順,1週間でいいねが多い順)
- スライド機能
- 管理者(会員・投稿編集機能)

## 設計書

### ER図
![ER-image](https://user-images.githubusercontent.com/108682238/197973135-51f05f11-ad05-4796-9c43-c7e596feccc8.png)

### テーブル定義書
https://docs.google.com/spreadsheets/d/1uF9Uzu-YpCGpKt6kvDs5d6jP42IgaVUJdyG-W7iiP8Q/edit#gid=1373217982

### アプリケーション詳細設計書
https://docs.google.com/spreadsheets/d/1GZ-l8WKwF1SVCI2KKpGcSZs_abfvy-0lkaQheXM_9og/edit#gid=549108681

## 開発環境

### 使用言語
- HTML&CSS（SCSS）
- Ruby
- JavaScript

### フレームワーク
- Ruby on rails(6.1.7)

### Gem
- bootstrap
- devise
- jquery-rails
- kaminari
- pry-rails
- dotenv-rails
- mysql2
- image_processing
- net-smtp
- net-pop
- net-imap
- mini_magick

## インストール
~~~
$ git clone git@github.com:TAKAMURAFUMIHITO/Dogs.git
$ cd Dogs
$ rails db:migrate
$ rails db:seed
$ bundle install
~~~

## こだわりポイント
- オリジナルのロゴ
![Dogs-logo](https://user-images.githubusercontent.com/108682238/197972840-66479a9e-ea6f-449e-bf68-43a01c500f5b.png)
- ワンちゃんをモチーフにした背景や、ひと目見て直感で分かるシンプルなレイアウト
- 複数の画像が投稿・編集でき、スライド機能を付与

## 使用素材
- 背景画像(https://twitter.com/okumono1/status/1392377615915261957)
- デフォルトのプロフィール画像(https://www.onlinewebfonts.com/icon/373654)

## 使用方法

### 会員側
1. はじめに会員登録をお願い致します。お試しでゲストログインをすることもできます。
2. 画像を添付し、投稿を行うことができます。
3. みんなの投稿を閲覧することができます。投稿にいいねをつけたり、コメントすることができます。
4. 他の会員をフォローすることができたり、チャットルームでお話することができます。

### 管理者側
1. はじめにログインをお願いいたします。
2. ログイン後、投稿一覧に遷移します。
3. 不適切な投稿やコメントを削除することができます。
4. 会員一覧から会員の編集ボタンを押下すると、会員の退会ステータスが更新することができます。

## 作成者
髙村文仁

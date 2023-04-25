# nagano_cake



## 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイトです。



## アプリケーションの実装機能

### [会員側]

●顧客は会員登録、ログイン・ログアウト、退会ができる

●会員のログインはメールアドレスとパスワードで行う

●会員がログインしている状態かどうか、ページのヘッダーにユーザ名が表示されているか否かで判断できる

●サイトの閲覧はログインなしで行える

●商品をカートに入れ、1度に複数種類、複数商品の購入ができる。また、カート内の商品は個数変更・削除ができる

●カートへの商品追加はログインなしでは行えない

●クレジットカード情報はシステム上保持しない

●会員は配送先を複数登録しておくことが可能である

●会員はマイページから下記が行える

・ユーザ情報の閲覧・編集

・注文履歴の閲覧

・配送先の閲覧・編集

●注文履歴一覧には下記の情報が表示される

・注文日

・配送先

・支払金額（商品合計＋送料）

・注文ステータス

●注文履歴詳細には下記の情報が表示される

・注文日

・配送先

・支払方法

・注文ステータス

・商品の注文内容詳細（商品名、単価、個数、小計）

・請求情報（商品合計、送料、支払金額）

●会員登録時、下記の情報をユーザ情報として入力できる

・名前（姓・名）

・名前（カナ姓・カナ名）

・郵便番号

・住所

・電話番号

・メールアドレス

・パスワード

●商品は税込価格で表示される

●ジャンルごとに商品が表示できる


 #### [管理者側(店側)実装]
 

●管理者用メールアドレスとパスワードでログインできる

●商品について、下記が行える

・新規追加、編集、閲覧

・販売停止（売切表示）

●商品情報は下記のものを持てる

・商品名

・商品説明文

・ジャンル

・税抜価格

・商品画像

・販売ステータス

●会員登録されているユーザ情報の閲覧、編集、退会処理が行える

●ユーザの注文履歴が一覧・詳細表示でき、下記の情報が表示される

 #### 【注文履歴一覧】

・購入日時

・購入者

・注文個数

・注文ステータス

 #### 【注文履歴詳細】

・購入者

・注文日

・配送先

・支払方法

・料金（商品合計、送料、請求金額合計）

・注文ステータス

・各注文商品詳細（商品名、単価(税込)、数量、小計）

・各注文商品の製作ステータス

●注文ごとに注文ステータスの更新、注文商品ごとに製作ステータスの更新ができる



## 開発環境

Rails 6.1.7.3



## Gem

・devise

・bootstrap

・kaminari

・enum_help

## その他
管理者ログイン用アカウント: admin@admin / testid


## 作成者
チーム　かるーあみるく

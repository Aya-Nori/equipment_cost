<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->


# アプリケーション名
equipment_cost

# アプリケーション概要
このオリジナルアプリは、社内の化学分析機器管理者が他部署の社員がレンタル利用した機器の利用履歴、利用料金を一覧表示し、管理するアプリです。

# URL

リンク先(https://equipmentcost.onrender.com/)

# テスト用アカウント

- Basic認証パスワード：ayabe
- Basic認証ID：39485
- メールアドレス：
- パスワード：

# 利用方法
## 機器使用を記録する
1. トップページからユーザー新規登録を行う
2. 機器選択ボタンから使用したい機器を選択する
3. 「開始」ボタンを押す
4. 機器を使い終えたら「終了」ボタンを押す

## 使用記録を一覧表示する
1. トップページから「一覧表示」ボタンを押す
2. 表示したい期間、部署名、機器名を選択し、「表示」ボタンを押す

# アプリケーションを作成した背景
化学分析機器を管理、メンテナンスし、他部署社員へのレンタル利用を行う部署にいました。
ここでは四半期ごとに各部署に機器の利用料金を請求する必要があります。
機器は、①PC制御、②PC制御だがスタンドアローン、③PCなし、があったため、利用履歴は大学ノートへの記帳で管理されていて、四半期末に履歴をExcelで書き写しており、手間がかかっていました。この作業工数を低減したいと思い、アプリケーションを開発するに至りました。

# 洗い出した要件
要件定義シート(https://docs.google.com/spreadsheets/d/1oNb8WVjL6M_sqWyX-SC9J8pBhpzQSUtyNNE9ASdcXB0/edit?usp=drive_link)

# 実装した機能についての説明


# 実装予定の機能
- ユーザー管理
- 機器管理
- 状況管理
- コメント管理
- 料金管理

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/18d4ca4abf32c4f47f0a22e528612564.png)](https://gyazo.com/18d4ca4abf32c4f47f0a22e528612564)


# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/e9e1a529aa5a310b397a5a6c45843ac0.png)](https://gyazo.com/e9e1a529aa5a310b397a5a6c45843ac0)


# 環境開発
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法

- 以下のコマンドを順に実行する。
- % git clone https://github.com/Aya-Nori/equipment_cost
- % cd equipment_cost
- % bundle install
- % yarn install


# 工夫したポイント


# テーブル設計
## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name_sei           | string  | null: false               |
| name_mei           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| extention_number   | integer | null: false               |
| division           | string  | null: false               |
| section            | string  | null: false               |

### Association

- has_many : equipments
- has_many : comments
- has_many : start_finish_times


## equipments テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| equipment_name     | string  | null: false               |
| category           | string  | null: false               |
| price              | integer | null: false               |

### Association

- has_many : comments
- has_many : start_finish_times
- belongs_to : user


## start_finish_times テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| start_time         | datetime   |                                |
| finish_time        | datetime   |                                |
| condition          | string     |                                |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : equipment


## comments テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| text               | text   | null: false               |

### Association

- belongs_to : user
- belongs_to : equipment



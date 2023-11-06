# README

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



# アプリケーション名
equipment_cost

# アプリケーション概要
このオリジナルアプリは、社内の化学分析機器管理者が他部署の社員がレンタル利用した機器の利用履歴、利用料金を一覧表示するアプリです。


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name_sei           | string | null: false               |
| name_mei           | string | null: false               |
| encrypted_password | string | null: false               |
| extention_number   | string | null: false               |
| division           | string | null: false               |
| section            | string | null: false               |

### Association


## equipments テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| equipment_name     | string | null: false               |
| start_time         | string | null: false               |
| finish_time        | string | null: false               |
| category           | string | null: false               |

### Association

## comments テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| text               | text   | null: false               |

### Association




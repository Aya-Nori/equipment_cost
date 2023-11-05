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
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_sei           | string | null: false               |
| name_mei           | string | null: false               |
| name_sei_kana      | string | null: false               |
| name_mei_kana      | string | null: false               |
| birth              | date   | null: false               |

### Association

- has_many :comments
- has_many :items
- has_many :purchases


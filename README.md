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


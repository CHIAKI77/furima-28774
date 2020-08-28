# README

# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------  | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | date    | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type    | Options                        |
| -----------------| ------- | -------------------------------|
| image            | text    | null: false                    |
| name             | text    | null: false                    |
| description      | text    | null: false                    |
| category         | integer | null: false                    |
| condition        | string  | null: false                    |
| shipping_burden  | string  | null: false                    |
| shipping_region  | string  | null: false                    |
| shipping_day     | string  | null: false                    |
| price            | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column  | Type    | Options                        |
| --------| ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sending_destination

## sending_destination テーブル

| Column        | Type    | Options                        |
| --------------| ------- | ------------------------------ |
| post_code     | string  | null: false                    |
| city          | string  | null: false                    |
| house_number  | integer | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |
| purchase_id   | integer | null: false, foreign_key: true |

### Association

- belongs_to :purchase



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

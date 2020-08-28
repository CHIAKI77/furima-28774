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
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type    | Options     |
| -----------------| ------- | ----------- |
| item_image       | string  | null: false |
| item_name        | string  | null: false |
| item_description | string  | null: false |
| category         | string  | null: false |
| item_condition   | string  | null: false |
| shipping_burden  | string  | null: false |
| shipping_region  | string  | null: false |
| shipping_day     | string  | null: false |
| price            | integer | null: false |
| user_id          | integer | null: false |

### Association

- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column           | Type    | Options     |
| -----------------| ------- | ----------- |
| card_number      | integer | null: false |
| expiration_year  | integer | null: false |
| expiration_month | integer | null: false |
| security_code    | integer | null: false |
| user_id          | integer | null: false |
| item_id          | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sending_destination

## sending_destination テーブル

| Column        | Type    | Options     |
| --------------| ------- | ----------- |
| post_code     | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | integer | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |
| user_id       | integer | null: false |
| purchase_id   | integer | null: false |

### Association

- belongs_to :purchases



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

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

# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
|nick_name      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
|first_name     | string | null: false |
|last_name      | string | null: false |
|first_name_kana| string | null: false |
|last_name_kana | string | null: false |
|birthday       | data   | null: false |

### Association

- has_many :items
- has_many :products

## items テーブル

| Column        | Type   | Options     |
| ------        | ------ | ----------- |
|   name        | string | null: false |
|description    | text   | null: false |
| price         | string | null: false |
|category_id    | integer| null: false |
| status_id     | integer| null: false |
| feeBurden_id  | integer| null: false |
| prefecture_id | integer| null: false |
|delivery_day_id| integer| null: false |

### Association

- has_one :purchase
- has_one :user

## purchases テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :addresses

## addresses テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| post_code   | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
|   address   | string     | null: false                    |
|  building   | string     | null: false                    |
| phone_number| string     |                                |

### Association

- belongs_to :purchase
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.6.1

* DB design

### stories table

|column|data type|constraint|  
| :----: | :----: | :---: |
|id|integer|null: false, auto_increment|
|title|string|default: null|
|summary|string|default: null|
|created_at|datetime|default: null|
|update_dt|datetime|default: null|
|created_by|int|default: null|
|updated_by|int|default: null|

### pages table

|column|data type|constraint|  
| :----: | :----: | :---: |
|id|integer|null: false, auto_increment|
|name|string|default: null|
|text|string|default: null|
|story_id|int|null: false, references: story|
|parent_id|int|null: false, 同テーブル内のid|
|created_at|datetime|default: null|
|update_dt|datetime|default: null|
|created_by|int|default: null, user_idが入る|
|updated_by|int|default: null, user_idが入る|

### users table

|column|data type|constraint|  
| :----: | :----: | :---: |
|id|integer|null: false, auto_increment|
|name|string|default: null|
|created_at|datetime|default: null|
|update_dt|datetime|default: null|
|created_by|int|default: null, user_idが入る|
|updated_by|int|default: null, user_idが入る|




* Routing design

    - /api
        - [get] /stories
        - [post] /stories 
        - [get] /stories/:story_id/pages/:page_id
        - [post] /stories/:story_id/pages/:parent_id/next

* making process
    - create page model and story model
    - create relationships with each other
    - create story index function
    - create story create function
    - create page index function
    - create page create function
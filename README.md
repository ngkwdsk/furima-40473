# テーブル設定

## usersテーブル

| Column						 | Type	  | Options			|
|	-----------------	 | ------ | ----------- |
|	nickname					 | string | null: false |
|	email							 | string | null: false, unique: true |
|	encrypted_password | string | null: false |
|	last_name					 | string | null: false |
|	first_name				 | string | null: false |
|	last_name_kana		 | string | null: false |
|	first_name_kana		 | string | null: false |
|	birthday					 | date	  | null: false |

### Association

- has_many :items
- has_many :comments

## itemsテーブル

| Column	  	 | Type			  | Options	 	  |
|	------------ | ---------- | ----------- |
| name				 | string		  | null: false |
| caption   	 | string		  | null: false |
| category_id	 | integer		| null: false |
| condition_id | integer		| null: false |
| postage_id	 | integer		| null: false |
| region_id		 | integer	  | null: false |
| ship_date_id | integer  	| null: false |
| price				 | integer    | null: false |
| user				 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column | Type		    | Options		 										 |
|	------ | ---------- | ------------------------------ |
| text   | text		    | null: false										 |
| item   | references | null: false, foreign_key: true |
| user	 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column		 | Type			  | Options	    |
|	---------- | ---------- | ----------- |
| post_code	 | integer		| null: false |
| prefecture | string		  | null: false |
| city   		 | string		  | null: false |
| block 		 | string		  | null: false |
| building	 | string	    | null: false |
| phone			 | integer	  | null: false |

### Association

- has_one :purchase

## purchasesテーブル

| user		   | references | null: false, foreign_key: true |
| item		   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresses
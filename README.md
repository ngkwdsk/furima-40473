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
- has_many :purchase

## itemsテーブル

| Column	  	 | Type			  | Options	 	  |
|	------------ | ---------- | ----------- |
| name				 | string		  | null: false |
| caption   	 | text	  	  | null: false |
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
- has_one :item
- has_one :purchase

## commentsテーブル

| Column | Type		    | Options		 	 |
|	------ | ---------- | ------------ |
| text   | text		    | null: false	 |
| item   | references | null: false, foreign_key: true |
| user	 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column		 | Type			  | Options	    |
|	---------- | ---------- | ----------- |
| post_code	 | string 		| null: false |
| region_id  | integer	  | null: false |
| city   		 | string		  | null: false |
| block 		 | string		  | null: false |
| building	 | string	    | null: false |
| phone			 | string 	  | null: false |
| item  		 | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## purchasesテーブル

| Column		 | Type			  | Options	    |
|	---------- | ---------- | ----------- |
| user		   | references | null: false, foreign_key: true |
| item		   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

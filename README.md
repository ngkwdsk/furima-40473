# テーブル設定

## usersテーブル

| Column						 | Type	  | Options			|
|	-----------------	 | ------ | ----------- |
|	nickname					 | string | null: false |
|	email							 | string | null: false, unique: true |
|	encrypted_password | string | null: false |
|	last_name					 | string | null: false |
|	first_name				 | string | null: false |
|	birthday					 | date	  | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :address

## itemsテーブル

| Column		| Type			 | Options		 |
|	--------- | ---------- | ----------- |
| image			| binary		 | null: false |
| name			| string		 | null: false |
| caption   | string		 | null: false |
| condition | string		 | null: false |
| postage		| string		 | null: false |
| region		| string	   | null: false |
| ship_date | string  	 | null: false |
| price			| integer 	 | null: false |
| user		  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :address

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
| user		   | references | null: false, foreign_key: true |
| item		   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

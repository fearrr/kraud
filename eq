                                        Table "public.items"
      Column      |            Type             |                     Modifiers                      
------------------+-----------------------------+----------------------------------------------------
 id               | integer                     | not null default nextval('items_id_seq'::regclass)
 section          | character varying(255)      | 
 body             | text                        | 
 created_at       | timestamp without time zone | 
 updated_at       | timestamp without time zone | 
 type_id          | integer                     | 
 title            | character varying(255)      | 
 image            | character varying(255)      | 
 img_file_name    | character varying(255)      | 
 img_content_type | character varying(255)      | 
 img_file_size    | integer                     | 
 img_updated_at   | timestamp without time zone | 
Indexes:
    "items_pkey" PRIMARY KEY, btree (id)


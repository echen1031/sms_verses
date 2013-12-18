# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131213100524) do

  create_table "bible_verses", :force => true do |t|
    t.string   "book"
    t.integer  "book_num"
    t.integer  "chapter_num"
    t.integer  "verse_num"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "testament"
    t.boolean  "selected"
    t.string   "version"
    t.integer  "char_count"
  end

# Could not dump table "pg_aggregate" because of following StandardError
#   Unknown type 'regproc' for column 'aggfnoid'

# Could not dump table "pg_am" because of following StandardError
#   Unknown type 'name' for column 'amname'

  create_table "pg_amop", :id => false, :force => true do |t|
    t.integer "amopfamily",                    :null => false
    t.integer "amoplefttype",                  :null => false
    t.integer "amoprighttype",                 :null => false
    t.integer "amopstrategy",   :limit => 2,   :null => false
    t.string  "amoppurpose",    :limit => nil, :null => false
    t.integer "amopopr",                       :null => false
    t.integer "amopmethod",                    :null => false
    t.integer "amopsortfamily",                :null => false
  end

  add_index "pg_amop", ["amopfamily", "amoplefttype", "amoprighttype", "amopstrategy"], :name => "pg_amop_fam_strat_index", :unique => true
  add_index "pg_amop", ["amopopr", "amoppurpose", "amopfamily"], :name => "pg_amop_opr_fam_index", :unique => true
  add_index "pg_amop", ["oid"], :name => "pg_amop_oid_index", :unique => true

# Could not dump table "pg_amproc" because of following StandardError
#   Unknown type 'regproc' for column 'amproc'

# Could not dump table "pg_attrdef" because of following StandardError
#   Unknown type 'pg_node_tree' for column 'adbin'

# Could not dump table "pg_attribute" because of following StandardError
#   Unknown type 'name' for column 'attname'

  create_table "pg_auth_members", :id => false, :force => true do |t|
    t.integer "roleid",       :null => false
    t.integer "member",       :null => false
    t.integer "grantor",      :null => false
    t.boolean "admin_option", :null => false
  end

  add_index "pg_auth_members", ["member", "roleid"], :name => "pg_auth_members_member_role_index", :unique => true
  add_index "pg_auth_members", ["roleid", "member"], :name => "pg_auth_members_role_member_index", :unique => true

# Could not dump table "pg_authid" because of following StandardError
#   Unknown type 'name' for column 'rolname'

  create_table "pg_cast", :id => false, :force => true do |t|
    t.integer "castsource",                 :null => false
    t.integer "casttarget",                 :null => false
    t.integer "castfunc",                   :null => false
    t.string  "castcontext", :limit => nil, :null => false
    t.string  "castmethod",  :limit => nil, :null => false
  end

  add_index "pg_cast", ["castsource", "casttarget"], :name => "pg_cast_source_target_index", :unique => true
  add_index "pg_cast", ["oid"], :name => "pg_cast_oid_index", :unique => true

# Could not dump table "pg_class" because of following StandardError
#   Unknown type 'name' for column 'relname'

# Could not dump table "pg_collation" because of following StandardError
#   Unknown type 'name' for column 'collname'

# Could not dump table "pg_constraint" because of following StandardError
#   Unknown type 'name' for column 'conname'

# Could not dump table "pg_conversion" because of following StandardError
#   Unknown type 'name' for column 'conname'

# Could not dump table "pg_database" because of following StandardError
#   Unknown type 'name' for column 'datname'

  create_table "pg_db_role_setting", :id => false, :force => true do |t|
    t.integer "setdatabase",                :null => false
    t.integer "setrole",                    :null => false
    t.string  "setconfig",   :limit => nil
  end

  add_index "pg_db_role_setting", ["setdatabase", "setrole"], :name => "pg_db_role_setting_databaseid_rol_index", :unique => true

  create_table "pg_default_acl", :id => false, :force => true do |t|
    t.integer "defaclrole",                     :null => false
    t.integer "defaclnamespace",                :null => false
    t.string  "defaclobjtype",   :limit => nil, :null => false
    t.string  "defaclacl",       :limit => nil
  end

  add_index "pg_default_acl", ["defaclrole", "defaclnamespace", "defaclobjtype"], :name => "pg_default_acl_role_nsp_obj_index", :unique => true
  add_index "pg_default_acl", ["oid"], :name => "pg_default_acl_oid_index", :unique => true

  create_table "pg_depend", :id => false, :force => true do |t|
    t.integer "classid",                    :null => false
    t.integer "objid",                      :null => false
    t.integer "objsubid",                   :null => false
    t.integer "refclassid",                 :null => false
    t.integer "refobjid",                   :null => false
    t.integer "refobjsubid",                :null => false
    t.string  "deptype",     :limit => nil, :null => false
  end

  add_index "pg_depend", ["classid", "objid", "objsubid"], :name => "pg_depend_depender_index"
  add_index "pg_depend", ["refclassid", "refobjid", "refobjsubid"], :name => "pg_depend_reference_index"

  create_table "pg_description", :id => false, :force => true do |t|
    t.integer "objoid",      :null => false
    t.integer "classoid",    :null => false
    t.integer "objsubid",    :null => false
    t.text    "description"
  end

  add_index "pg_description", ["objoid", "classoid", "objsubid"], :name => "pg_description_o_c_o_index", :unique => true

# Could not dump table "pg_enum" because of following StandardError
#   Unknown type 'name' for column 'enumlabel'

# Could not dump table "pg_event_trigger" because of following StandardError
#   Unknown type 'name' for column 'evtname'

# Could not dump table "pg_extension" because of following StandardError
#   Unknown type 'name' for column 'extname'

# Could not dump table "pg_foreign_data_wrapper" because of following StandardError
#   Unknown type 'name' for column 'fdwname'

# Could not dump table "pg_foreign_server" because of following StandardError
#   Unknown type 'name' for column 'srvname'

  create_table "pg_foreign_table", :id => false, :force => true do |t|
    t.integer "ftrelid",                  :null => false
    t.integer "ftserver",                 :null => false
    t.string  "ftoptions", :limit => nil
  end

  add_index "pg_foreign_table", ["ftrelid"], :name => "pg_foreign_table_relid_index", :unique => true

# Could not dump table "pg_index" because of following StandardError
#   Unknown type 'oidvector' for column 'indcollation'

  create_table "pg_inherits", :id => false, :force => true do |t|
    t.integer "inhrelid",  :null => false
    t.integer "inhparent", :null => false
    t.integer "inhseqno",  :null => false
  end

  add_index "pg_inherits", ["inhparent"], :name => "pg_inherits_parent_index"
  add_index "pg_inherits", ["inhrelid", "inhseqno"], :name => "pg_inherits_relid_seqno_index", :unique => true

# Could not dump table "pg_language" because of following StandardError
#   Unknown type 'name' for column 'lanname'

  create_table "pg_largeobject", :id => false, :force => true do |t|
    t.integer "loid",   :null => false
    t.integer "pageno", :null => false
    t.binary  "data"
  end

  add_index "pg_largeobject", ["loid", "pageno"], :name => "pg_largeobject_loid_pn_index", :unique => true

  create_table "pg_largeobject_metadata", :id => false, :force => true do |t|
    t.integer "lomowner",                :null => false
    t.string  "lomacl",   :limit => nil
  end

  add_index "pg_largeobject_metadata", ["oid"], :name => "pg_largeobject_metadata_oid_index", :unique => true

# Could not dump table "pg_namespace" because of following StandardError
#   Unknown type 'name' for column 'nspname'

# Could not dump table "pg_opclass" because of following StandardError
#   Unknown type 'name' for column 'opcname'

# Could not dump table "pg_operator" because of following StandardError
#   Unknown type 'name' for column 'oprname'

# Could not dump table "pg_opfamily" because of following StandardError
#   Unknown type 'name' for column 'opfname'

# Could not dump table "pg_pltemplate" because of following StandardError
#   Unknown type 'name' for column 'tmplname'

# Could not dump table "pg_proc" because of following StandardError
#   Unknown type 'name' for column 'proname'

# Could not dump table "pg_range" because of following StandardError
#   Unknown type 'regproc' for column 'rngcanonical'

# Could not dump table "pg_rewrite" because of following StandardError
#   Unknown type 'name' for column 'rulename'

  create_table "pg_seclabel", :id => false, :force => true do |t|
    t.integer "objoid",   :null => false
    t.integer "classoid", :null => false
    t.integer "objsubid", :null => false
    t.text    "provider"
    t.text    "label"
  end

  add_index "pg_seclabel", ["objoid", "classoid", "objsubid", "provider"], :name => "pg_seclabel_object_index", :unique => true

  create_table "pg_shdepend", :id => false, :force => true do |t|
    t.integer "dbid",                      :null => false
    t.integer "classid",                   :null => false
    t.integer "objid",                     :null => false
    t.integer "objsubid",                  :null => false
    t.integer "refclassid",                :null => false
    t.integer "refobjid",                  :null => false
    t.string  "deptype",    :limit => nil, :null => false
  end

  add_index "pg_shdepend", ["dbid", "classid", "objid", "objsubid"], :name => "pg_shdepend_depender_index"
  add_index "pg_shdepend", ["refclassid", "refobjid"], :name => "pg_shdepend_reference_index"

  create_table "pg_shdescription", :id => false, :force => true do |t|
    t.integer "objoid",      :null => false
    t.integer "classoid",    :null => false
    t.text    "description"
  end

  add_index "pg_shdescription", ["objoid", "classoid"], :name => "pg_shdescription_o_c_index", :unique => true

  create_table "pg_shseclabel", :id => false, :force => true do |t|
    t.integer "objoid",   :null => false
    t.integer "classoid", :null => false
    t.text    "provider"
    t.text    "label"
  end

  add_index "pg_shseclabel", ["objoid", "classoid", "provider"], :name => "pg_shseclabel_object_index", :unique => true

# Could not dump table "pg_statistic" because of following StandardError
#   Unknown type 'anyarray' for column 'stavalues1'

# Could not dump table "pg_tablespace" because of following StandardError
#   Unknown type 'name' for column 'spcname'

# Could not dump table "pg_trigger" because of following StandardError
#   Unknown type 'name' for column 'tgname'

# Could not dump table "pg_ts_config" because of following StandardError
#   Unknown type 'name' for column 'cfgname'

  create_table "pg_ts_config_map", :id => false, :force => true do |t|
    t.integer "mapcfg",       :null => false
    t.integer "maptokentype", :null => false
    t.integer "mapseqno",     :null => false
    t.integer "mapdict",      :null => false
  end

  add_index "pg_ts_config_map", ["mapcfg", "maptokentype", "mapseqno"], :name => "pg_ts_config_map_index", :unique => true

# Could not dump table "pg_ts_dict" because of following StandardError
#   Unknown type 'name' for column 'dictname'

# Could not dump table "pg_ts_parser" because of following StandardError
#   Unknown type 'name' for column 'prsname'

# Could not dump table "pg_ts_template" because of following StandardError
#   Unknown type 'name' for column 'tmplname'

# Could not dump table "pg_type" because of following StandardError
#   Unknown type 'name' for column 'typname'

  create_table "pg_user_mapping", :id => false, :force => true do |t|
    t.integer "umuser",                   :null => false
    t.integer "umserver",                 :null => false
    t.string  "umoptions", :limit => nil
  end

  add_index "pg_user_mapping", ["oid"], :name => "pg_user_mapping_oid_index", :unique => true
  add_index "pg_user_mapping", ["umuser", "umserver"], :name => "pg_user_mapping_user_server_index", :unique => true

  create_table "user_subscriptions", :force => true do |t|
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "user_id"
    t.string   "sms_id"
    t.integer  "remind_hour"
    t.boolean  "send_day_1",    :default => false, :null => false
    t.boolean  "send_day_2",    :default => false, :null => false
    t.boolean  "send_day_3",    :default => false, :null => false
    t.boolean  "send_day_4",    :default => false, :null => false
    t.boolean  "send_day_5",    :default => false, :null => false
    t.boolean  "send_day_6",    :default => false, :null => false
    t.boolean  "send_day_7",    :default => false, :null => false
    t.string   "time_zone"
    t.string   "phone_carrier"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "phone"
    t.string   "time_zone"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

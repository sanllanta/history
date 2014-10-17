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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141017173221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artwork_characters", id: false, force: true do |t|
    t.integer  "artwork"
    t.integer  "character"
    t.boolean  "principal_character", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artwork_symbols", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artwork_symbols_artworks", force: true do |t|
    t.integer "artwork_id"
    t.integer "artwork_symbol_id"
  end

  create_table "artworks", force: true do |t|
    t.integer  "passage_id"
    t.integer  "place_id"
    t.integer  "scene_id"
    t.integer  "type_id"
    t.integer  "source_id"
    t.integer  "origin_id"
    t.integer  "donor_id"
    t.integer  "phylactery_billboard_id"
    t.integer  "story_type_id"
    t.integer  "school_id"
    t.string   "author"
    t.string   "activity"
    t.text     "biographic_data"
    t.text     "signed"
    t.text     "synthesis"
    t.text     "biographic_comment"
    t.text     "annotation"
    t.text     "sub_image"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "artworks_characters", force: true do |t|
    t.integer "artwork_id"
    t.integer "character_id"
  end

  create_table "artworks_engravings", force: true do |t|
    t.integer "artwork_id"
    t.integer "engraving_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "biography"
    t.date     "death_date"
    t.date     "beatification_date"
    t.date     "canonization_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "descriptions", force: true do |t|
    t.integer  "artwork_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "engravings", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iconographic_attributes", force: true do |t|
    t.string   "name"
    t.integer  "artwork_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "origins", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phylactery_billboards", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "story_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

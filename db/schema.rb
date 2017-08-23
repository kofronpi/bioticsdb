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

ActiveRecord::Schema.define(version: 20170823160154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "effects", force: :cascade do |t|
    t.citext "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_effects_on_name"
  end

  create_table "effects_strains", id: false, force: :cascade do |t|
    t.bigint "effect_id", null: false
    t.bigint "strain_id", null: false
    t.index ["effect_id"], name: "index_effects_strains_on_effect_id"
    t.index ["strain_id"], name: "index_effects_strains_on_strain_id"
  end

  create_table "illnesses", force: :cascade do |t|
    t.citext "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_illnesses_on_name"
  end

  create_table "illnesses_strains", id: false, force: :cascade do |t|
    t.bigint "illness_id", null: false
    t.bigint "strain_id", null: false
    t.index ["illness_id"], name: "index_illnesses_strains_on_illness_id"
    t.index ["strain_id"], name: "index_illnesses_strains_on_strain_id"
  end

  create_table "probiotics", force: :cascade do |t|
    t.citext "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_probiotics_on_name"
  end

  create_table "strains", force: :cascade do |t|
    t.bigint "probiotic_id"
    t.citext "strain_id", null: false
    t.citext "strain_name"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["probiotic_id"], name: "index_strains_on_probiotic_id"
    t.index ["strain_id"], name: "index_strains_on_strain_id"
  end

  add_foreign_key "strains", "probiotics"
end

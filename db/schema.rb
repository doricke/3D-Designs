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

# Author::    	Darrell O. Ricke, Ph.D., MIT Lincoln Laboraotry
# Copyright:: 	Copyright (c) 2014 Massachusetts Institute of Technogy 
# License::   	GNU GPL license  (http://www.gnu.org/licenses/)
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
ActiveRecord::Schema.define(version: 20140128192255) do

  create_table "attachments", force: true do |t|
    t.integer  "design_id"
    t.string   "file_name",      limit: 160
    t.string   "path_name",      limit: 160
    t.string   "description",    limit: 160
    t.string   "file_type",      limit: 40
    t.integer  "downloads"
    t.string   "content_type",   limit: 80
    t.datetime "updated_at"
    t.integer  "contents_bytes"
    t.binary   "contents"
    t.integer  "view_bytes"
    t.text     "view"
  end

  create_table "attribute_values", force: true do |t|
    t.integer "design_id"
    t.integer "attribute_id"
    t.string  "attribute_type",    limit: 40
    t.integer "attribute_int"
    t.float   "attribute_float"
    t.string  "attribute_string",  limit: 80
    t.boolean "attribute_boolean"
  end

  create_table "attributes", force: true do |t|
    t.string "attribute_name", limit: 80
  end

  create_table "comments", force: true do |t|
    t.integer  "design_id"
    t.integer  "user_id"
    t.float    "rating"
    t.datetime "updated_at"
    t.text     "comments"
  end

  create_table "deriveds", force: true do |t|
    t.integer "design_id"
    t.integer "source_id"
    t.string  "derived_type", limit: 80
  end

  create_table "design_licenses", force: true do |t|
    t.integer "design_id"
    t.integer "license_id"
  end

  create_table "designs", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "instrument_id"
    t.string   "design_name",   limit: 160
    t.string   "revision",      limit: 32
    t.float    "rating"
    t.integer  "views"
    t.integer  "downloads"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer "design_id"
    t.string  "image_use",     limit: 40
    t.string  "image_name",    limit: 160
    t.string  "description",   limit: 160
    t.string  "image_type",    limit: 80
    t.integer "picture_bytes"
    t.binary  "picture"
  end

  create_table "instrument_types", force: true do |t|
    t.string "category", limit: 80
  end

  create_table "instruments", force: true do |t|
    t.integer "image_id"
    t.integer "instrument_type_id"
    t.string  "instrument_name",    limit: 160
    t.string  "instrument_model",   limit: 160
  end

  create_table "licenses", force: true do |t|
    t.string "license_name",    limit: 80
    t.string "license_version", limit: 32
    t.string "license_url",     limit: 200
  end

  create_table "members", force: true do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.string  "role",    limit: 40
  end

  create_table "papers", force: true do |t|
    t.integer "design_id"
    t.integer "link_id"
    t.string  "authors",   limit: 480
    t.string  "title",     limit: 480
    t.string  "reference", limit: 480
    t.string  "url",       limit: 480
  end

  create_table "performances", force: true do |t|
    t.integer  "design_id"
    t.integer  "attachment_id"
    t.string   "name",          limit: 160
    t.text     "description"
    t.float    "metric"
    t.float    "rating"
    t.datetime "updated_at"
  end

  create_table "softwares", force: true do |t|
    t.integer "design_id"
    t.integer "attachment_id"
    t.string  "software_name", limit: 160
    t.text    "description"
  end

  create_table "teams", force: true do |t|
    t.string "team_name", limit: 80
  end

  create_table "useds", force: true do |t|
    t.integer  "design_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.text     "notes"
  end

  create_table "users", force: true do |t|
    t.string  "name",            limit: 160
    t.string  "email",           limit: 160
    t.string  "hashed_password", limit: 40
    t.string  "salt",            limit: 40
    t.boolean "is_admin"
  end

  create_table "videos", force: true do |t|
    t.integer  "design_id"
    t.string   "video_name",        limit: 160
    t.string   "video_description", limit: 160
    t.string   "video_category",    limit: 40
    t.string   "video_type",        limit: 80
    t.integer  "video_bytes"
    t.binary   "movie"
    t.datetime "updated_at"
  end

end

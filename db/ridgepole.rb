create_table "users", force: :cascade do |t|
  # t.string :name
  # t.string :avatar_url
  t.timestamps
end

create_table "repositories", force: :cascade do |t|
  t.string :name
  t.string :full_name
  t.string :description
  t.string :html_url
  t.string :homepage
  t.string :language
  t.integer :stargazers_count
  t.datetime :pushed_at
  t.boolean :rails, default: false
  t.timestamps
end

create_table "tables", force: :cascade do |t|
  t.string :name
  t.timestamps
end

create_table "table_links", force: :cascade do |t|
  t.integer :table_id
  t.integer :repository_id
  t.string  :path # => db/schema.rb
  t.integer :line # => 21
  t.timestamps
end

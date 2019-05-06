create_table "users", force: :cascade do |t|
  # t.bigint "team_id"
  # t.string "name"
  # t.string "email"
  t.timestamps
end

create_table "repositories", force: :cascade do |t|
  t.string 'name'
  t.string 'full_name'
  t.string 'description'
  t.string 'html_url'
  t.string 'homepage'
  t.string 'language'
  t.integer 'stargazers_count'
  t.datetime 'pushed_at'
  t.timestamps
end

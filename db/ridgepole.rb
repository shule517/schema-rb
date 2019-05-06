create_table "users", force: :cascade do |t|
  # t.bigint "team_id"
  # t.string "name"
  # t.string "email"
  t.timestamps
end

create_table "repositories", force: :cascade do |t|
  t.timestamps
end

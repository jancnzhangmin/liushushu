json.extract! mytest, :id, :name, :age, :created_at, :updated_at
json.url mytest_url(mytest, format: :json)

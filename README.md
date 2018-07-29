### railsプロジェクトの作成
docker-compose run web bundle exec rails new . --webpack=vue --force
postgresqlを使うときは以下
docker-compose run web bundle exec rails new . --webpack=vue --force --database=postgresql
```
# config/database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
```


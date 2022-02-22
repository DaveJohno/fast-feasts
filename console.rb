require "pry"
require 'pg'

def run_sql(sql, sql_params = [])
  db = PG.connect(dbname: "fast_feasts_db")
  results = db.exec_params(sql, sql_params)
  db.close
  results
end

planet_db = run_sql("SELECT * FROM planets").to_a

binding.pry
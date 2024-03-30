class SanitizeController < ApplicationController

  def test1
    # ruleid: sanitize_sql-misuse
    query1 = ActiveRecord::Base.sanitize_sql("SELECT * FROM users WHERE name = '#{params['name']}'")
    users = ActiveRecord::Base.connection.execute(query1)
    render json: users
  end

  def test2
    # ruleid: sanitize_sql-misuse
    sanitizedName2 = ActiveRecord::Base.sanitize_sql(params['name'])
    query2 = "SELECT * FROM users WHERE name = '#{sanitizedName2}'"
    users = ActiveRecord::Base.connection.execute(query2)
    render json: users
  end

  def test3
    # ruleid: sanitize_sql-misuse
    query3 = "SELECT * FROM users WHERE name = '#{ActiveRecord::Base.sanitize_sql(params['name'])}'"
    users = ActiveRecord::Base.connection.execute(query3)
    render json: users
  end

  def test4
    # ruleid: sanitize_sql-misuse
    query4 = ActiveRecord::Base.sanitize_sql("SELECT * FROM users WHERE name = '#{(params['name'])}'")
    users = ActiveRecord::Base.connection.execute(query4)
    render json: users
  end

  def test5
    query5 = "SELECT * FROM users WHERE name = '#{params['name']}'"
    # ruleid: sanitize_sql-misuse
    sanitizedQuery5 = ActiveRecord::Base.__send__(:sanitize_sql, query5)
    users = ActiveRecord::Base.connection.execute(sanitizedQuery5)
    render json: users
  end

  def test6
    query6 = "SELECT * FROM users WHERE name = '#{params['name']}'"
    # ruleid: sanitize_sql-misuse
    sanitizedQuery6 = ActiveRecord::Base.send(:sanitize_sql, query6)
    users = ActiveRecord::Base.connection.execute(sanitizedQuery6)
    render json: users
  end

  def test7
    # ruleid: sanitize_sql-misuse
    users7 = User.where(ActiveRecord::Base.sanitize_sql("name = '#{params['name']}'"))
    render json: users7
  end

  def test8
    # ruleid: sanitize_sql-misuse
    sanitizedName8 = ActiveRecord::Base.sanitize_sql params['name']
    query8 = "SELECT * FROM users WHERE name = '#{sanitizedName8}'"
    users = ActiveRecord::Base.connection.execute(query8)
    render json: users
  end

  def ok1
    queryok1 = "SELECT * FROM users WHERE name = ?"
    # ok: sanitize_sql-misuse
    sanitizedQuery1 = ActiveRecord::Base.sanitize_sql [queryok1, params['name1']]
    users = ActiveRecord::Base.connection.execute(sanitizedQuery1)
    render json: users
  end

  def ok2
    # ok: sanitize_sql-misuse
    sanitizedQuery = ActiveRecord::Base.sanitize_sql("SELECT * FROM users WHERE name = ?", params['name'])
    users = ActiveRecord::Base.connection.execute(sanitizedQuery)
    render json: users
  end

  def ok3
    # ok: sanitize_sql-misuse
    sanitizedQuery = ActiveRecord::Base.sanitize_sql(["SELECT * FROM users WHERE name = ?", params['name']])
    users = ActiveRecord::Base.connection.execute(sanitizedQuery)
    render json: users
  end

  def ok4
    queryok4 = "SELECT * FROM users WHERE name = ?"
    # ok: sanitize_sql-misuse
    sanitizedQuery4 = ActiveRecord::Base.sanitize_sql queryok4, params['name1']
    users = ActiveRecord::Base.connection.execute(sanitizedQuery1)
    render json: users
  end

end

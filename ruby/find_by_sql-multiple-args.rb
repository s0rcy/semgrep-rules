def test1
     # ruleid: find_by_sql-multiple-args
    users = User.find_by_sql('SELECT * FROM users where name = ?', 'foo')
    render json: users
end

def test2
    # ruleid: find_by_sql-multiple-args
    users = User.find_by_sql('SELECT * FROM users where name = ?', ['foo'])
    render json: users
end

def test3
    # ruleid: find_by_sql-multiple-args
    users = User.find_by_sql('SELECT * FROM users where name = ?', binds=['foo'])
    render json: users
end

def ok1
    # ok: find_by_sql-multiple-args
    users = User.find_by_sql(['SELECT * FROM users where name = ?', 'foo'])
    render json: users
end

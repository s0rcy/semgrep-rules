# semgrep-rules

Collection of personal Semgrep rules for security analysis and research.


## Setup

1. Install [semgrep](https://semgrep.dev/)
2. Clone this repo
3. Select target rule(s) and source dir

~~~
$ semgrep --config path/to/rules path/to/source
~~~

4. Analyze results and tune rules as needed
5. Repeat!


## Rules


Rule Path                         | Language | Vuln           | Description
----------------------------------| -------- | -------------- | -------------
ruby/sanitize_sql-misuse          | Ruby     | SQL Injection  | Detect sanitize_sql misuse
ruby/find_by_sql-multiple-args    | Ruby     | SQL Injection  | Warn on sanitization behavior
ruby/pundit-missing-authorize     | Ruby     | Access Bypass  | Pundit authorization check template

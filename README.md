# Practice

## Steps
```
$ mix phx.gen.html Accounts User users name:string \
username:string:unique

$ mix ecto.migrate

$ mix phx.gen.context Accounts Credential credentials \
email:string:unique user_id:references:users

# enforce association at migration file: on_delete: :delete_all (default is :nothing)

$ mix ecto.migrate
```

-----

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

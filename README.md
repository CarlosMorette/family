# Family

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`


## Notes
  ### Configuring postgres user 

  1. Entering in *postgres* user
  ```
    sudo su postgres
  ```

  2. Access CLI psql
  ```
    psql
  ```

  3. Set password
  ```
    \password
  ```

  ### Access postgres user
  
  1. Accessing from the terminal
  ```
    psql -Upostgres -hlocalhost
  ```

  ### Connecting with database
  ```
   \c <database_name>
  ```

## Next steps
[ ] Controllers authentication
[ ] Implement password field on user table
[ ] Add tests on the controller
[ ] Add tests on the functions
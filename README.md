# The Elixir Blog
_An Excuse to Explore_

1. install erlang r16
2. install elixir
3. clone project
4. run `mix deps.get` from inside the directory
5. run `bundle` this will setup the testing and migration tools
5. SQL fun:
  create user in postgres with createdb role

  create database blog_dev and blog_test
  ```
  CREATE DATABASE blog_dev;
  CREATE DATABASE blog_test;
  ```

  create table posts:
   ```
   CREATE TABLE posts (
    id serial PRIMARY KEY,
    headline varchar(255),
    content text);
   ```
  populate the dev one with a record or two
  ```
    INSERT INTO posts (headline, content)
    VALUES ('A Fishful of Dollars', 'Oh, you're a dollar naughtier than most. Oh right.')
  ```

6. run `mix test`
7. run `mix server`
8. the site should be available on localhost:4000

Lorem Ipsum provided by:

* [Fillerama](http://chrisvalleskey.com/fillerama/)

Elixir Resources:

* [Elixir website](http://elixir-lang.org/)
* [Elixir getting started guide](http://elixir-lang.org/getting_started/1.html)
* [Elixir docs](http://elixir-lang.org/docs)
* [Dynamo source code](https://github.com/elixir-lang/dynamo)
* [Dynamo guides](https://github.com/elixir-lang/dynamo#learn-more)
* [Dynamo docs](http://elixir-lang.org/docs/dynamo)

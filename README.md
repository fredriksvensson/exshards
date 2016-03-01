<img src="http://38.media.tumblr.com/db32471b7c8870cbb0b2cc173af283bb/tumblr_inline_nm9x9u6u261rw7ney_540.gif" height="170" width="100%" />


# ExShards

This is a wrapper on top of [ETS](http://erlang.org/doc/man/ets.html) and [Shards](https://github.com/cabol/shards).

**Shards** is a simple library to scale-out ETS tables, which implements the same ETS API.
Taking advantage of this, what **ExShards** does is provides a wrapper to use either `ets` or
`shards` totally transparent.


## Installation and Usage

To start playing with `exshards` you just have to follow these simple steps:

  1. Add exshards to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:exshards, github: "cabol/exshards", branch: "master"}]
  end
  ```

  2. Because `exshards` uses `shards`, make sure that `shards` is started before your application:

  ```elixir
  def application do
    [applications: [:shards]]
  end
  ```

## Build

    $ git clone https://github.com/cabol/exshards.git
    $ cd shards
    $ mix deps.get && mix compile


## Getting Started!

Start an Elixir console:

    $ iex -S mix

Once into the Elixir console:

```elixir
> require ExShards
nil

> ExShards.new :mytab, [:public, :named_table]
:mytab

> ExShards.insert :mytab, [k1: 1, k2: 2, k3: 3]
true

> ExShards.lookup :mytab, :k1
[k1: 1]
> ExShards.lookup :mytab, :k2
[k2: 2]
> ExShards.lookup :mytab, :k3
[k3: 3]

> ExShards.delete :mytab, :k3
true
> ExShards.lookup :mytab, :k3
[]
```

As you might have noticed, it's extremely easy, such as you were using **ETS** API directly.

By default, all **ExShards** functions are mapped to use **ETS** module, but if you want to use
**Shards** instead, you only have to do a little change in the config:

```elixir
config :exshards,
  adapter: :shards
```

Previous config, changes the adapter/module to use, from `ets` to `shards`.

Now let's start again an Elixir console with this new config:

Once into the Elixir console:

```elixir
> require ExShards

> ExShards.new :mytab, [:public, :named_table], 5
:mytab

> :observer.start
:ok
```

You will find in the **Applications** tab, the `shards` app running, with the `5` shards
given in the `new/3` function.

And as I mentioned before, because `shards` implements the same ETS API, you can keep using
**ExShards** as previously:

```elixir
> ExShards.insert :mytab, [k1: 1, k2: 2, k3: 3]
true

> ExShards.lookup :mytab, :k1
[k1: 1]
> ExShards.lookup :mytab, :k2
[k2: 2]
> ExShards.lookup :mytab, :k3
[k3: 3]

> ExShards.delete :mytab, :k3
true
> ExShards.lookup :mytab, :k3
[]
```

Extremely easy isn't? **ExShards** is an abstraction layer for either `ets` or `shards`,
everything transparent, out-of-the-box.


## Copyright and License

Copyright (c) 2016 Carlos Andres Bolaños R.A.

**ExShards** source code is licensed under the [MIT License](LICENSE.md).

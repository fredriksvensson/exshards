defmodule ExShards.Helper do
  @moduledoc """
  This is a helper module, to generate API functions.
  """

  @doc """
  Defines ETS/Shards API function.

  ## Example:

      defmodule ExShards do
        import ExShards.Helper

        defapi :new, 2
      end
  """
  defmacro defapi(fun, arity) do
    mod = Application.get_env(:exshards, :adapter, :ets)
    args = 1..arity
      |> Enum.map(&(Module.concat(["arg#{&1}"])))
      |> Enum.map(fn(x) -> {x, [], ExShards.Helper} end)
    quote do
      def unquote(fun)(unquote_splicing(args)) do
        unquote(mod).unquote(fun)(unquote_splicing(args))
      end
    end
  end
end

defmodule ExShards do
  @moduledoc """
  This is the main module, which exposes ETS/Shards API.

  The macro `defapi` is used to generate all ETS/Shards API functions.
  """

  import ExShards.Helper

  @doc """
  ETS/Shards API.

  Links:
    * [ETS API](http://erlang.org/doc/man/ets.html)
    * [Shards API](https://github.com/cabol/shards/issues/1)
  """
  defapi :all, 0
  defapi :delete, 1
  defapi :delete, 2
  defapi :delete_all_objects, 1
  defapi :delete_object, 2
  defapi :file2tab, 1
  defapi :file2tab, 2
  defapi :first, 1
  defapi :foldl, 3
  defapi :foldr, 3
  defapi :from_dets, 2
  defapi :fun2ms, 1
  defapi :give_away, 3
  defapi :i, 0
  defapi :i, 1
  defapi :info, 1
  defapi :info, 2
  defapi :init_table, 2
  defapi :insert, 2
  defapi :insert_new, 2
  defapi :is_compiled_ms, 1
  defapi :last, 1
  defapi :lookup, 2
  defapi :lookup_element, 3
  defapi :match, 2
  defapi :match, 3
  defapi :match, 1
  defapi :match_delete, 2
  defapi :match_object, 2
  defapi :match_object, 3
  defapi :match_object, 1
  defapi :match_spec_compile, 1
  defapi :match_spec_run, 2
  defapi :member, 2
  defapi :new, 2
  defapi :new, 3 # only for shards
  defapi :next, 2
  defapi :prev, 2
  defapi :rename, 2
  defapi :repair_continuation, 2
  defapi :safe_fixtable, 2
  defapi :select, 2
  defapi :select, 3
  defapi :select, 1
  defapi :select_count, 2
  defapi :select_delete, 2
  defapi :select_reverse, 2
  defapi :select_reverse, 3
  defapi :select_reverse, 1
  defapi :setopts, 2
  defapi :slot, 2
  defapi :tab2file, 2
  defapi :tab2file, 3
  defapi :tab2list, 1
  defapi :tabfile_info, 1
  defapi :table, 1
  defapi :table, 2
  defapi :test_ms, 2
  defapi :take, 2
  defapi :to_dets, 2
  defapi :update_counter, 3
  defapi :update_counter, 4
  defapi :update_element, 3
end

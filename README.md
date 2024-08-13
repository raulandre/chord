# Chord

**Roteiro do Artigo**
- Introdução: Elixir, Erlang, BEAM, História e Visão Geral
- Concorrência e Paralelismo: Visão de alto nível sobre como a máquina BEAM funciona (Processos BEAM, Processos (OS), Schedulers e Threads (OS))
- Computação Distribuída: Modelo de Ator, Clusters BEAM, Erlang OTP, GenServer e demais recursos para rodar processos de forma distribuída
- Chord: Implementação final de um algoritmo Chord em Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `chord` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chord, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/chord>.


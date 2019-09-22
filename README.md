# Lasorex

## Description

An easy and quick way to monitor and keep track of the current running processes, scheduler and resource utilisation of the project. In other words, a BEAM version of the Linux top command.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `lasorex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lasorex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/lasorex](https://hexdocs.pm/lasorex).

## Features

Get a list of the scheduler usage, processes and their sub processes along with memory (in bytes), queue length, pid

```elixir
iex(1)>Lasorex.btop
```

![Alt text](../master/images/1.png?raw=true "Process Scheduler stats")

The resulting list of processes can be sorted based on the columns **name, queue, and memory** using the keys **n, b, m**

To exit press **q**

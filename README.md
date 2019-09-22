# Lasorex

## Description

An easy and quick way to monitor and keep track of the current running processes, scheduler and resource utilisation of the project. In other words, a BEAM version of the Linux top command.

## Installation

The package can be installed by adding `lasorex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:lasorex, "~> 0.1.0", [git: "https://github.com/spawnfest/lasorex.git"]}
  ]
end
```

And then get the dependency using

```elixir
mix deps.get
```

Then run the project using

```elixir
iex -S mix
```

## Features

Get a list of the scheduler usage, processes and their sub processes along with memory (in bytes), queue length, pid

```elixir
iex(1)>Lasorex.btop
```

![Alt text](../master/priv/assets/1.png?raw=true "Process Scheduler stats")

The resulting list of processes can be sorted based on the columns **name, queue, and memory** using the keys **n, b, m**

To exit press **q**

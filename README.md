# Lasorex

## Description

An easy and quick way to monitor and keep track of the current running processes, scheduler and resource utilisation of the project.

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

Get a list of the processes that are running currently. There are two ways of achieving this. One way is to use **Lasorex.List.list** function. This returns all the processes running currently at the top level.

```elixir
iex(1)> Lasorex.List.list
[
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 3196,
    name: "init",
    pid: #PID<0.0.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 3466,
    name: "erts_code_purger",
    pid: #PID<0.1.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.2.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.3.0>,
    queue: 0
  },
  ...
]
```

However, if you are also interested in the sub-processes as well, for each process (if it has any), then **Lasorex.Tree.puts** might be the one for you.

```elixir
iex(5)> Lasorex.Tree.puts()
[
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 3196,
        name: "init",
        pid: #PID<0.0.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 3466,
        name: "erts_code_purger",
        pid: #PID<0.1.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 233,
        name: "",
        pid: #PID<0.2.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 233,
        name: "",
        pid: #PID<0.3.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 233,
        name: "",
        pid: #PID<0.4.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 233,
        name: "",
        pid: #PID<0.5.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 233,
        name: "",
        pid: #PID<0.6.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 20317,
        name: "erl_prim_loader",
        pid: #PID<0.9.0>,
        queue: 0
      },
      %Lasorex.Process{
        group_leader: #PID<0.0.0>,
        members: [],
        memory: 986,
        name: "logger",
        pid: #PID<0.41.0>,
        queue: 0
      }
    ],
    memory: 3196,
    name: "init",
    pid: #PID<0.0.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 3466,
    name: "erts_code_purger",
    pid: #PID<0.1.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.2.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.3.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.4.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.5.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.6.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 20317,
    name: "erl_prim_loader",
    pid: #PID<0.9.0>,
    queue: 0
  }
]
```

---

Filter the list of current processes based on a keyword

```elixir
iex(2)> Lasorex.List.list(:filter, "Elixir")
[
  %Lasorex.Process{
    group_leader: #PID<0.80.0>,
    members: [],
    memory: 609,
    name: "elixir_sup",
    pid: #PID<0.82.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.45.0>,
    members: [],
    memory: 239,
    name: "rex",
    pid: #PID<0.52.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 1363,
    name: "logger",
    pid: #PID<0.41.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.162.0>,
    members: [],
    memory: 752,
    name: "Elixir.Logger",
    pid: #PID<0.165.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.80.0>,
    members: [],
    memory: 233,
    name: "elixir_config",
    pid: #PID<0.83.0>,
    queue: 0
  }
]
```

---

Sort the list based on the keys either ascending or descending order

```elixir
iex(3)> Lasorex.List.list(:sort_desc, :group_leader)
[
  %Lasorex.Process{
    group_leader: #PID<0.178.0>,
    members: [],
    memory: 233,
    name: "Elixir.ExNcurses.Server",
    pid: #PID<0.181.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.178.0>,
    members: [],
    memory: 752,
    name: "Elixir.ExNcurses.Supervisor",
    pid: #PID<0.180.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.178.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.179.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.172.0>,
    members: [],
    memory: 752,
    name: "Elixir.Tachometer",
    pid: #PID<0.175.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.172.0>,
    members: [],
    memory: 1597,
    name: "Elixir.Tachometer.Supervisor",
    pid: #PID<0.174.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.162.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.168.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.144.0>,
    members: [],
    memory: 233,
    name: "Elixir.Hex.Server",
    pid: #PID<0.149.0>,
    queue: 0
  },
  ...
]
```

```elixir
iex(4)> Lasorex.List.list(:sort_asc, :memory)
[
  %Lasorex.Process{
    group_leader: #PID<0.178.0>,
    members: [],
    memory: 233,
    name: "Elixir.ExNcurses.Server",
    pid: #PID<0.181.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.178.0>,
    members: [],
    memory: 233,
    name: "",
    pid: #PID<0.179.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.80.0>,
    members: [],
    memory: 376,
    name: "elixir_code_server",
    pid: #PID<0.84.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.80.0>,
    members: [],
    memory: 609,
    name: "",
    pid: #PID<0.81.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.86.0>,
    members: [],
    memory: 986,
    name: "Elixir.IEx.Supervisor",
    pid: #PID<0.88.0>,
    queue: 0
  },
  %Lasorex.Process{
    group_leader: #PID<0.0.0>,
    members: [],
    memory: 1363,
    name: "logger",
    pid: #PID<0.41.0>,
    queue: 0
  }
]
```

**NOTE:** The **:sort_asc**, **:sort_desc**, and **:filter** operations can also be applied to the **Lasorex.Tree.puts** function, and this will retrieve the processes along with their member processes. If no members exist for that process, then the members will be an empty list.

---

Get a list of the scheduler usage, processes and their sub processes along with memory (in bytes), queue length, pid

```elixir
iex(5)>Lasorex.btop
```

![Alt text](../master/images/1.png?raw=true "Process Scheduler stats")

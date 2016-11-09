# Ffaker

[![hex.pm version](https://img.shields.io/hexpm/v/ffaker.svg)](https://hex.pm/packages/ffaker)
[![Build Status](https://travis-ci.org/marocchino/ffaker.svg?branch=master)](https://travis-ci.org/marocchino/ffaker)
[![Coverage Status](https://coveralls.io/repos/github/marocchino/ffaker/badge.svg?branch=master)](https://coveralls.io/github/marocchino/ffaker?branch=master)

elixir porting of <https://github.com/ffaker/ffaker>

## Installation

The package can be installed as:

  1. Add `ffaker` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ffaker, "~> 0.3.0", only: [:test]}]
    end
    ```

  2. (Optional) Set seed in `test/test_helper.exs`:

    ```elixir
    ExUnit.start()
    ExUnit.configure seed: elem(:os.timestamp, 2)
    Ffaker.Seed.reset
    ```

## Usage

```elixir
alias Ffaker.En.Name
alias Ffaker.En.Internet

Name.name       #=> "Christophe Bartell"
Internet.email  #=> "kirsten.greenholt@corkeryfisher.info"
```

[See more →](https://hexdocs.pm/ffaker/api-reference.html)

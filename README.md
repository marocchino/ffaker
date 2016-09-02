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
      [{:ffaker, "~> 0.0.1"}]
    end
    ```

  2. Ensure `ffaker` is started before your application:

    ```elixir
    def application do
      [applications: [:ffaker]]
    end
    ```


defmodule Day01 do
  @moduledoc """
  Documentation for Day01.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day01.required_fuel_simple(12)
      2

      iex> Day01.required_fuel_simple(14)
      2

      iex> Day01.required_fuel_simple(1969)
      654

      iex> Day01.required_fuel_simple(100756)
      33583

      iex> Day01.part1()
      3313655

      iex> Day01.required_fuel(1969)
      966

      iex> Day01.required_fuel(100756)
      50346

      iex> Day01.part2()
      4967616
  """
  def required_fuel_simple(for_mass) when is_integer(for_mass) do
    div(for_mass, 3) - 2
  end

  def required_fuel(for_mass) when is_integer(for_mass) do
    case div(for_mass, 3) - 2 do
      fuel when fuel >= 0 -> fuel + required_fuel(fuel)
      _fuel -> 0
    end
  end

  def part1() do
    "lib/input1.txt"
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.map(&required_fuel_simple/1)
    |> Enum.sum()
  end

  def part2() do
    "lib/input1.txt"
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.map(&required_fuel/1)
    |> Enum.sum()
  end
end

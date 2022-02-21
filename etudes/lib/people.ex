defmodule People do
  @moduledoc """
  Includes functions that process people data
  """

  @people_data [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30},
    {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]
  def people_data, do: @people_data

  @doc """
  Returns a list containing the names of people who are over forty years old and male
  """

  @spec filter_over_forty_male([{String.t, String.t, integer}]) :: [String.t]

  def filter_over_forty_male(people) do
    for {name, gender, age} <- people, gender == "M", age > 40, do: name
  end

  @doc """
  Returns a list containing the names of people who are over forty or male
  """

  @spec filter_over_forty_or_male([{String.t, String.t, integer}]) :: [String.t]

  def filter_over_forty_or_male(people) do
    for {name, gender, age} <- people, gender == "M" or age > 40, do: name
  end
end

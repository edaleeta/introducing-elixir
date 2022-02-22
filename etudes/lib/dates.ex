defmodule Dates do
  @moduledoc """
  Includes calculations related to dates.
  """

  @spec date_parts(date_string: String.t) :: [integer]

  def date_parts(date_string) do
    String.split(date_string, "-")
      |>Enum.map(fn part -> String.to_integer(part) end)
  end

  @doc """
  Given a year, return true if the year is a leap year, otherwise returns false.
  """

  @spec is_leap_year(integer) :: boolean

  def is_leap_year(year) do
    rem(year, 400) === 0 or (rem(year, 4) === 0 and not (rem(year, 100) === 0))
  end

  @doc """
  Given a date string in ISO format, returns the Julian date: the day of the year.
  """

  @spec julian(String.t) :: integer

  def julian(date) do
    [year, month, day] = date_parts(date)
    month_days = month_total_days(month - 1, get_days_in_months(year))
    month_days + day
  end

  @doc """
  Given a month as an integer and a list of days per month, returns the accumulated number of days for those months
  Example:
    When month = 1, returns the number of days in January;
    month = 2, returns number of days in January and February
  """

  @spec month_total_days(integer, [integer]) :: integer

  def month_total_days(month, days_per_month) do
    {days_to_sum, _}  = Enum.split(days_per_month, month)
    List.foldl(days_to_sum, 0, fn x, acc -> x + acc end)
  end

  @doc """
  Given a year, returns a list with 12 values where each value is the number of days in the corresponding month.
  Accounts for leap years.
  """

  @spec get_days_in_months(integer) :: [integer]

  def get_days_in_months(year) do
  num_feb_days = if is_leap_year(year), do: 29, else: 28
  [31, num_feb_days, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end

end

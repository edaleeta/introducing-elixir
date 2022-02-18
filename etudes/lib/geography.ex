defmodule Geography do
  @moduledoc """
  Includes functions to process geographic data
  """

  @doc """
  Creates a list of Countries given a path to .csv data
  """

  @spec make_geo_list(String.t) :: [%Country{}]

  def make_geo_list(file_path) do
    {:ok, file} = File.open(file_path, [:read, :utf8])
    make_geo_list(file, [])
  end

  @spec make_geo_list(IO.device, [%Country{}]) :: [%Country{}]

  defp make_geo_list(file, geo_list) do
    data = IO.read(file, :line)

    case data do
      :eof ->
        File.close(file)
        geo_list
      _ ->
        data = String.trim(data)
               |>String.split(",")
        geo_list = process_data(data, geo_list)
        make_geo_list(file, geo_list)
    end
  end

  @spec process_data([String.t], [%Country{}]) :: [%Country{}]

  defp process_data([country_name, language], geo_list) do
    [%Country{name: country_name, language: language} | geo_list]
  end

  defp process_data([city_name, population, latitude, longitude], [last_country | remaining_countries]) do
    updated_cities = [
      %City{
        name: city_name,
        population: String.to_integer(population),
        latitude: String.to_float(latitude),
        longitude: String.to_float(longitude)
      } | last_country.cities]
    [%{last_country | cities: updated_cities} | remaining_countries]
  end

end

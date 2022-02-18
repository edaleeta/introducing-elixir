defmodule City do
  defstruct name: "", population: 0, latitude: 0.0, longitude: 0.0
end

defimpl Valid, for: City do
  def valid?(%City{population: p, latitude: lat, longitude: long}) do
    p >= 0 and lat >= -90.0 and lat <= 90 and long >= -180.0 and long <= 180.0
  end
end

defimpl Inspect, for: City do
  import Inspect.Algebra
  def inspect(item, _options) do
    [latitude, longitude] = Enum.map([item.latitude, item.longitude], fn l ->
      Float.round(l, 2)
      |> abs
      |> to_string
    end)

    latitude_suffix = if item.latitude >= 0.0 do
      "\u00b0N"
    else
      "\u00b0S"
    end

    longitude_suffix = if item.longitude >= 0.0 do
      "\u00b0E"
    else
      "\u00b0W"
    end

    _msg = concat([
      item.name, break(), "(", to_string(item.population), ")", break(),
      latitude, latitude_suffix, break(), longitude, longitude_suffix
    ])
  end
end

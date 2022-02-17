defmodule College do
  @moduledoc """
  Includes functions to process college course data
  """

  @doc """
  Creates a map of room number to a list of courses taught in the room
  """

  @spec make_room_map() :: %{String.t => [String.t]}

  def make_room_map() do
    {:ok, file} = File.open("courses.csv", [:read, :utf8])
    room_map = read_lines_to_map(file, %{})
    File.close(file)
    room_map
  end


  @spec read_lines_to_map(IO.device, %{String.t => [String.t]}) :: %{String.t => [String.t]}

  defp read_lines_to_map(file, acc_map) do
    data = IO.read(file, :line)
    process_data(data, file, acc_map)
  end

  @spec process_data(:eof | String.t, IO.device, %{String.t => [String.t]}) :: %{String.t => [String.t]}

  defp process_data(:eof, _, acc_map) do
    acc_map
  end

  defp process_data(data, file, acc_map) do
    [_, course_name, room_id] = String.trim(data)
                                |> String.split(",")

    acc_map = Map.update(acc_map, room_id, [course_name], fn current_course_names ->
      [course_name | current_course_names]
    end)
    read_lines_to_map(file, acc_map)
  end

end

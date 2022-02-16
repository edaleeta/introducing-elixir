defmodule Teeth do
  @moduledoc """
  Includes calculations related to... teeth...
  """

  @doc """
  Provides mock pocket depth data
  """
  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
      [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
      [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
      [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
      [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
      [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
      [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
      [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
      [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
      [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
      [3,2,3,2,3,2]]
  end


  @doc """
  Given pocket depths for each tooth, return a list of tooth IDs that require further inspection
  """

  @spec alert([[integer]]) :: [integer]

  def alert(pocket_depths) do
    get_alerted_tooth_ids(1, pocket_depths, [])
  end

  @spec get_alerted_tooth_ids(integer, [[integer]], [integer]) :: [integer]

  defp get_alerted_tooth_ids(_, [], alert_list) do
    Enum.reverse(alert_list)
  end

  defp get_alerted_tooth_ids(current_tooth_id, pocket_depths, alert_list) do
    [current_tooth_pocket_depths | remaining_pocket_depths] = pocket_depths
    max_pocket_depth = Stats.maximum(current_tooth_pocket_depths)
    next_id = current_tooth_id + 1
    if max_pocket_depth >= 4 do
      get_alerted_tooth_ids(next_id, remaining_pocket_depths, [current_tooth_id | alert_list])
    else
      get_alerted_tooth_ids(next_id, remaining_pocket_depths, alert_list)
    end
  end

end

defmodule NonFP do
  @moduledoc false

  @doc """
  Given a char list of T or F chars that denote whether a tooth exists,
  and a probability that a tooth is good, generate random pocket depth data
  """

  @spec generate_pockets([char], float) :: [[integer]]

  def generate_pockets(tooth_exists_list, probability_is_tooth_good) do
    generate_pockets(tooth_exists_list, probability_is_tooth_good, [])
  end

  defp generate_pockets([], _, acc_pockets) do
    Enum.reverse(acc_pockets)
  end

  defp generate_pockets([?F | remaining_tooth_exists_list], probability_is_tooth_good, acc_pockets) do
    generate_pockets(remaining_tooth_exists_list, probability_is_tooth_good, [[0] | acc_pockets])
  end

  defp generate_pockets([?T | remaining_tooth_exists_list], probability_is_tooth_good, acc_pockets) do
    generate_pockets(
      remaining_tooth_exists_list,
      probability_is_tooth_good,
      [generate_tooth(probability_is_tooth_good) | acc_pockets])
  end

  @spec generate_tooth(float) :: [integer]

  defp generate_tooth(probability_is_tooth_good) do
    is_good = :rand.uniform < probability_is_tooth_good
    base_depth = if is_good do 2 else 3 end
    generate_tooth(base_depth, 6, [])
  end

  @spec generate_tooth(integer, integer, [integer]) :: [integer]

  defp generate_tooth(_, 0, acc_depths) do
    acc_depths
  end

  defp generate_tooth(base_depth, count_to_generate, acc_depths) do
    # Generate a random offset number within the range -1, 1
    random_offset = :rand.uniform(3) - 2
    generate_tooth(base_depth, count_to_generate - 1, [base_depth + random_offset | acc_depths])
  end

end

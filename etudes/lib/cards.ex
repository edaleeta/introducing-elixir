defmodule Cards do
  @moduledoc """
  Includes functions related to cards
  """

  @suits ["Clubs", "Diamonds", "Hearts", "Spades"]
  def suits, do: @suits

  @card_values ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
  def card_values, do: @card_values

  @doc """
  Creates a deck of 52 cards as a list
  """
  
  @spec make_deck() :: [{number|String.t, String.t}]

  def make_deck do
    for card_value <- @card_values, suit <- @suits, do: {card_value, suit}
  end

  @doc """
  Uniformly shuffles a list
  1. Randomly select a number in the range [0, max_index_of_list]
  2. Split the list at index determined by the random number
  3. The element at the index is added to the 'shuffled list', aka `acc`
  4. All elements before the index and after the index are concatenated as the new `list`
  5. Steps 1 through 4 are repeated until the `list` contains 0 elements, at which point the `acc` is returned
  """

  @spec shuffle([...]) :: [...]

  def shuffle(list) do
    shuffle(list, [])
  end

  defp shuffle([], acc) do
    acc
  end

  defp shuffle(list, acc) do
    {leading, [h | t]} = Enum.split(list, :rand.uniform(length(list)) - 1)
    shuffle(leading ++ t, [h | acc])
  end
end

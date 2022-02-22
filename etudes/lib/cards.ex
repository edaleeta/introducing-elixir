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
end

defmodule Blackjackex.Card do
  defstruct [:value, :suit]
  alias __MODULE__
  import Blackjackex.Utils, only: [value_to_english: 1]
  def new(value: value, suit: suit) do
    %Card{value: value, suit: suit}
  end

  def describe(%Card{} = card) do
    "#{value_to_english(card.value)} of #{card.suit}"
  end
end

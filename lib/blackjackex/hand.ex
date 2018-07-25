defmodule Blackjackex.Hand do
  defstruct cards: []
  alias __MODULE__

  import Blackjackex.Utils, only: [value_to_points: 2]

  def new do
    %Hand{cards: []}
  end

  def new(cards: cards) do
    %Hand{cards: cards}
  end

  def take_card(%Hand{cards: cards}, card) do
    new(cards: [card | cards])
  end

  def score(%Hand{cards: cards}) do
    {lower_total, higher_total} = 
      Enum.reduce(cards, {0, 0}, fn (card, {lower, higher}) -> 
      {value_to_points(card.value, :lower) + lower, value_to_points(card.value, :higher) + higher} 
    end)

    if higher_total > 21 do
      lower_total
    else
      higher_total
    end
  end

  def over?(hand) do
    score(hand) > 21
  end
end

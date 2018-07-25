defmodule Blackjackex.Deck do
  defstruct available: [], dealt: []
  alias __MODULE__
  alias Blackjackex.Card

  def new do
    suits = ["hearts", "spades", "clubs", "diamonds"]
    values = Enum.into(2..10, ["J", "Q", "K", "A"])

    available = for suit <- suits, value <- values do
      Card.new(value: value, suit: suit)
    end

    %Deck{available: available}
  end

  def new(available: available, dealt: dealt) do
    %Deck{available: available, dealt: dealt}
  end

  def deal(deck, random_function \\ &:rand.uniform/1) # Not sure why I need this.
  def deal(%Deck{available: []} = deck, _), do: {:error, deck}
  def deal(%Deck{available: available, dealt: dealt}, random_function) do
    selected_card_index = available
                          |> length
                          |> random_function.()

    {card, available} = List.pop_at(available, selected_card_index - 1)
    deck = Deck.new(available: available, dealt: [card | dealt])

    {:ok, deck, card}
  end
end

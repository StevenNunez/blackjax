defmodule Blackjackex.DeckTest do
  use ExUnit.Case
  alias Blackjackex.Deck

  test "returns 52 cards" do
    deck = Deck.new
    assert deck.available |> length == 52
    assert deck.dealt |> length == 0
  end

  test "Deals 'random' card" do
    random_function = &(&1)

    deck = Deck.new
    {:ok, deck, card} = Deck.deal(deck, random_function)

    assert deck.dealt == [card]
    assert deck.available |> length == 51

    {:ok, deck, card2} = Deck.deal(deck, random_function)
    assert deck.dealt == [card, card2]
    assert deck.available |> length == 50
  end
end

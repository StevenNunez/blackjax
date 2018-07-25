defmodule Blackjackex.CardTest do
  use ExUnit.Case
  alias Blackjackex.Card

  test "returns a card based on suit and value" do
    card = Card.new(value: "A", suit: "Spades")
    assert card |> Card.describe == "Ace of Spades"
  end
end

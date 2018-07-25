defmodule Blackjackex.CardTest do
  use ExUnit.Case
  alias Blackjackex.Card

  test "returns a card based on suit and value" do
    card = Card.new(value: 1, suit: "hearts")
    assert card |> Card.describe == "One of hearts"
  end
end

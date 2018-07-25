defmodule Blackjackex.HandTest do
  use ExUnit.Case
  alias Blackjackex.Hand
  alias Blackjackex.Card

  test "calculates hand total" do
    score = Hand.new
    |> Hand.take_card(Card.new(value: 10, suit: "hearts"))
    |> Hand.take_card(Card.new(value: 10, suit: "spades"))
    |> Hand.score
    assert score == 20
  end

  test "uses lower value for ace if needed" do
    score = Hand.new
    |> Hand.take_card(Card.new(value: "J", suit: "hearts"))
    |> Hand.take_card(Card.new(value: "K", suit: "spades"))
    |> Hand.take_card(Card.new(value: "A", suit: "spades"))
    |> Hand.score
    assert score == 21
  end

  test "uses higher value for ace if needed" do
    score = Hand.new
    |> Hand.take_card(Card.new(value: "K", suit: "spades"))
    |> Hand.take_card(Card.new(value: "A", suit: "spades"))
    |> Hand.score
    assert score == 21
  end

  test "calcuates if a hand is over" do
    refute Hand.new
    |> Hand.take_card(Card.new(value: 10, suit: "hearts"))
    |> Hand.take_card(Card.new(value: 10, suit: "spades"))
    |> Hand.over?
  end

  test "calcuates if a hand is under" do
    assert Hand.new
    |> Hand.take_card(Card.new(value: 10, suit: "hearts"))
    |> Hand.take_card(Card.new(value: 10, suit: "spades"))
    |> Hand.take_card(Card.new(value: 2, suit: "spades"))
    |> Hand.over?
  end
end

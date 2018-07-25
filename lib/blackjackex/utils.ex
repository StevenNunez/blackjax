defmodule Blackjackex.Utils do
  def value_to_english(2), do: "Two"
  def value_to_english(3), do: "Three"
  def value_to_english(4), do: "Four"
  def value_to_english(5), do: "Five"
  def value_to_english(6), do: "Six"
  def value_to_english(7), do: "Seven"
  def value_to_english(8), do: "Eight"
  def value_to_english(9), do: "Nine"
  def value_to_english(10), do: "10"
  def value_to_english("A"), do: "Ace"
  def value_to_english("J"), do: "Jack"
  def value_to_english("Q"), do: "Queen"
  def value_to_english("K"), do: "King"

  def value_to_points("A", :lower), do: 1
  def value_to_points("A", :higher), do: 11
  def value_to_points("J", _), do: 10
  def value_to_points("Q", _), do: 10
  def value_to_points("K", _), do: 10
  def value_to_points(value, _), do: value
end

defmodule Solution do
  @spec minimum_length_encoding(words :: [String.t]) :: integer
  def minimum_length_encoding(words) do
    words = Enum.sort_by(words, &byte_size/1, :desc)
    
    seen = for w1 <- words, reduce: [] do
      seen ->
        if Enum.any?(seen, fn w2 -> String.ends_with?(w2, w1) end) do
          seen
        else
          [w1 | seen]
        end
    end
      
    seen
    |> Enum.map(&String.length(&1) + 1)
    |> Enum.sum()
  end
end

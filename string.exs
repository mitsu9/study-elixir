defmodule MyString do
  def ascii?(str_list) do
    Enum.all?(str_list, fn str ->
      32 <= str and str <= 126
    end)
  end

  # word1からword2が並び替えのみで作れるか?
  # word1にある文字をword2から消す操作の繰り返しによって調べる
  # そもそも文字数が違うとfalse
  # 最後両方とも空になったらtrue
  # word2が残ったらfalse
  # HACK: deleteできなかったらその場で探索をやめていい. 素直に書くとif文が出てきたからこうしたけど，いい書き方があれば変えたい
  def anagram?(word1, word2) when length(word1) != length(word2), do: false
  def anagram?(word1, word2), do: _anagram?(word1, word2)

  defp _anagram?([], []), do: true
  defp _anagram?([], [_ | _]), do: false
  defp _anagram?([head | tail], word), do: _anagram?(tail, delete(head, word))

  # arrayからtargetと同じものを見つければ削除する
  # ひとつ削除したら探索をやめて返す
  # Enum.filterとか使うと複数個消しちゃうから自前で実装
  def delete(_, []), do: []
  def delete(target, [head | tail]) when target == head, do: tail
  def delete(target, [head | tail]), do: [head | delete(target, tail)]
end

IO.puts MyString.ascii?(' !"#&$~abc')
IO.puts MyString.ascii?('abcひらがな')

IO.puts MyString.anagram?('abc', 'bac')
IO.puts MyString.anagram?('a2bcd', 'bcd1a')

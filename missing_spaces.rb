def do_stuff(word)
  list_of_words = ["a", "able", "are", "area", "be", "car", "care", "ear", "hello", "not", "note", "or", "to", "the", "world"]
	
	if list_of_words.include? word
	  return true
  else
    (0..word.length-1).each do |i|
      substring = word[0..i]
      if (list_of_words.include? substring)
        suffix = word[i+1..word.length-1]
        if do_stuff(suffix) == true
          return true
        end
      end
    end
    return false
  end
end

t = gets.to_i
for i in 1..t do
	word = gets.strip
	puts do_stuff(word)
end
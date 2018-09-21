# s = 'this is the string'
# hash = {}
# s.split(' ).each do |c|
# if h[c] 
#   h[c] += 1
# else
#   h[c] = 1
# end



# max = 0
# s.split(' ').each do |word|
#   max =   ax > word.length ? word.length : max
# end

while true
  puts 'What do you wanna do? enter desired number'
  puts '1) Your input'
  puts '2) Exit'
  input = gets.strip

  if input == '2'
    exit
  elsif input=='1'
    puts 'Enter your sentence:'
    # below I split on any non-word (non-letter or number or _), and since it might return empty stings (if there are tow non-word symobls, we get an empty string) I use reject to reject empty strings
    s = gets.strip.split(/\W/).reject {|x| x.empty? }
    if s.length < 2
      puts 'ERROR: Must have 2+ words in your sentence. Try again.'
    elsif s.length
      list = []
      max = 0
      s.each do |word|
        # Find unique letters in each word
        letters = word.split("") # Could also do  word.scan(/\w/)
        lettersUniq = letters.uniq
        # keep a count of max occurring letter for each word, also the word where this max occuring letter occured in. 'max' is NOT initialized for each word, so it can be used across all word and their letters
        letterOccurrence = lettersUniq.map {|x| letters.count(x)}
        maxInWord = letterOccurrence.max  # whats the count of max occurring letter in this word
        if max < maxInWord
          max = maxInWord
          list = [word]
        elsif max == maxInWord
          list.append(word)
        end
      end
      puts list
      puts list.join(" & ")
      puts "Highest repeated letters is in the word#{list.length>1 ? 's' : ''}: #{list.join(" & ")},  with #{max} repeates"

    end
  else
    puts "Enter only 1 or 2. Try again."
  end
end
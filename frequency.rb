# frozen_string_literal: true

require 'csv'

file = 'input.txt'

frequency = Hash.new()

File.readlines(file).each do |line|
  words = line.split(' ')
  words.each do |word|

    # Filter Out
    # 1. Short words (< 3 characters)
    # 2. Words w/ numbers
    # 3. Words w/ special characters
    if word.length > 2 && word.count('0-9') < 1 && word.index(/[^[:alnum:]]/).nil?

      # 1. On the first encounter with a word, store the word and set the counter to 1.
      # 2. On every subsequent encounter increment the count by 1.
      if frequency[word.downcase].nil?
        frequency[word.downcase] = { word: word.downcase.capitalize, times: 1 }
      else
        frequency[word.downcase][:times] += 1
      end
    end
  end
end

CSV.open('export.csv', 'wb') do |csv|
  frequency.to_a.each do |item|
    word = item[1][:word]
    times = item[1][:times]
    csv << [word, times]
  end
end

#CSV.open('export.csv', 'wb') { |csv| frequency.to_a.each { |elem| csv << elem } }

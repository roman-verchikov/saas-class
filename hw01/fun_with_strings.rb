#!/bin/ruby

def palindrome?(string)
    clear_string = string.downcase.delete %Q{[\W\s().?,!-]}  

    return clear_string == clear_string.reverse
end

def count_words(string)
    words = string.downcase.scan(/\w+/)
    hash = {}

    words.uniq.each { |w| hash[w] = words.count(w) } 

    return hash
end


#!/usr/bin/ruby

def combine_anagrams(words)
    hash = {}
    anagrams = []

    words.each { |w| 
        sorted = w.downcase.each_char.sort.join 

        if (hash.has_key?(sorted))
            hash[sorted].push w
        else
            hash[sorted] = Array.new.push(w)
        end
    }

    hash.each_value { |v|
        anagrams.push v
    }

    return anagrams
end




#!/usr/bin/ruby

def combine_anagrams(words)
    all_sorted = []
    anagrams = []

    words.each { |w| 
        cur_sorted = w.downcase.each_char.sort.join 

        anagrams << w if all_sorted.index(cur_sorted)
    }

    sorted.each { |w| 
        puts w
    }

    anagrams.each { |i| puts words[i]}

end




#!/usr/bin/ruby

#--------------------------------------------------------------------------------
# a)
#
# Extend the currency-conversion example from lecture so that you can write
# 5.dollars.in(:euros) 10.euros.in(:rupees) etc.  
#   * You should support the currencies 'dollars', 'euros', 'rupees' , 'yen'
#   where the conversions are: rupees to dollars, multiply by 0.019; yen to
#   dollars, multiply by 0.013; euro  to dollars, multiply by 1.292.  
#   * Both the singular and plural forms of each currency should be acceptable,
#   e.g.  1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.  
# You can use the code shown in lecture as a starting point if you wish; it is
# at http://pastebin.com/ agjb5qBF

# metaprogramming to the rescue!

class Numeric
    @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
    def method_missing(method_id, *args)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        arg_currency = args[0].to_s.gsub( /s$/, '')

        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        elsif (singular_currency == "in") 
            return self / @@currencies[arg_currency]
        else
            super
        end
    end
end

#--------------------------------------------------------------------------------
# b)
#
# Adapt your solution from HW 1 "palindromes" question so that instead of
# writing palindrome?  ("foo") you can write "foo".palindrome? HINT: this
# should require fewer than 5 lines of code.


def palindrome?(string)
    clear_string = string.downcase.delete %Q{\W\s().?,!-]}
    clear_string == clear_string.reverse
end

class String
    def method_missing(method_id)
        palindrome?(self)
    end
end


#--------------------------------------------------------------------------------
# c)
# Adapt your palindrome solution so that it works on Enumerables. That is:
#   [1,2,3,2,1].palindrome?  # => true
# (It's not necessary for the collection's elements to be palindromes
# themselves--only that the top-level collection be a palindrome.) HINT: this
# should require fewer than 5 lines of code.  Although hashes are considered
# Enumerables, your solution does not need to make sense for hashes (though it
# should not error).



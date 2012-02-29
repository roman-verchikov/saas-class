load '1-open_classes-metaprogramming-duck_typing.rb'

def test_numeric_extension
    test_result = true
    test_result = 5.dollars.in(:euros) == 5 / 1.292
    test_result = test_result && (10.euros.in(:rupees) == 10 * 1.292 / 0.019)
end

def test_palindrome
    test_result = true
    test_result = ("foo".palindrome? == false)
    test_result = test_result && ("AaaAAAA".palindrome? == true)
    test_result = test_result && ("A man, a -plan, ()!? a canal -- Panama".palindrome? == true)
    test_result = test_result && ("Rac~~~Ec:A!r".palindrome? == true)
end

def test_enumerable_palindrome
    test_result = true

    palindromes = [
        [1,2,3,4,3,2,1],
        [1,2,3,2,1],
        [1,2,2,1],
    ]
    not_palindromes = [
        [1,2,3],
        [4,5,6,5]
    ]
    # should not produce error
    hash = {
        "aaa" => "bbb"
    }

    palindromes.each { |p| test_result = test_result && p.palindrome?}
    not_palindromes.each { |p| test_result = test_result && !p.palindrome?}

    test_result = test_result && (hash.palindrome?)

    return test_result
end

puts (test_numeric_extension ? "PASS" : "FAIL")
puts (test_palindrome ? "PASS" : "FAIL")
puts (test_enumerable_palindrome ? "PASS" : "FAIL")

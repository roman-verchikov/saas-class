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
end

puts (test_numeric_extension ? "PASS" : "FAIL")
puts (test_palindrome ? "PASS" : "FAIL")

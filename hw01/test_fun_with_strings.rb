load 'fun_with_strings.rb'

def testPalindrome
    test_data = {
        %Q{Madam, I'm Adam!} => true,
        %Q{A man, a -plan, ()!? a canal -- Panama} => true,
        %Q{Abracadabra} => false
    }

    test_result = true

    test_data.each { |k, v| test_result = test_result && (palindrome?(k) == v) }

    return test_result
end

def countWordsTest
    test_data = {
        %Q{A man, a plan, a canal -- Panama} => 5,
        %Q{Doo bee doo bee doo} => 2 
    }

    test_result = true

    test_data.each { |k, v| test_result = test_result && (count_words(k).size() == v )}

    return test_result
end

def testFunction(func, description)
    print description, " test ", (send(func) ? "succeeded" : "failed"), "\n"
end

testFunction(:testPalindrome, "Palindrome")
testFunction(:countWordsTest, "Word count")


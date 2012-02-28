load 'anagrams.rb'
load 'test_helpers.rb'

def test_combine_anagrams
    input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
    expected_output = [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]

    return (combine_anagrams(input).sort == expected_output.sort)
end

run_test :test_combine_anagrams, "Combine anagram test"

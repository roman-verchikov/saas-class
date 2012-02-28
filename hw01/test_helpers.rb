def run_test(test_function, description)
    print description, (send(test_function) ? ": PASS" : ": FAIL"), "\n"
end

load 'advanced_oop.rb'
load 'test_helpers.rb'

def test_accessor_with_history
    @f = Foo.new
    @f.bar = 1
    @f.bar = 2
    test_result = (@f.bar_history == [nil,1,2])

    @f2 = Foo.new
    @f2.bar = 3
    @f2.bar = 4
    test_result = test_result && (@f2.bar_history == [nil, 3, 4])

    @f3 = Foo.new
    @f3.bar = 3
    @f3.bar = :wowo
    @f3.bar = 'hoooooo!'
    test_result = test_result && (@f3.bar_history == [nil, 3, :wowo, 'hoooooo!'])


    return test_result
end


run_test :test_accessor_with_history, "Accessor with history test"

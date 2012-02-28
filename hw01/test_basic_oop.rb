load 'basic_oop.rb'
load 'test_helpers.rb'

def test_desert_class_properties
    test_result = true
    name = "dessert_name" 
    calories = 10

    @d = Dessert.new
    @d.name = name 
    @d.calories = calories

    test_result = (@d.name == name)
    test_result = test_result && (@d.calories == calories)

    return test_result
end

def test_constructor
    test_result = true
    name = "asdf"
    calories = 200

    @d = Dessert.new(name, calories)

    test_result = (@d.name == name)
    test_result = test_result && (@d.calories == calories)

    return test_result
end


def test_healty_method
    test_result = true
    
    healthy_product = [ "apple", 100 ]
    unhealthy_product = [ "chockolate", 500 ]

    @d = Dessert.new()
    @d.name = healthy_product.first
    @d.calories = healthy_product.last

    test_result = (@d.healthy? == true)

    @d.name = unhealthy_product.first
    @d.calories = unhealthy_product.last

    test_result = test_result && (@d.healthy? == false)

    return test_result
end

def test_delisious_method
    test_result = true

    @d = Dessert.new
    test_result = (@d.delicious? == true)

    @d = JellyBean.new("aaa", 200, "black LicORIce")
    test_result = (@d.delicious? == false)

    @d = JellyBean.new("bbb", 111, "other flavor")
    test_result = (@d.delicious? == true)

    return test_result
end


run_test :test_desert_class_properties, "Test desert class properties"
run_test :test_healty_method, "Dessert.healthy method test"
run_test :test_constructor, "Dessert constructor test"
run_test :test_delisious_method, "Delisious method test"

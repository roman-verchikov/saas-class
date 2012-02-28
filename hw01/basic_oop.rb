class Dessert
    attr_accessor :name, :calories

    def initialize(name = "", calories = 0)
        self.name, self.calories = name, calories
    end
    def healthy?
        calories < 200
    end
    def delicious?
        return true
    end
end


class JellyBean < Dessert
    attr_accessor :flavor

    def initialize(name, calories, flavor)
        super name, calories
        self.flavor = flavor
    end

    def delicious?
        return flavor.downcase != "black licorice"
    end
end


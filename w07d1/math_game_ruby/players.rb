class Players
    attr_accessor :name, :life

    def initialize(name)
        @name = name
        @life = 3
    end

    def alive?
        @life > 0
    end
end

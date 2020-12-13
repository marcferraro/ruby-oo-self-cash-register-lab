class CashRegister
    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @item = []
        @price = []
        @quantity = []
    end

    attr_accessor :total
    attr_reader :item, :price, :quantity
    def discount
        @discount
    end

    def add_item(title, price, quantity = 1)
        self.total += price*quantity
        quantity.times do
            @item << title
            @price << price
        end
        
        @quantity << quantity
    end

    def apply_discount
        if @discount
            self.total -=  self.total * @discount / 100.0
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        self.item
    end

    def void_last_transaction
        self.quantity[-1].times do
            self.items.pop
            self.total -= self.price[-1]
            #self.quantity.pop
        end
        self.quantity.pop
    end
end
# lib/customer.rb

class Transaction
	attr_reader :product, :customer, :id
  @@id = 1
  @@transactions = []

  	
  	def initialize(customer,product)
      check_stock(product)
      @customer = customer
      @product = product
      @product.reduce_stock
      add_id
      @@transactions << self
  	end

    def self.all 
      @@transactions
    end

    def self.find(id)
      @@transactions.find {|transaction| transaction.id == id }
    end

    def self.all_by_customer (customer)
      @@transactions.find_all {|transaction| transaction.customer == customer }
    end

    def self.all_by_product (product)
      @@transactions.find_all {|transaction| transaction.product == product }
    end

    private

    def add_id
      @id = @@id
      @@id += @@id
    end

    def check_stock(product)
      unless product.in_stock?
        raise OutOfStockError, "'#{product.title}' is out of stock. (OutOfStockError)"   
      end
    end

end
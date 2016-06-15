# lib/customer.rb

class Customer
	attr_reader :name
  @@customers = []
  	
  	def initialize(options={})
  		@name = options[:name]
  		add_to_customers
  	end

    def self.all 
      @@customers
    end

    def self.find_by_name(name)
      @@customers.find {|customer| customer.name == name }
    end

    def add_to_customers

      if @@customers.any? { |customer| customer.name == name  } 
        raise DuplicateCustomerError, "'#{name}' already exists. (DuplicateCustomerError)"   
      else
        @@customers << self
      end

    end


end
# lib/product.rb

class Product
	attr_reader :title, :price, :stock

	@@products = []
  	
  	def initialize(options={})
  		@title = options[:title]
  		@price = options[:price]
  		@stock = options[:stock]

  		add_to_products
  	end

  	def self.all 
  		@@products
  	end

  	def add_to_products

  		if @@products.any? { |product| product.title == title  } 
  			raise DuplicateProductError, "'#{title}' already exists. (DuplicateProductError)"		
  		else
  			@@products << self
  		end

  	end

  	def self.find_by_title(title)
  		@@products.find {|product| product.title == title }
  	end

  	def in_stock?
  		stock > 0 ? true : false
  	end

  	def self.in_stock
  		@@products.find_all {|product| product.stock > 0 }
  	end

  	def reduce_stock
  		@stock = @stock - 1
  	end

end
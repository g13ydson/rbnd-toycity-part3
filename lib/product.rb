# lib/product.rb

class Product
	attr_reader :title

	@@products = []
  	
  	def initialize(options={})
  		@title = options[:title]
  		add_to_products
  	end

  	def self.all 
  		@@products
  	end

  	def add_to_products
		contains = false
  		@@products.each do |product|
  			if product.title == title 
  				contains = true
  			end
  		end

  		unless contains
  			@@products << self
  		else
  			raise DuplicateProductError, "'#{@title}' already exists. (DuplicateProductError)"		
  		end

  	end


end
class Product
	attr_reader :title, :price
	attr_writer :brand
	attr_accessor :stock

	@@products = []

	def initialize options={}
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@brand ||= options[:brand]
		add_to_products
	end	

	def self.all
		@@products
	end	

	def brand
		if @brand == nil
			puts "Brand info has not yet been set!"
		else
			@brand
		end
	end

	def in_stock?
		@stock > 0
	end

	def self.in_stock
		@@products.select {|product_item| product_item.in_stock?}
	end


	def self.find_by_title txt
		@@products.detect {|find| find.title == txt}
	end

	private

	def add_to_products
		if @@products.map{|product| product.title}.include? @title
			raise DuplicateProductError, "'#{@title}' already exists."	
		else
			@@products << self
		end	
	end	
end	


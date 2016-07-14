class Product
	attr_reader :title, :price
	attr_accessor :stock

	@@products = []

	def initialize options={}
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end	

	def self.all
		@@products
	end	

	def in_stock?
		if @stock > 0
			return true
		else
			return false
		end
	end

	def self.in_stock
		@@products.select {|product_item| product_item.in_stock? == true}
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


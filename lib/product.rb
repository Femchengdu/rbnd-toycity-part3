class Product
	attr_reader :title

	@@products = []

	def initialize options={}
		@title = options[:title]
		add_to_products
	end	

	def self.all
		@@products
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


class Customer
	@@customers = []
	attr_reader :name

	def initialize options={}
		@name = options[:name]
		add_customer
	end

	def self.all
		@@customers
	end

	def self.find_by_name txt
		@@customers.detect{|customer| customer.name == txt}
	end


	def purchase product
		if product.stock == 0
			raise OutOfStockError, "'#{product.title}' is out of stock."
		else
			Transaction.new self, product
		end
	end

	private

	def add_customer
		if @@customers.map{|customer| customer.name}.include? @name
			raise DuplicateCustomerError, "'#{@name}' already exists."
		else
			@@customers << self
		end
	end


end
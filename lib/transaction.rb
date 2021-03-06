class Transaction
	attr_reader :id, :product, :customer
	@@id = 0
	@@transactions = []

	def initialize customer, product
		if product.stock == 0
			raise OutOfStockError, "'#{product.title}' is out of stock."
		else
			@@id += 1
			@id = @@id
			@product = product
			@customer = customer
			remove_stock product
			add_transaction
		end
	end

	def self.all
		@@transactions
	end

	def self.find id
		@@transactions.detect{|transaction| transaction.id == id}
	end
	
	private

	def remove_stock product
		product.stock -= 1
	end

	def add_transaction
		@@transactions << self
	end
end
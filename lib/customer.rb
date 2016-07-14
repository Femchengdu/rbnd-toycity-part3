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

	private

	def add_customer
		if @@customers.map{|customer| customer.name}.include? @name
			raise DuplicateCustomerError, "'#{@name}' already exists."
		else
			@@customers << self
		end
	end


end
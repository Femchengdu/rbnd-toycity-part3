class Customer
	@@customers = []
	attr_reader :name

	def initialize options={}
		@name = options[:name]
		@email ||= options[:email]
		add_customer
	end

	def email
		if @email == nil
			puts "No email available for '#{@name}'!"
		else
			@email
		end
	end

	def self.all
		@@customers
	end

	def self.find_by_name txt
		@@customers.detect{|customer| customer.name == txt}
	end


	def purchase product
		Transaction.new self, product
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
class Employee

		attr_accessor :classification, :schedule, :payment_method
		attr_reader :id, :name, :address

		def initialize(id, name, address)
				@id = id
				@name = name
				@address = address
		end

end

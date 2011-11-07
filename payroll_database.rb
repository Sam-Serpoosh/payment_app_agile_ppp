class PayrollDataBase

		def self.add_emp(emp_id, emp)
				@employees = Hash.new if @employees.nil?

				@employees[emp_id] = emp
		end

		def self.get_employee(emp_id)
				@employees[emp_id]
		end

		def self.clear
				@employees.clear
		end

end

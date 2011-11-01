class PayrollDataBase

		def self.add_emp(emp_id, emp)
				@employees = Hash.new if @employees.nil? or @employees.count == 0

				@employees[emp_id] = emp
		end

		def self.get_employee(emp_id)
				@employees[emp_id]
		end

end

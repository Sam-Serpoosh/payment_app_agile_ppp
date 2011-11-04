require '../../payment_app_agile_ppp/employee'
require '../payroll_database'
require '../payment_methods/hold_method'

class AddEmployee

		attr_accessor :specific_add_employee_command

		def initialize(emp_id, emp_name, emp_address)
				@emp_id = emp_id
				@emp_name = emp_name
				@emp_address = emp_address
		end

		def execute
				emp = Employee.new(@emp_id, @emp_name, @emp_address)
				emp.schedule = @specific_add_employee_command.get_schedule
				emp.classification = @specific_add_employee_command.get_classification
				emp.payment_method = HoldMethod.new  #default method style
				PayrollDataBase.add_emp(@emp_id, emp)
		end

end

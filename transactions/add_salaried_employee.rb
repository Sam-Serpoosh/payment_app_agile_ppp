require '../transactions/add_employee'
require '../employee'
require '../payroll_database'
require '../classifications/salaried_classification'
require '../schedules/monthly_schedule'

class AddSalariedEmployee < AddEmployee

		def initialize(emp_id, emp_name, emp_address, salary)
				super(emp_id, emp_name, emp_address)
				@salary = salary
		end

		def get_classification
				SalariedClassification.new(@salary)
		end

		def get_schedule
				MonthlySchedule.new
		end

end

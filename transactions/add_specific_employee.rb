require '../transactions/add_employee'
require '../employee'
require '../payroll_database'
require '../classifications/salaried_classification'
require '../classifications/hourly_classification'
require '../schedules/monthly_schedule'
require '../schedules/weekly_schedule'

class AddSalariedEmployee

		def initialize(emp_id, emp_name, emp_address, salary)
				@add_employee_command = AddEmployee.new(emp_id, emp_name, emp_address)
				@add_employee_command.specific_add_employee_command = self
				@salary = salary
		end

		def execute
				@add_employee_command.execute
		end

		def get_classification
				SalariedClassification.new(@salary)
		end

		def get_schedule
				MonthlySchedule.new
		end

end


class AddHourlyEmployee

		def initialize(emp_id, emp_name, emp_address, hourly_rate)
				@add_employee_transaction = AddEmployee.new(emp_id, emp_name, emp_address)
				@add_employee_transaction.specific_add_employee_command = self
				@hourly_rate = hourly_rate
		end

		def execute
				@add_employee_transaction.execute
		end

		def get_classification
				HourlyClassification.new(@hourly_rate)
		end

		def get_schedule
				WeeklySchedule.new
		end

end

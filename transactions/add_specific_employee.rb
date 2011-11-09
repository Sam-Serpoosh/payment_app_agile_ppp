require '../transactions/add_employee'
require '../employee'
require '../payroll_database'
require '../classifications/salaried_classification'
require '../classifications/hourly_classification'
require '../classifications/commissioned_classification'
require '../schedules/monthly_schedule'
require '../schedules/weekly_schedule'
require '../schedules/biweekly_schedule'

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


class AddHourlyEmployee < AddEmployee 

		def initialize(emp_id, emp_name, emp_address, hourly_rate)
				super(emp_id, emp_name, emp_address)
				@hourly_rate = hourly_rate
		end

		def get_classification
				HourlyClassification.new(@hourly_rate)
		end

		def get_schedule
				WeeklySchedule.new
		end

end

class AddCommissionedEmployee < AddEmployee

		def initialize(emp_id, emp_name, emp_address, salary, commission_rate)
				super(emp_id, emp_name, emp_address)
				@salary = salary
				@commission_rate = commission_rate
		end

		def get_classification
				CommissionedClassification.new(@salary, @commission_rate)
		end

		def get_schedule
				BiWeeklySchedule.new
		end

end

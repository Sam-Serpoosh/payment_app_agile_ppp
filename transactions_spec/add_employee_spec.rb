require '../transactions/add_specific_employee'
require '../payroll_database'
require 'rspec'


describe "Add Employee" do

		describe "Add Salaried Employee" do

				it "should be able to add a salaried employee to database" do
						emp_id = 1
						add_salaried_employee = AddSalariedEmployee.new(emp_id, "John", "Home", 6000)

						add_salaried_employee.execute
						retrieved_emp = PayrollDataBase.get_employee(emp_id)

						retrieved_emp.nil?.should == false
						retrieved_emp.name.should == "John"
						retrieved_emp.address.should == "Home"
						retrieved_emp.classification.class.should == SalariedClassification 
						retrieved_emp.classification.salary.should == 6000
						retrieved_emp.schedule.class.should == MonthlySchedule
						retrieved_emp.payment_method.class.should == HoldMethod
				end

		end


		describe "Add Hourly Employee" do

				it "should be able to add hourly employee to database" do
						emp_id = 1
						add_hourly_employee = AddHourlyEmployee.new(emp_id, "John", "Home", 30)

						add_hourly_employee.execute
						retrieved_emp = PayrollDataBase.get_employee(emp_id)

						retrieved_emp.classification.class.should == HourlyClassification
						retrieved_emp.classification.hourly_rate.should == 30
						retrieved_emp.schedule.class.should == WeeklySchedule
				end

		end

		describe "Add Commissioned Employee" do
				it "should be able to add commissioned employee to database" do
						emp_id = 1
						add_commissioned_employee = AddCommissionedEmployee.new(emp_id, "John", "Home", 2000, 4)

						add_commissioned_employee.execute
						retrieved_emp = PayrollDataBase.get_employee(emp_id)

						emp_classification  = retrieved_emp.classification
						emp_classification.class.should == CommissionedClassification
						emp_classification.salary.should == 2000
						emp_classification.commission_rate.should == 4
						retrieved_emp.schedule.class.should == BiWeeklySchedule
				end
		end

		after do
				PayrollDataBase.clear
		end

end

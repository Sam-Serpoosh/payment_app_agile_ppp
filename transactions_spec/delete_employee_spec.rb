require '../payroll_database'
require '../transactions/add_specific_employee'
require 'rspec'

describe "Deleteing Employee" do

		it "should be able to delete employee" do
				emp_id = 1
				add_salaried_employee = AddSalariedEmployee.new(emp_id, "John", "Home", 6000)
				add_salaried_employee.execute

				retrieved_emp = PayrollDataBase.get_employee(emp_id)
				retrieved_emp.nil?.should == false

				PayrollDataBase.remove_employee(emp_id)
				retrieved_emp = PayrollDataBase.get_employee(emp_id)
				retrieved_emp.nil?.should == true
		end

		after do
				PayrollDataBase.clear
		end

end

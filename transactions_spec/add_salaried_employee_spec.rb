require '../transactions/add_salaried_employee'
require '../payroll_database'

describe "Add Salaried Employee" do

		it "should be able to add a salaried employee to database" do
				emp_id = 1
				add_salaried_employee = AddSalariedEmployee.new(emp_id, "John", "Home", 1000)
				add_salaried_employee.execute
				retrieved_emp = PayrollDataBase.get_employee(emp_id)

				retrieved_emp.nil?.should == false
				retrieved_emp.name.should == "John"
				retrieved_emp.address.should == "Home"
				retrieved_emp.classification.class.should == SalariedClassification 
				retrieved_emp.classification.salary.should == 1000
		end

end

require './Employees.rb'

class PayrollCalculator

	def initialize(employeesReader)
		@employees = EmployeeFileReader.new(employeesReader)
	end

	def calculatePayrolls
		@employees.employees.each do |employee|
			puts employee.name + " " + employee.payroll().to_s
		end
	end

end

class EmployeeFileReader
 
	def initialize(fileName) 
		@fileName = fileName
		@employeeFactory = EmployeeFactory.new
	end

	def employees

		allEmployees = []
		
		File.open(@fileName, "r") do |f|
  			f.each_line do |line|
  				employee = @employeeFactory.createEmployee(line)
  				puts employee
  				allEmployees.push(employee)
  			end
		end

		return allEmployees
	end

end

class EmployeeFactory

	def initialize
		@notificatorFactory = NotificatorFactory.new
	end

	def createEmployee(line)
		lineParts = line.split(' ')
		employeeType = lineParts[0]
		
		if employeeType == 'Base' 
			return BaseSalaryEmployee.new(lineParts, notificatorFactory.createNotificator(...))
		elsif employeeType == 'Hour'
			return HourEmployee.new(lineParts)
		elsif employeeType == 'BasePlusHour'
			return BasePlusHourEmployee.new(lineParts)
		end
	end

	
end

class NotificatorFactory
	
	def createNotificator(type)

		if type ..... Twitter.new
	end

end

payrolls = PayrollCalculator.new("employees.txt")
payrolls.calculatePayrolls()
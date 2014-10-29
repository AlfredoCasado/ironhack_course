
class Employee

	attr_reader :name

	def initialize(data)
 		@name = data[1]
	end

end

class BasePlusHourEmployee < Employee
	
	def initialize(data)
		super(data)
		@base = data[2]
		@worked_hours = data[3]
		@hour_rate = data[4]
	end

	def payroll
		@base.to_i + @worked_hours.to_i * @hour_rate.to_i
	end

end

class HourEmployee < Employee
	
	def initialize(data)
		super(data)
		@name = data[1]
		@worked_hours = data[2]
		@hour_rate = data[3]
	end

	def payroll
		@worked_hours.to_i * @hour_rate.to_i
	end

end

class BaseSalaryEmployee < Employee
	
	def initialize(data)
		super(data)
		@base = data[2]
	end

	def payroll
		@base.to_i
	end

end
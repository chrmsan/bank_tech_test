class BankLog

	attr_reader :data

	def initialize
		@data = []
	end

	def transfer_in(amount, balance)
		@data << [current_time, amount, 0, balance]
	end

	def transfer_out(amount, balance)
		@data << [current_time, 0, amount, balance]
	end

private

	def current_time
		Time.now.strftime("%d/%m/%Y")
	end

end
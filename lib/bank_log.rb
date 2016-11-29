class BankLog

	attr_reader :logger

	def initialize
		@logger = []
	end

	def transfer_in(amount, balance)
		@logger << [current_time, amount, 0, balance]
	end

	def transfer_out(amount, balance)
		@logger << [current_time, 0, amount, balance]
	end

private

	def current_time
		Time.now.strftime("%d/%m/%Y")
	end

end
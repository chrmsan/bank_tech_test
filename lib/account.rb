class Account

	attr_reader :balance, :logger

	def initialize(balance = 0, logger = [])
		@balance = balance
		@logger = logger
	end
end
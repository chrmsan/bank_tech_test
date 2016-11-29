require 'date'

class Account

	attr_reader :balance, :logger

	def initialize(balance = 0, logger = [])
		@balance = balance
		@logger = logger
	end

	def deposit(amount)
		@balance += amount
		@logger << [current_time, amount, 0, @balance]
	end

	def withdraw(amount)
		fail "Insufficient balance for withdrawal. Current balance is #{@balance}." if insufficient_funds?(amount)
		@balance -= amount
		@logger << [current_time, 0, amount, @balance]
	end

	def bank_statement
		fail "There has yet been any transfers in this account" if @logger.empty?
			puts "date \t\t|| credit || debit || balance "
		@logger.each do |obj|
			puts "#{obj[0]} \t|| #{obj[1]} || #{obj[2]} || #{obj[3]}"
		end
	end

	private

	def current_time
		Time.now.strftime("%d/%m/%Y")
	end

	def insufficient_funds?(amount)
		@balance < amount
	end
end
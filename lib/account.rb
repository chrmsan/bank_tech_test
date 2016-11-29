require 'date'
require_relative 'bank_log'

class Account

	attr_reader :balance, :bank_log

	def initialize(balance = 0, bank_log = BankLog.new)
		@balance = balance
		@bank_log = bank_log
	end

	def deposit(amount)
		@balance += amount
		@bank_log.transfer_in(amount, @balance)
	end

	def withdraw(amount)
		fail "Insufficient balance for withdrawal. Current balance is #{@balance}." if insufficient_funds?(amount)
		@balance -= amount
		@bank_log.transfer_out(amount, @balance)
	end

	def bank_statement
		fail "There has yet been any transfers in this account" if no_transfer
			puts "date \t\t|| credit || debit || balance "
		@bank_log.logger.each do |obj|
			puts "#{obj[0]} \t|| #{obj[1]} || #{obj[2]} || #{obj[3]}"
		end
	end

	private

	def no_transfer
		@bank_log.data.empty?
	end

	def insufficient_funds?(amount)
		@balance < amount
	end
end
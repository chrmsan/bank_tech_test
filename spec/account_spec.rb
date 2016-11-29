require 'spec_helper'

describe Account do
	amount = 500
	amount2 = 300

	describe '#initialize' do
		it 'has a balance of 0' do
			expect(subject.balance).to eq(0)
		end

		it 'savings log is empty' do
			expect(subject.bank_log.logger).to be_empty
		end
	end

	describe '#deposit' do
		it 'can be deposited 500 in the account' do
			expect {subject.deposit(amount)}.to change { subject.balance }.by amount
		end

		it 'it logs a deposit transaction in an array' do
			subject.deposit(amount)
			expect(subject.bank_log.logger.count).to eq(1)
		end
	end

	describe '#withdraw' do
		it 'can withdraw money from the account' do
			subject.deposit(amount)
			expect {subject.withdraw(amount2)}.to change { subject.balance }.by (-amount2)
		end

		it 'raises error when withdrawing from an empty account' do
			expect { subject.withdraw(amount) }.to raise_error "Insufficient balance for withdrawal. Current balance is 0."
		end
	end

end
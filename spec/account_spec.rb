require 'spec_helper'

describe Account do
	amount = 500

	describe '#initialize' do
		it 'has a balance of 0' do
			expect(subject.balance).to eq(0)
		end

		it 'savings log is empty' do
			expect(subject.logger).to be_empty
		end
	end

	describe '#deposit' do
		it 'can be deposited 500 in the account' do
			expect {subject.deposit(amount)}.to change { subject.balance }.by amount
		end

		it 'it logs a deposit transaction in an array' do
			subject.deposit(amount)
			expect(subject.logger.count).to eq(1)
		end
	end

end
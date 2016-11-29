require 'spec_helper'

describe BankLog do

		describe '#initialize' do

		it 'savings log is empty' do
			expect(subject.data).to be_empty
		end

	end
end
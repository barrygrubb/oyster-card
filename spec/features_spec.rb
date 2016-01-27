
require "oystercard"
describe OysterCard do
	subject {described_class.new}
	let(:entry_station) {double :entry_station}

	it 'Records Entry Station on #touch_in and #touch_out' do

		# In order to pay for my journey
		# As a customer
		# I need to know where I've travelled from

		subject.top_up(1)
		subject.touch_in(entry_station)
		expect(subject.entry_station).to eq entry_station
		subject.touch_out
		expect(subject.entry_station).to eq nil

	end


end
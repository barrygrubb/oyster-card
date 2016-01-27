
require "oystercard"
require "station"

describe OysterCard do
	subject {described_class.new}
	let(:entry_station) {double :entry_station}
	let(:exit_station) {double :exit_station}
	it 'Records Entry Station on #touch_in and #touch_out' do

		# In order to pay for my journey
		# As a customer
		# I need to know where I've travelled from

		subject.top_up(1)
		subject.touch_in(entry_station)
		expect(subject.journeys).to include entry_station

	end

		it 'Records all Previous Trips' do

			# In order to know where I have been
			# As a customer
			# I want to see to all my previous trips

			subject.top_up(1)
			subject.touch_in(entry_station)
			subject.touch_out(exit_station)
			expect(subject.journeys).to eq ({entry_station => exit_station})
		end

end

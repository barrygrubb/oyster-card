
require "oystercard"
require "station"
require "journey"

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

	describe Journey do
		let(:entry_station) {double :entry_station}
		let(:exit_station) {double :exit_station}

   it 'charges a penalty fare if you forget to touch out' do
		  # In order to be charged correctly
      # As a customer
		  # I need a penalty charge deducted if I fail to touch in or out

      card = OysterCard.new
			card.top_up(10)
			card.touch_in(entry_station)
			expect{card.touch_in(entry_station)}.to change{card.balance}.by (-6)
	end
end

require 'journey'

describe Journey do

  subject(:journey1) {described_class.new(entry_station)}
  let(:entry_station) {double :entry_station}
  let(:station) {double :station, :name => "Euston", :zone => 1}

  it 'creates a new journey' do
    expect(described_class.new(entry_station)).to be_a(Journey)
  end

  it 'starts a journey' do
    expect(subject.instance_variable_get(:@entry_station)).to eq entry_station
  end

  it 'checks that a new journey stores the entry station' do
    journey = Journey.new(station)
    expect(journey.entry_station).to eq station
  end

  it 'checks that a new journey stores the entry stations zone' do
    journey = Journey.new(station)
    expect(journey.entry_station.zone).to eq 1
  end
end

require 'station'

describe Station do

let(:station) {described_class.new("station1", 1)}

  it 'has the name "station1"' do
    expect(station.name).to eq "station1"
  end

  it 'has the zone 1' do
    expect(station.zone).to eq 1
  end
end

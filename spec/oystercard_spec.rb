require 'oystercard'

describe OysterCard do
	let(:entry_station) {double :entry_station}
	let(:exit_station) { double :exit_station }

	context "card balance" do
	  it 'has a balance of zero' do
	  	expect(subject.balance).to eq(0)
	  end

	  it "can top_up the balance" do
	    expect{subject.top_up(50)}.to change{ subject.balance }.to(50)
	  end

	  it "checks for maximum limit" do
	  	expect{ subject.top_up(100) }.to raise_error "Card limit is #{OysterCard::CARD_LIMIT}"
	  end

	end

	context 'card operation' do
    before(:each) do
      subject.top_up(1)
    end

	    it 'deducts #{OysterCard::MIN_FARE} fare' do
				subject.touch_in(entry_station)
				expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
			end

      it 'touches in at an entry station' do
      	subject.touch_in(entry_station)
        expect(subject.entry_station).to eq entry_station
      end

      it 'forgets entry_station on touch_out' do
      	subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.entry_station).to eq nil
      end

			it 'holds a hash of journeys' do
				expect(subject.journeys).to eq({})
			end
	end

	  it "require a minimum fare of 1" do
      expect{ subject.touch_in(entry_station)}.to raise_error "minimum fare is #{OysterCard::MIN_FARE} pound"
    end

end

class OysterCard
 CARD_LIMIT = 90
 MIN_FARE = 1
 attr_reader :balance, :entry_station

 def initialize
   @balance = 0
 end

 def top_up(value)
 		balance_expected = @balance + value
 		raise "Card limit is #{CARD_LIMIT}" if balance_expected > CARD_LIMIT
   	@balance += value
 end

 def touch_in(entry_station)
  	raise "minimum fare is #{MIN_FARE} pound" if @balance < MIN_FARE
 		@entry_station = entry_station
 end

 def touch_out
 	deduct(MIN_FARE)
	@entry_station = nil
 end

 def in_journey?
 	!!@entry_station
 end

private

 def deduct(value)
   @balance -= value
 end

end

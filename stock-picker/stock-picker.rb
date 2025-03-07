# @problem
#   Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. 
#   It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

# @param price_data [Array] An array of stock price data for each day. 
# @return [Array] An array of the index pair representing the best day to buy and the best day to sell, respectively.

# @example
#   stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12

# @note
#   - You need to buy before you can sell.
#   - Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

# What an ordeal it was figuring this problem out, it had me stuck for days. The code is a disaster to read, but it works. 
# I'm not going to clean it up or document it since this is a small project and I'd rather save such effort for major projects. 
def stock_picker(prices_data)
  # main code
  profit_loss_data = []

  todays_index = 0

  prices_data.length.times do
    todays_price = prices_data[todays_index]
    todays_profit_loss_data = []

    prices_data.each_with_index do |price, price_index|

      if price_index < todays_index
        todays_profit_loss_data << nil
      else
        todays_profit_loss_data << (price - todays_price)
      end

    end

    profit_loss_data << todays_profit_loss_data
    todays_index += 1
  end

  # debugging
  p "Stock price data over #{prices_data.length} days: #{prices_data}"

  j = 1
  for i in profit_loss_data
    p "Sell outcomes if bought on day #{j}: #{i}"
    j += 1
  end

  best_outcome = profit_loss_data.flatten.compact.max
  if best_outcome < 0
    p "Best outcome: $#{best_outcome} loss"
  else
    p "Best outcome: $#{best_outcome} profit"
  end

  #return
  profit_loss_data.each_with_index do |day, day_index|
    if day.include?(best_outcome)
      sell_index = day.find_index(best_outcome)
      p "Therefore, buy on day #{day_index.next} and sell on day #{sell_index.next}. By indexes: #{[day_index, sell_index]}"
      return [day_index, sell_index]
    end
  end

end

# pick a test and run
p stock_picker([17,3,6,9,15,8,6,1,10])
# p stock_picker([25, 32, 18, 28, 2])



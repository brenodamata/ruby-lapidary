# =========================  STOCK PICKER  =========================
# The task of this project was to create a method that takes in an
# array of stock prices, one for each hypothetical day. From there,
# the method should return the best day to buy and the best day to
# sell the stock to maximize return.
# - Stocks need to be bought before they can be sold
# - It is possible that the lowest priced day can be the last day,
# 	and the highest price day could be the first day.

# > stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12

def stock_picker prices
	buy_day  = 0
	sell_day = 0
	max_profit = -1.0/0

	prices.each_with_index do |buy_price, i|
		prices[i+1..-1].each_with_index do |sell_price, j|
			if (sell_price - buy_price > max_profit)
				max_profit = sell_price - buy_price
				buy_day = i
				sell_day = j+i+1
			end
		end
	end

	 return ["buy" => buy_day, "sell" => sell_day, "profit" => max_profit]
end

# Different example
def stock(prices)
  ((0...prices.length).to_a)
    .repeated_permutation(2)
    .select {|start, finish| finish > start}
    .max_by {|start, finish| prices[finish] - prices[start]}
end

p [17,3,6,9,15,8,6,1,10]
puts stock_picker([17,3,6,9,15,8,6,1,10])
puts "===================================="
p [25,2,10,9]
puts stock_picker([25,2,10,9])
puts "===================================="
p [10,12,5,3,20,1,9,20]
puts stock_picker([10,12,5,3,20,1,9,20])
puts "===================================="
p [10,9,8,7,6]
puts stock_picker([10,9,8,7,6])
puts "===================================="
p [18,17,17,16,15]
puts stock_picker([18,17,17,16,15])
# puts "Buy at #{arr["buy".to_i]}"
# Sell at #{arr["sell_day"].to_i} for a profit of #{arr["profit"].to_i}"

# puts "Enter stock prices, one for each hypothetical day, seperated by commas:"
# user_prices = gets.chomp.split(',').map { |price| price.to_i }
# puts stock_picker(user_prices)

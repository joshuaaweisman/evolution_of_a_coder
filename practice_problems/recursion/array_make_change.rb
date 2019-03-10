# In "Practical Ruby Projects," the author includes a couple of chapters involving coin simulations. These simulators are used to explore the possibilities of replacing a certain coin or adding a new coin.
# One interesting subproblem of these simulations is that of making change. For example, if we need to give 39 cents change in the United States (where there are 25, 10, 5, and 1 cent pieces), we can give:
# ruby
#     >> make_change(39)
#     => [25, 10, 1, 1, 1, 1]

def make_change(change_needed, cash_register)
    return [] if change_needed == 0
    
    pile_of_coins = []
    biggest_coin = cash_register[0]
    remaining_balance = change_needed

    until remaining_balance == 0
        remaining_balance = change_needed - pile_of_coins.sum

        if remaining_balance >= biggest_coin
            pile_of_coins << biggest_coin
        else
            pile_of_coins += make_change(remaining_balance, cash_register[1..-1])
        end
    end

    pile_of_coins
end
# make better change

def make_better_change(change_needed, coins)
    options = []
    return options if change_needed == 0

    coins.each do |current_coin|
        if current_coin <= change_needed
            balance = change_needed - current_coin
            possibility = [current_coin] + make_better_change(balance, coins)
            options << possibility if possibility.length > 0
        end
    end

    options.sort_by!(&:length)
    options[0]
end
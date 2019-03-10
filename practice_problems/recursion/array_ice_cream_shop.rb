# Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    flavors[0] == favorite ? true : ice_cream_shop(flavors[1..-1], favorite)
end
require "pry-byebug"

def pet_shop_name(pets_shop_hash)
  return pets_shop_hash[:name]
end

def total_cash(pets_shop_hash)
  return pets_shop_hash[:admin][:total_cash]
end

def add_or_remove_cash(pets_shop_hash, cash)
  pets_shop_hash[:admin][:total_cash] += cash
end

def pets_sold(pets_shop_hash)
  return pets_shop_hash[:admin][:pets_sold]
end

def increase_pets_sold(pets_shop_hash, increment)
  pets_shop_hash[:admin][:pets_sold] += increment
end

def stock_count(pets_shop_hash)
  return pets_shop_hash[:pets].length
end

def pets_by_breed(pets_shop_hash, select)
  selected_pets = []
  for pets in pets_shop_hash[:pets]
    selected_pets.push(pets[:name]) if pets[:breed] == select
  end
  return selected_pets
end

def find_pet_by_name(pets_shop_hash, name)
  for pet in pets_shop_hash[:pets]
    return pet if pet[:name] == name
  end
  return nil
end

def remove_pet_by_name(pets_shop_hash, name)
  for pet in pets_shop_hash[:pets]
    pets_shop_hash[:pets].delete(pet) if pet[:name] == name
  end
end

def add_pet_to_stock(pets_shop_hash, new_pet)
  pets_shop_hash[:pets].push(new_pet)
end

def customer_pet_count(customer_array)
  return customer_array[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet)
  return true if customer[:cash]>=pet[:price]
  return false
end

def sell_pet_to_customer(pets_shop_hash, pet, customer)
  if pet != nil && customer_can_afford_pet(customer,pet)
    customer[:pets].push(pet) 
    increase_pets_sold(pets_shop_hash, 1) 
    add_or_remove_cash(pets_shop_hash, pet[:price])
  end
end

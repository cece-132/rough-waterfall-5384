class Item < ApplicationRecord
  has_many :customers

  # def total_cost
  #   binding.pry
  # end

  #I wanted to do something like this but I still need more
  #practice to feel confident in doing it in a timed test scenario
end
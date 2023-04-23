class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product


  enum production_status: { cannot_start: 0, unfinished: 1, production: 2, completion: 3 }

end

class Quote < ApplicationRecord
  def self.search(search)
  where("quote ILIKE ? OR author ILIKE ? OR category ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end

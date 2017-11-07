class Quote < ApplicationRecord
  def self.search(search)
  where("quote ILIKE ? OR author ILIKE ? OR category ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def next
    Quote.where("id > ?", id).order("id ASC").first || Quote.first
  end

  def previous
    Quote.where("id < ?", id).order("id DESC").first || Quote.last
  end
end

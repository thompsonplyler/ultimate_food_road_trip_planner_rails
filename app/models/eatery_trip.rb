require 'pry'
class EateryTrip < ApplicationRecord
  belongs_to :trip 
  belongs_to :eatery

  scope :visited, -> { where("visit_date < ?",Time.now ) } 

  def eatery_attributes=(attributes)
    binding.pry
    eatery = Eatery.find_or_create_by(attributes)
    self.eatery_id = eatery.id
  end

  def visit_date_exists
    self.visit_date.present?
  end

  def review_exists
    self.review.present?
  end

  def format_date
    self.visit_date.strftime("%B %d, %Y")
  end

end

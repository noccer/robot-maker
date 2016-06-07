class Suburb < ActiveRecord::Base
  validates :suburb_name, presence: true
  validates :postcode, presence: true
  validates :state, presence: true
  belongs_to :robot
end

def self.search(term)
  where('ILIKE(postcode) LIKE :term OR ILIKE(suburb_name) LIKE :term', term: "%#{term.downcase}%")
end

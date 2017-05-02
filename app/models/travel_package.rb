class TravelPackage < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  
  def TravelPackage.search(tag)
    skLIKE = "ILIKE"
    if Rails.env.development? # using SQLITE3 in development...
      skLIKE = "LIKE"
    end
    q = "%#{tag}%"
    where("tags #{skLIKE} ? or name #{skLIKE} ? or location #{skLIKE} ?", q, q, q)
  end
  
  def TravelPackage.allForID(theID)
    where(user_id: theID)
  end
end

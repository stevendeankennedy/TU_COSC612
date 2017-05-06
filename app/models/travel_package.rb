class TravelPackage < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  
  def TravelPackage.search(tag)
    skLIKE = "ILIKE" # PSQL style
    if Rails.env.development? # using SQLITE3 in development...
      skLIKE = "LIKE"
    end
    q = "%#{tag}%"
    where("(tags #{skLIKE} ? or name #{skLIKE} ? or location #{skLIKE} ? or airport #{skLIKE} ?) and active = ?", q, q, q, q, true)
  end
  
  def TravelPackage.allForID(theID)
    where(user_id: theID, active: true)
  end
end

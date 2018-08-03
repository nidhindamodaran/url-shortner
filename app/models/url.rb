class Url < ActiveRecord::Base
  validates :url, presence: true

  def details_json
    as_json(
      only: [:id, :url, :code, :visits ]
    )
  end
end
class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :publicly_available, -> { where("private = ? OR private IS NULL", false)}
end

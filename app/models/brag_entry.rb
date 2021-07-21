class BragEntry < ApplicationRecord
  belongs_to :user
  scope :default, -> { where(user: current_user) }
end

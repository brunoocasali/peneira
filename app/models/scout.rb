class Scout < ActiveRecord::Base
  belongs_to :user
  belongs_to :actual_club
end

class Athlete < ActiveRecord::Base
  belongs_to :user
  belongs_to :foot
  belongs_to :position
end

class Registration < ActiveRecord::Base
  belongs_to :team
  belongs_to :game
end

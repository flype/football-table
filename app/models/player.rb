# == Schema Information
# Schema version: 20100403105522
#
# Table name: players
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Player < ActiveRecord::Base
  has_many :matchs
end

class Project < ActiveRecord::Base
  has_many :investments
  belongs_to :user
  belongs_to :charity
end

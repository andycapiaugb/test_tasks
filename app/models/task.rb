class Task < ActiveRecord::Base
  has_many :steps
  has_many :taskrequests
  has_many :users, :through => :taskrequests
end

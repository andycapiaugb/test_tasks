class Step < ActiveRecord::Base
  belongs_to :task
  has_many :parameters
  belongs_to :executer, :class_name => "User"
  has_many :taskrequests_steps
  has_many :taskrequests, :through => :taskrequests_steps
end

class AbsenceRequest < ActiveRecord::Base
  belongs_to :taskrequests_step
  has_one :irregular_performance_approval
end

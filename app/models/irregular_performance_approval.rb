class IrregularPerformanceApproval < ActiveRecord::Base
  belongs_to :taskrequests_step
  belongs_to :irregular_performance_request
  belongs_to :absence_request
end

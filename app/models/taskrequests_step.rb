class TaskrequestsStep < ActiveRecord::Base
  belongs_to :taskrequest
  belongs_to :step
  has_many :irregular_performance_requests
  has_many :irregular_performance_approvals
  has_many :new_employee_requests
  has_many :absence_requests

  def self.set_next_step_as_current(current_id)
      active_step = self.find(current_id)
      active_step.current = false
      active_step.save
    if active_step.has_next_step?
      next_step = self.where("id > ?", current_id).order("id").limit(1).first
      next_step.current=true
      next_step.save
      return next_step
    else
      return nil
    end
  end

  def has_next_step?
    TaskrequestsStep.where("id > ?", self.id).order("id").limit(1).count != 0
  end

  def self.has_previous_step?(current_id)
    self.where("id < ?", current_id).order("id").limit(1).count != 0
  end

  def self.get_previous_steps(taskrequest_id, current_id)
    self.where("id < ? AND taskrequest_id = ?", current_id, taskrequest_id).order("id ASC")
  end

  def executer
    if not self.step.executer
      self.taskrequest.user.login if self.step.self
    else
      self.step.executer.login
    end
  end

  def requester
    self.taskrequest.user.login
  end
end

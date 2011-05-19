class Taskrequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  has_many :taskrequests_steps
  has_many :steps, :through => :taskrequests_steps

  def get_next_step(current_user)
    if self.steps.nil?
      return nil
    end

    taskrequest_step = self.get_current(current_user)
  end

  def get_current(current_user)
    self.ensure_current #if there was no need to place the first step as current, so if this process was already processed

    TaskrequestsStep.set_next_step_as_current(self.current_step.id, current_user) if ((self.current_step_has_saved_results?) && ((self.current_step.has_next_step? || self.finished?))) #if nothing is saved, then skip this; if something is saved in current step, then this step is finished and it should proceed to the next

    #now get the step, if any at all, that's devoted to this user
    if not self.finished?
      self.taskrequests_steps.todos(current_user.id).limit(1).first
    else
      return nil
    end
  end

  def ensure_current
    if self.taskrequests_steps.where("current = ?", true).count == 0 #If no current steps
      step = self.taskrequests_steps.first #then take the first step in the request
      step.current = true #and set this as current step
      if step.step.superior?
        step.executer = current_user.superior
      end
      step.save #save it
    else
      return false
    end    
  end

  def get_previous_steps(current_step_id)
    self.taskrequests_steps.where("id < ?", current_step_id).order("id ASC")
  end

  def current_steps
    self.taskrequests_steps.where("current = ?", true)
  end

  def current_step
    self.current_steps.last
  end

  def current_step_saved_results
    if self.current_step
      self.current_steps.joins(self.current_step.step.name.pluralize.intern)
    else
      return []
    end
  end

  def current_step_has_saved_results?
    self.current_step_saved_results.count != 0
  end

  def get_current_step_count
    unless self.finished?
      current_step_id = self.taskrequests_steps.where("current = ?", true)
      self.get_previous_steps(current_step_id).count
    else
      return self.total_steps_count
    end
  end

  def total_steps_count
    self.taskrequests_steps.count
  end

  def current_step_executer
    if not self.current_step.executer
      if not self.current_step.step.executer
        self.user.login if self.current_step.step.self
      else
          self.current_step.step.executer.login
      end
    else
      self.current_step.executer.login
    end
  end

  def finished?
    if self.current_step
      self.current_step_has_saved_results? && (not self.current_step.has_next_step?)
    else
      return true
    end
  end
end

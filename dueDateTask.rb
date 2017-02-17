require_relative 'task'
require_relative 'taskList'

class DueDateTask < Task
  def initialize(title, description)
    super
  end

  # set the due date
  def set_due_date(month,day,year)
    @due_date = Date.new(year, month, day)
  end

  # get due_date
  def due_date
    @due_date
  end

  # get the overall status of a task
  def print_status
    if @status == "incomplete"
      "Type: #{self.class.to_s} / Title: #{@title} / Description: #{@description} / Due Date: #{self.due_date.strftime('%m-%d-%Y')}"
    else
      "Type: #{self.class.to_s} / Title: #{@title} / Description: #{@description} / Status: #{@status}"
    end
  end
end

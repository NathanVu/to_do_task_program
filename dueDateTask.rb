require_relative 'task'

class DueDateTask < Task
  # initial setting of the duedatetask
  def initialize(title, description)
    super
  end
  # method to set the due date
  def set_due_date(month,day,year)
    @due_date = Date.new(year, month, day)
  end
  # method to get due_date
  def due_date
    @due_date
  end
end

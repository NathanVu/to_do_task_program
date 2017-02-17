require_relative 'taskList'

class Task
  # when creatring a task we must set a title and description and status of incomplete (setters)
  def initialize(title, description)
    @title = title
    @description = description
    @status = "incomplete"
  end

  # get title (getter)
  def title
    @title
  end

  # get description (getter)
  def description
    @description
  end

  # get status (getter)
  def status
    @status
  end

  # change task status to finished
  def done
    @status = "finished"
  end

  # get the overall status of a task
  def print_status
    if @status == "incomplete"
      "Type: #{self.class.to_s} / Title: #{@title} / Description: #{@description}"
    else
      "Type: #{self.class.to_s} / Title: #{@title} / Description: #{@description} / Status: #{@status}"
    end
  end
end

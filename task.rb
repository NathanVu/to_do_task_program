require_relative 'taskList'

class Task < TaskList
  # when creatring a task we must set a title and description and status of incomplete (setters)
  def initialize(title, description)
    @title = title
    @description = description
    @status = "incomplete"
  end
  # method to get title (getter)
  def title
    @title
  end
  # method to get description (getter)
  def description
    @description
  end
  # method to get status (getter)
  def status
    @status
  end
  # method change task status to finished
  def done
    @status = "finished"
  end
  # method to print the overall status of a task
  def print_status
    if @status == "incomplete"
      "Title: #{@title} / Description: #{@description}"
    else
      "Title: #{@title} / Description: #{@description} / Status: #{@status}"
    end
  end
  # # method to add a task to a task list
  # def add_to_list(list)
  #   list <<
  # end
end

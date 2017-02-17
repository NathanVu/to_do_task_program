require_relative 'task'
require_relative 'dueDateTask'

class TaskList
  def initialize
    @task_list = []
    @due_date_task_list = []

    # counter for the get_finished & get_incomplete methods
    @counter = 0

    # empty array for creating the completed task list
    @completed_list = []

    # variable for assigning tasks during the get_finished & get_incomplete methods
    @task = 0

    # combined task list to include bother task and due date tasks
    @combined_list = []
  end

  # get task list
  def task_list
    @task_list
  end

  # get due date task list (getter)
  def due_date_task_list
    @due_date_task_list
  end

  # get completed_list
  def completed_list
    @completed_list
  end

  # add a task to the task list
  def add_task(task)
    @task_list << task
    @combined_list = @due_date_task_list + @task_list
  end

  # add dueDateTask to the due date task list
  def add_due_date_task(duedatetask)
    @due_date_task_list << duedatetask
    @combined_list = @due_date_task_list + @task_list
  end

  # combine standard task list with due date task list
  def combine_lists
    @combined_list = @due_date_task_list + @task_list
  end

  # get completed list using .select
  def get_finished
    @task_list.select { |task| task.status == "finished" }
  end
  # get incomplete list using .select
  def get_incomplete
    @task_list.select { |task| task.status == "incomplete" }
  end

  # get items that are not completed and due today
  def due_today
    @due_date_task_list.select { |duedatetask| (duedatetask.status == "incomplete") && (duedatetask.due_date == Date.today) }
  end

  # get items that are not complete in order of due date
  def sort_due_date_incomplete
    @due_date_task_list.sort! { |duedatetask1, duedatetask2| duedatetask1.due_date <=> duedatetask2.due_date }
    @due_date_task_list.select { |duedatetask| (duedatetask.status == "incomplete") }
  end

  # get list with tasks with and without due dates in order of due date then those without due dates.
  def sort_all_incomplete
    @due_date_task_list.sort! { |duedatetask1, duedatetask2| duedatetask1.due_date <=> duedatetask2.due_date }
    @combined_list = @due_date_task_list + @task_list
    @combined_list.select { |duedatetask| (duedatetask.status == "incomplete") }
  end
end





# get the completed items in a task list
# def get_finished
#   # resets the completed list array to be empty, so new entries do not repeat themselves in the array.
#   @completed_list = []
#   # calls a loop that is set to perform an if statement below set to do it as many times as there are items in the task list array.
#   @task_list.length.times do
#     # assigns the task variable to equal the item position equivalent to the counter in the task list array.
#     @task = @task_list[@counter]
#     # if the task has a status of finished
#     if @task.status == "finished"
#       # add the task to the completed list array
#       @completed_list << @task
#     end
#     # increase the counter by 1, so that way the next time through the times do loop will factor in the next position within the task list array.
#     @counter += 1
#   end
#   # reset the counter to 0, so that way if the function is called again it performs the do loop starting from the 0 position of the task list array
#   @counter = 0
#   # reset the task variable so that if the function is called again, it is able to be reassigned
#   @task = 0
#   # displays the completed list array.
#   @completed_list
# end

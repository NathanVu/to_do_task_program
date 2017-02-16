# require_relative 'task'

class TaskList
  def initialize
    @task_list = []
    # counter for the get_finished & get_incomplete methods
    @counter = 0
    # empty array for creating the completed task list
    @completed_list = []
    # variable for assigning tasks during the get_finished & get_incomplete methods
    @task = 0
  end
  # method to get task list
  def task_list
    @task_list
  end
  # method to get completed_list
  def completed_list
    @completed_list
  end
  # method to add a task to the list
  def add(task)
    @task_list << task
  end
  # method to get the completed items in a task list
  def get_finished
    # resets the completed list array to be empty, so new entries do not repeat themselves in the array.
    @completed_list = []
    # calls a loop that is set to perform an if statement below set to do it as many times as there are items in the task list array.
    @task_list.length.times do
      # assigns the task variable to equal the item position equivalent to the counter in the task list array.
      @task = @task_list[@counter]
      # if the task has a status of finished
      if @task.status == "finished"
        # add the task to the completed list array
        @completed_list << @task
      end
      # increase the counter by 1, so that way the next time through the times do loop will factor in the next position within the task list array.
      @counter += 1
    end
    # reset the counter to 0, so that way if the function is called again it performs the do loop starting from the 0 position of the task list array
    @counter = 0
    # reset the task variable so that if the function is called again, it is able to be reassigned
    @task = 0
    # displays the completed list array.
    @completed_list
  end
  # method to get completed list using .select
  def get_finished2
    @task_list.select { |task| task.status == "finished" }
  end
  # method to get incomplete list using .select
  def get_incomplete
    @task_list.select { |task| task.status == "incomplete" }
  end
end

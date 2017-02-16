require 'rspec'
require_relative 'taskList'
require_relative 'task'

describe TaskList do
  # Test for creating a task list without an error
  it "has to be able to be made without error" do
    expect{TaskList.new}.to_not raise_error
  end
  # Story: As a developer, I can add all of my Tasks to a TaskList.
  it "has to be able to have tasks added to it" do
    list = TaskList.new
    expect(list.add("task1")).to eq(["task1"])
    expect(list.add("task2")).to eq(["task1", "task2"])
  end
  # Story: As a developer with a TaskList, I can get the completed items.
  # tests the .get_finished function
  it "has to be able to show only completed items" do
    list = TaskList.new
    task1 = Task.new("task1", "This is task1")
    task2 = Task.new("task2", "This is task2")
    task1.done
    list.add(task1)
    list.add(task2)
    expect(list.get_finished).to include(task1)
  end
  # Story: As a developer with a TaskList, I can get the completed items.
  # tests the .get_finished2 function
  it "has to be able to show only completed items" do
    list = TaskList.new
    task1 = Task.new("task1", "This is task1")
    task2 = Task.new("task2", "This is task2")
    task1.done
    list.add(task1)
    list.add(task2)
    expect(list.get_finished2).to include(task1)
  end
  # Story: As a developer with a TaskList, I can get the incomplete items.
  it "has to be able to show only incompleted items" do
    list = TaskList.new
    task1 = Task.new("task1", "This is task1")
    task2 = Task.new("task2", "This is task2")
    task1.done
    list.add(task1)
    list.add(task2)
    expect(list.get_incomplete).to include(task2)
  end
end

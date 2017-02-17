require 'rspec'
require_relative 'taskList'
require_relative 'task'
require_relative 'dueDateTask'

describe TaskList do
  # Test for creating a task list without an error
  it "has to be able to be made without error" do
    expect{TaskList.new}.to_not raise_error
  end

  # Story: As a developer, I can add all of my Tasks to a TaskList.
  it "has to be able to have tasks added to it" do
    list = TaskList.new
    expect(list.add_task("task1")).to eq(["task1"])
    expect(list.add_task("task2")).to eq(["task1", "task2"])
  end

  # Story: As a developer with a TaskList, I can get the completed items. # tests the .get_finished function
  it "has to be able to show only completed items" do
    list = TaskList.new
    task1 = Task.new("task1", "This is task1")
    task2 = Task.new("task2", "This is task2")
    task1.done
    list.add_task(task1)
    list.add_task(task2)
    expect(list.get_finished).to include(task1)
  end

  # Story: As a developer with a TaskList, I can get the incomplete items.
  it "has to be able to show only incompleted items" do
    list = TaskList.new
    task1 = Task.new("task1", "This is task1")
    task2 = Task.new("task2", "This is task2")
    task1.done
    list.add_task(task1)
    list.add_task(task2)
    expect(list.get_incomplete).to include(task2)
  end

  # Story: As a developer, I can add items with due dates to my TaskList.
  it "has to be able to add items to the due date task" do
    list = TaskList.new
    expect(list.add_due_date_task("duedatetask1")).to eq(["duedatetask1"])
    expect(list.add_due_date_task("duedatetask2")).to eq(["duedatetask1", "duedatetask2"])
  end

  # Test to see if combined list works
  it "has to be able to make a combined list" do
    list = TaskList.new
    list.add_task("task1")
    list.add_task("task2")
    list.add_due_date_task("duedatetask1")
    list.add_due_date_task("duedatetask2")
    expect(list.combine_lists).to eq(["duedatetask1", "duedatetask2","task1", "task2"])
  end

  # Story: As a developer with a TaskList, I can list all the not completed items that are due today.
  it "has to be able to list all the not completed items that are due today" do
    list = TaskList.new
    ddt1 = DueDateTask.new("DDT1", "ddt1")
    ddt1.set_due_date(2,17,2017)
    ddt2 = DueDateTask.new("DDT2", "ddt2")
    ddt2.set_due_date(3,10,2017)
    list.add_due_date_task(ddt1)
    list.add_due_date_task(ddt2)
    expect(list.due_today).to include(ddt1)
  end

  # Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
  it "has to be able to list all the not completed items in order of due date" do
    list = TaskList.new
    ddt1 = DueDateTask.new("DDT1", "ddt1")
    ddt1.set_due_date(2,17,2017)
    ddt1.done
    ddt2 = DueDateTask.new("DDT2", "ddt2")
    ddt2.set_due_date(3,10,2017)
    ddt3 = DueDateTask.new("DDT3", "ddt3")
    ddt3.set_due_date(1,2,2017)
    list.add_due_date_task(ddt1)
    list.add_due_date_task(ddt2)
    list.add_due_date_task(ddt3)
    expect(list.sort_due_date_incomplete).to include(ddt3, ddt2)
  end

  # Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
  it "has to be able to list all the tasks with and without due dates not completed in order of due date then items without due date" do
    list = TaskList.new
    ddt1 = DueDateTask.new("DDT1", "ddt1")
    ddt1.set_due_date(2,17,2017)
    ddt2 = DueDateTask.new("DDT2", "ddt2")
    ddt2.set_due_date(3,10,2017)
    ddt3 = DueDateTask.new("DDT3", "ddt3")
    ddt3.set_due_date(1,2,2017)
    task1 = Task.new("task1", "task1")
    task2 = Task.new("task2", "task2")
    task3 = Task.new("task3", "task3")
    list.add_due_date_task(ddt1)
    list.add_due_date_task(ddt2)
    list.add_due_date_task(ddt3)
    list.add_task(task1)
    list.add_task(task2)
    list.add_task(task3)
    ddt1.done
    task2.done
    expect(list.sort_all_incomplete).to include(ddt3, ddt2, task1, task3)
  end
end

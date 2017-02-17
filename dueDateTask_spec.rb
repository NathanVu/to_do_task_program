require 'rspec'
require_relative 'dueDateTask'
require_relative 'task'

describe DueDateTask do
  # Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
  it "has to be created with no errors" do
    expect{ DueDateTask.new("title", "description") }.to_not raise_error
  end

  # Test for setting due date
  it "has to set a due date" do
    duedatetask = DueDateTask.new("title", "description")
    duedatetask.set_due_date(2,16,2017)
    expect(duedatetask.due_date.year).to eq(2017)
    expect(duedatetask.due_date.month).to eq(2)
    expect(duedatetask.due_date.day).to eq(16)
  end

  # Story: As a developer, I can print an item with a due date with labels and values.
  it "has to be able to print with lables and values" do
    duedatetask = DueDateTask.new("title", "description")
    duedatetask.set_due_date(2,16,2017)
    expect(duedatetask.print_status).to eq("Type: DueDateTask / Title: title / Description: description / Due Date: 02-16-2017")
    expect(duedatetask.done).to eq("finished")
    expect(duedatetask.print_status).to eq("Type: DueDateTask / Title: title / Description: description / Status: finished")
  end

end

require 'rspec'
require_relative 'dueDateTask'
require_relative 'task'

describe DueDateTask do
  # Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
  it "has to be created with no errors" do
    expect{ DueDateTask.new("title", "description") }.to_not raise_error
  end
  it "has to set a due date" do
    duedatetask = DueDateTask.new("title", "description")
    duedatetask.set_due_date(2,16,2017)
    expect(duedatetask.due_date.year).to eq(2017)
    expect(duedatetask.due_date.month).to eq(2)
    expect(duedatetask.due_date.day).to eq(16)
  end
end

require 'rspec'
require_relative 'task'

describe Task do
  # Story: As a developer, I can create a Task.
  it "has to be able to be made without error" do
    expect{Task.new("title", "description")}.to_not raise_error
  end

  # Story: As a developer, I can give a Task a title and retrieve it.
  it "has to have a title that we can retrieve" do
    task = Task.new("title", "description")
    expect(task.title).to eq("title")
  end

  # Story: As a developer, I can give a Task a description and retrieve it.
  it "has to have a description we can retrieve" do
    task = Task.new("title", "description")
    expect(task.description).to eq("description")
  end

  # Story: As a developer, I can mark a Task done.
  it "has to be able to mark a task done" do
    task = Task.new("title", "description")
    expect(task.status).to eq("incomplete")
    expect(task.done).to eq("finished")
    expect(task.status).to eq("finished")
  end

  # Story: As a developer, when I print a Task that is done, its status is shown.
  it "it has to be able to show the status of a printed task that is done" do
    task = Task.new("title", "description")
    expect(task.print_status).to eq("Type: Task / Title: title / Description: description")
    expect(task.done).to eq("finished")
    expect(task.print_status).to eq("Type: Task / Title: title / Description: description / Status: finished")
  end
end

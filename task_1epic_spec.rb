require 'rspec'
require_relative 'task'


# Story: As a developer, I can create a Task.
describe "Task" do
  it "can be created without error" do
    expect{Task.new}.not_to raise_error
  end

# Story: As a developer, I can give a Task a title and retrieve it.
  it "can have a title and be retrieved" do
    task = Task.new
    expect(task.title).to be_a(String)
    expect(task.title).to eq("title")
    task.title="Title1"
    expect(task.title).to eq("Title1")
  end

# Story: As a developer, I can give a Task a description and retrieve it.
  it "can have a description and retrieve it" do
    task = Task.new
    expect(task.description).to be_a(String)
    expect{raise task.update_description(45)}.to raise_error("Must be a string")
  end

# Story: As a developer, I can mark a Task done.
# Story: As a developer, when I print a Task that is done, its status is shown.
  it "can be marked complete" do
    task = Task.new
    expect(task.status).to eq("In progress")
    task.task_complete
    expect(task.status).to eq("Complete")
  end

# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
  it "can be added to a Tasklist" do
    task = Task.new
    tasklist = Tasklist.new
    tasklist.add_task("laundry")
    expect(tasklist.add_task(task)).to include(task)
    expect(tasklist.get_array).to include("laundry")
  end

# Story: As a developer with a TaskList, I can get the completed items.
# Story: As a developer with a TaskList, I can get the incomplete items.
  it "can be sorted by 'in progress' and 'complete'" do
    task1 = Task.new
    task2 = Task.new
    tasklist = Tasklist.new
    # complete_array = Tasklist.new
    # incomplete_array = Tasklist.new
    task1.task_complete
    expect(task1.status).to eq("Complete")
    expect(task2.status).to eq("In progress")
    tasklist.add_task(task1)
    tasklist.add_task(task2)
    tasklist.sort_tasks
    expect(tasklist.complete_array).to include(task1)
    expect(tasklist.incomplete_array).to include(task2)
  end
end

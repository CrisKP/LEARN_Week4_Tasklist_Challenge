# Story: As a developer, I can create a Task.
# Story: As a developer, I can give a Task a title and retrieve it.
# Story: As a developer, I can give a Task a description and retrieve it.
# Story: As a developer, I can mark a Task done.
# Story: As a developer, when I print a Task that is done, its status is shown.
# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
# Story: As a developer with a TaskList, I can get the completed items.
# Story: As a developer with a TaskList, I can get the incomplete items.

# --------

require 'rspec'
require_relative 'task'


describe "Task" do
  it "can be created without error" do
    expect{Task.new}.not_to raise_error
  end

  it "can have a title and be retrieved" do
    task = Task.new
    expect(task.title).to be_a(String)
    expect(task.title).to eq("title")
    task.title="Title1"
    expect(task.title).to eq("Title1")
  end

  it "can have a description and retrieve it" do
    task = Task.new
    expect(task.description).to be_a(String)
    expect{raise task.update_description(45)}.to raise_error("Must be a string")
  end

  it "can be marked complete" do
    task = Task.new
    expect(task.status).to eq("In progress")
    task.task_complete
    expect(task.status).to eq("Complete")
  end

  it "can be added to a Tasklist" do
    task = Task.new
    tasklist = Tasklist.new
    tasklist.add_task("laundry")
    expect(tasklist.add_task(task)).to include(task)
    expect(tasklist.get_array).to include("laundry")
  end

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

# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.

end

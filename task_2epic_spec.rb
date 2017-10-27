require 'rspec'
require_relative 'task'

# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
describe "DueDateTask" do
  it "can be created" do
    expect{DueDateTask.new}.to_not raise_error
  end

  it "can have a due date" do
    task_w_date = DueDateTask.new
    expect(task_w_date.date).to be_a(Date)
  end

# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
  it "can print an item with a due date with labels and values" do
    task_w_date = DueDateTask.new
    expect(task_w_date.to_string).to be_a(String)
    # expect(task_w_date).to include(@description)
  end

# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
  it "can be included into the Tasklist" do
    tasklist = Tasklist.new
    tasklist.add_DueDateTask("Buy gift")
    expect(tasklist.date_array[0].title).to eq("Buy gift")
  end

end

# Pending
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.

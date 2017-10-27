require 'date'

class Task
  attr_accessor :title

  def initialize
    @title = "title"
    @description = "description"
    @status = "In progress"
  end

  def update_description(description)
    if description.class != String
       raise ArgumentError.new("Must be a string")
    else
      @description = description
    end
  end

  def description
    @description
  end

  def status
    @status
  end

  def task_complete
    @status = "Complete"
  end
end

class DueDateTask < Task
    def initialize(date=Date.today+7)
      super()
      @date = date
    end

    def add_task (task)
      @date_array << task
    end

    def date
      @date
    end

    def to_string
      p "(#{@description}, #{@date})"
    end
end

my_newtask = DueDateTask.new
# my_newtask.to_string


class Tasklist
  def initialize
    @tasklist =[]
    @complete_array =[]
    @incomplete_array =[]
    @date_array =[]
  end

  def get_array
    @tasklist
  end

  def add_task task
    task = Task.new
    @tasklist << task
  end

  def date_array
    @date_array
  end

  def add_DueDateTask new_task
    due_task = DueDateTask.new
    due_task.title = new_task
    @date_array << due_task
  end

  def complete_array
    @complete_array
  end

  def incomplete_array
    @incomplete_array
  end


  def sort_tasks
    @tasklist.each do |el|
      if el.status == "In progress"
        @incomplete_array << el
      elsif el.status == "Complete"
        @complete_array << el
      end
    end
  end

end

# p tasklist
# p tasklist.get_array
# tasklist = Tasklist.new
# tasklist.add_task("task1")
# p tasklist.get_array
# p tasklist
tasklist = Tasklist.new
tasklist.add_DueDateTask("Buy_gift")
# p tasklist.get_array
p tasklist.date_array

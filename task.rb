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

task = Task.new

class Tasklist
  def initialize
    @tasklist =[]
    @complete_array =[]
    @incomplete_array =[]
  end

  def get_array
    @tasklist
  end

  def add_task task
    @tasklist << task
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

# tasklist = Tasklist.new
# p tasklist
# p tasklist.get_array
# tasklist.add_task(task1)

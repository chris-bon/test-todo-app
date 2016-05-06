class Task < ActiveRecord::Base
  def toggle_complete!
    update complete: !complete
  end

  def toggle_favorite!
    update favorite: !favorite
  end

  def overdue?
    Time.now > deadline
  end

  def increment_priority!
    update priority: priority + 1 if priority < 10
  end

  def decrement_priority!
    update priority: priority - 1 if priority > 1
  end
  
  def snooze_hour!
    update deadline: deadline + 1.hour
  end
end
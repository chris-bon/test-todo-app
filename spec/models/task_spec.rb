require 'rails_helper'

RSpec.describe Task, type: :model do
  before :example do
    @task = Task.create deadline: '5/10', priority: 5,
                        complete: true,  favorite: true
  end

  describe '#toggle_complete!' do
    it 'should toggle complete: true <=> false' do
      @task.toggle_complete!
      expect(@task.complete).to eq false
      @task.toggle_complete!
      expect(@task.complete).to eq true
    end
  end

  describe '#toggle_favorite!' do
    it 'should toggle favorite: true <=> false' do
      @task.toggle_favorite!
      expect(@task.favorite).to eq false
      @task.toggle_favorite!
      expect(@task.favorite).to eq true
    end
  end

  describe '#overdue?' do
    it 'should return true if task is past deadline' do
      @task.update deadline: '5/4'
      expect(@task.overdue?).to eq true
    end
    it 'should return false if task is not past deadline' do
      #@task.update deadline: '5/10'
      expect(@task.overdue?).to eq false
    end
  end

  describe 'increment_priority!' do
    it 'should return 6' do
      @task.increment_priority!
      expect(@task.priority).to eq 6
    end
  end

  describe 'decrement_priority!' do
    it 'should return 4' do
      @task.decrement_priority!
      expect(@task.priority).to eq 4
    end
  end
  
  describe 'snooze_hour!' do
    it 'should increase deadline by 1 hour' do
      @task.snooze_hour!
      expect(@task.deadline.hour).to eq 1
    end
  end
end

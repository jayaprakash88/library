#require 'AASM'
#require 'ActiveRecord'
class Invoice < ActiveRecord::Base
  attr_accessible :state
 include AASM
aasm do
    state :unplaced, :initial => true
    state :submitted
    state :processing
    state :shipped
    state :completed
    state :returned
    state :deleted

    event :submit do
      transitions :from => :unplaced, :to => :submitted
    end

    event :process do
      transitions :from => [:submitted, :returned], :to => :processing
    end

    event :ship do
      transitions :from => :processing, :to => :shipped
    end

    event :complete do
      transitions :from => :shipped, :to => :completed
    end

    event :return do
      transitions :from => :complete, :to => :returned
    end

    event :delete do
      transitions :from => :processing, :to => :deleted
    end
  end
end

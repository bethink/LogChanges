class UserLog < ActiveRecord::Base
  
  belongs_to :user
  attr_accessible :date, :json_attrs

  before_create do
    self.date = Date.today
  end
  
end

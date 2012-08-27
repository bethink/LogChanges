class User < ActiveRecord::Base
  attr_accessible :address, :city, :company, :designation, :name, :phone
  has_many :user_logs

  #   In this approach,
  # => Pros:
  #     - Simple implementation
  #     - Less SQL operation
  #     - Less no. of codes
  #     - Table size is less comparabily
  #     - Need less unit test

  # => Cons:
  #     - Logging for all the attributes
  #     - SQL operations not possible on column names & its values
  #     - Less Maintainability

  after_save do

    json_attrs = self.as_json( :except => [:id, :created_at, :updated_at] ).to_json
    user_log = self.user_logs.where(:date => Date.today).first

    if user_log.blank?
      self.user_logs.create( :json_attrs => json_attrs )
    else
      user_log.update_attribute(:json_attrs, json_attrs)
    end

  end

  def log_at_date(date)
    user_log = self.user_logs.where(:date => Date.today).first

    if user_log.blank?
      return nil
    end

    user = User.new.from_json(user_log.json_attrs)
    user.id = self.id
    user
  end

end

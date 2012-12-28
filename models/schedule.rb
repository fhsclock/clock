class Schedule
  include MongoMapper::Document
  
  key :name, String
  key :description, String
  key :active, Boolean, :default => false
  
  timestamps!
  
  many :periods
  
  validates_presence_of :name

  def self.activated
    first(:active => true)
  end
end

class Period
  include MongoMapper::EmbeddedDocument
  
  key :number, Integer
  key :name, String
  key :start, Time
  key :finish, Time

  embedded_in :schedule

  validates_presence_of :number, :name, :start, :finish
end

class Marquee
  include MongoMapper::Document
  
  # Keys
  key :text, String
  
  timestamps!
end

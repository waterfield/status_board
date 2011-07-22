class Status < ActiveRecord::Base
  
  belongs_to :person
  belongs_to :project
  
  validates :text, :presence => true
  
  def when
    case (secs = seconds_ago)
    when 0..59 then "just now"
    when 60..119 then "a minute ago"
    when 120..299 then "a few minutes ago"
    when 300..3599 then "#{secs/60} minutes ago"
    when 3601..7199 then "an hour ago"
    when 7200..86399 then "#{secs/3600} hours ago"
    when 86400..172799 then "a day ago"
    else "#{secs/86400} days ago"
    end
  end
  
  private
  
  def seconds_ago
    (Time.now - created_at).to_i
  end
  
end

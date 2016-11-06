def format_timestamp(datetime)
  # todo: format time to say "Created x minutes ago"
  # Jun 28, 2016 - 12:31 PM
  datetime.strftime("%b%e %Y - %l:%M %p")
end

def time_difference(time_created)
  t = Time.now
  seconds_diff = (t - time_created).to_i.abs

  hours = seconds_diff / 3600
  seconds_diff -= hours * 3600

  minutes = seconds_diff / 60
  seconds_diff -= minutes * 60

  seconds = seconds_diff

  if minutes.floor > 0
    time_stamp = "#{minutes.floor} minutes ago"
  elsif hour.floor > 0
    time_stamp = "#{hours.floor} hours ago"
  else
    time_stamp = "#{seconds.floor} seconds ago"
  end
end
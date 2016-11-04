def format_timestamp(datetime)
  # todo: format time to say "Created x minutes ago"
  # Jun 28, 2016 - 12:31 PM
  datetime.strftime("%b%e %Y - %l:%M %p")
end

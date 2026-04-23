module ApplicationHelper
  def format_date(date)
    date.strftime("%B %d, %Y") if date.present?
  end

  def format_datetime(datetime)
    datetime.strftime("%B %d, %Y at %I:%M %p") if datetime.present?
  end

  def human_status(status)
    status.to_s.humanize
  end
end

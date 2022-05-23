module EventsHelper
  def event_header(event)
    content_tag :h1, event.name
  end
end

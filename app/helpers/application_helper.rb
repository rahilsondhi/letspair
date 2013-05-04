module ApplicationHelper

  def timezones
    zones = ActiveSupport::TimeZone.all
    zones.map { |z| {key: z.to_s, value: z.name} }
  end

end

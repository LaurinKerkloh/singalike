module ApplicationHelper
  def icon(icon_class, **options, &)
    icon_classes = "bi bi-#{icon_class}"
    options[:class] = [icon_classes, options.dig(:class)].compact.join(" ")
    tag.i "", **options, &
  end
end

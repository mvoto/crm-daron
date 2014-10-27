module ApplicationHelper

  def to_date(attr)
    attr.nil? ? '-' : attr.strftime('%d/%m/%Y')
  end
end

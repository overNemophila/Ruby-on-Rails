module ApplicationHelper
  def flash_to_class(flash_key)
    case flash_key
    when "notice"
      "primary"
    when "alert"
      "danger"
    else
      "dark"
    end
  end

  def full_title(page_title = '')
    base_title = "Memberships"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end

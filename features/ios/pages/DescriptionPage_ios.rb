require_relative '../base_page'

class DescriptionPage < BasePage

  def verify_city_name(city_name)
    if  element_exists("view text:'#{city_name}'") == false
      fail("Element not found #{city_name}")
    end
  end

end
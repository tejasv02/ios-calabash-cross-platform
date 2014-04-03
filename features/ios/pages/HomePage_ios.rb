require_relative '../base_page'

class HomePage < BasePage

  def verify_home_page
    wait_for_elements_exist "view text:'Barcelona'"
    sleep 2
  end


  def verify_city_in_row(arg,num)
    row=num.to_i-1
    txt_from_screen= query("tableViewCell indexPath:#{row.to_i},0 label", :text).first
    if (txt_from_screen!=arg)
      fail("text not shown txt_from_screen:#{txt_from_screen}: arg:#{arg}")
    end
  end


end

module CommonMethods
  def scroll_table(text)
    section=0
    scroll_to_cell(:row => 0, :section => 0)  #scroll to top of table
    sleep 1
#Below code loops through each cell to check if the appropriate text was found
    each_cell(:animate => false, :post_scroll => 0.2) do |row, sec|
      if query("tableViewCell indexPath:#{row},#{sec} label", :text).first==text
        break # if text found break from loop
      end
      section=section+1
    end
  end
end
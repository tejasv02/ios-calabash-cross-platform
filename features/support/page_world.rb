module TestModule
  def initialize_all
    @homePage||=HomePage.new
    @descriptionPage||=DescriptionPage.new
  end
end
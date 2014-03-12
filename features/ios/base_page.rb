require_relative '../ios/support/common_methods'

class BasePage < Calabash::IBase
  include CommonMethods

  def initialize
  end
  #
  #def welcome_page
  #  @welcome_page ||=page(WelcomePage)
  #end
  #
  #def login_page
  #  @login_page ||=page(LoginPage)
  #end


end

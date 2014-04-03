########################################
#                                      #
#       Important Note                 #
#                                      #
#   When running calabash-ios tests at #
#   www.xamarin.com/test-cloud         #
#   this file will be overwritten by   #
#   a file which automates             #
#   app launch on devices.             #
#                                      #
#   Don't rely on this file being      #
#   present when running at            #
#   Xamarin Test Cloud                 #
#                                      #
########################################

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  initialize_all
  scenario_tags = scenario.source_tag_names
  if scenario_tags.include?('@reset')
    @calabash_launcher.reset_app_jail
  end

  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch(:timeout=>60)
    @calabash_launcher.calabash_notify(self)
  end
end


After do |scenario|
  if scenario.failed?
    screenshot_embed
  end

  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

require 'calabash-cucumber/ibase'

class MainPage < Calabash::IBase

  def trait
    "button marked:'Toggle'"
  end

  def await(wait_opts={})
    super(wait_opts)
    wait_for_elements_do_not_exist(['activityIndicatorView'], :timeout => 60)
    wait_for_animation
    self
  end

  def blog_site_selector(site)
    "label text:'#{site}'"
  end

  def wait_for_blog_present(site)
    show_menu
    wait_for_elements_exist([blog_site_selector(site)], :timeout => 20)
    wait_for_animation
  end

  def go_to_posts

    unless element_exists("navigationItemView marked:'Posts'")

      posts_selected = query("label text:'Posts' parent tableViewCell", :isSelected).first
      if posts_selected == "1"
        toggle_menu
      else
        show_menu
        touch("view marked:'Posts'")
      end

      wait_for_animation
    end

  end

  def go_to_new_article
    go_to_posts

    transition(:tap => "button marked:'navbar add'",
               :page => NewArticlePage)
  end


  def wait_for_article_to_appear(article)
    wait_for_elements_do_not_exist(["view marked:'Uploading'"])

    wait_for_no_network_indicator

    check_post_with_title_exists(article[:title])

  end

  def assert_posts(posts)
    posts.each do |post|
      check_post_with_title_exists(post[:title])
      check_element_exists("view:'PostTableViewCell' label {text BEGINSWITH '#{post[:date]}'}")
    end

  end


  def post_with_title(title)
    "view:'PostTableViewCell' label text:'#{title}'"
  end

  def check_post_with_title_exists(title)
    check_element_exists(post_with_title(title))
  end

  def delete_top_article_if_matches(post)
    #post[:title]
    if element_exists(post_with_title(post[:title]))
      swipe(:right, :query => post_with_title(post[:title]))
    end

    delete_btn_q = "view marked:'Delete'"
    wait_for_elements_exist(["view marked:'Delete'"])
    wait_for_animation

    touch(delete_btn_q)
    wait_for_animation

    check_element_does_not_exist(post_with_title(post[:title]))


  end


  def show_menu
    unless menu_visible
      toggle_menu
      wait_for_animation
    end
  end

  def menu_visible
    element_exists("button marked:'Settings'")
  end

  def toggle_menu
    touch("button marked:'Toggle'")
  end

  def wait_for_toggle_button
    wait_for_elements_exist([trait])
  end

end
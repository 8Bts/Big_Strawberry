module ApplicationHelper
  def auth_links
    if session[:current_user]
      render '/layouts/username_log_out'
    else
      render '/layouts/sign_in_sign_up'
    end
  end

  def check_notice(notice)
    render '/layouts/notice', notice if notice    
  end

  def no_category_msg
    render '/layouts/run_seed_pls' if Category.all.size.zero?
  end  
end

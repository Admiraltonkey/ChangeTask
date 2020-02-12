class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  add_flash_types :success, :danger, :info, :warning
  before_action :set_locale

  def moon
    cookies[:moon] = {
        value: 'dark mode on'
    }
    if @logged_in_user
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def sun
    cookies.delete(:moon)
    if @logged_in_user
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}.merge options
  end
end

class ApplicationController < ActionController::Base

  # 個別のコントローラーで設定を行ったためココでの記述は不要
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:display_id, :admin])
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :representative_name, :tel, :payment])
  # end

  def after_sign_out_path_for(resource)
   new_store_session_path
   # ココもログイン後ユーザーは投稿一覧へ行くようにする。
  end
end

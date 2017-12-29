class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception # 이걸 지워야 카카오톡 봇 작동함 csfr공격 차단하는것임
end

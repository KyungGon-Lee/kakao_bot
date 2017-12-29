class KakaoController < ApplicationController
  def keyboard
    home_keyboard = {
      :type => "text"
      # type: "text"
      # "type" => "text"
    }
    render json: home_keyboard
  end

  def message

  end
end

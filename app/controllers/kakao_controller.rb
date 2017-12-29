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
    # 사용자가 보내준 텍스트를 그대로 다시 말하기
    user_message = params[:content]

    # 로또
    # 메뉴
    # 다른 명령어가 들어왔을 때

    if user_message = "로또"
    lotto = (1..45).to_a.sample(6)
    render json: lotto
    end

    return_message = {
      :message => {
        :text => user_message
        },
      # :keyboard = "" # 생략 가능
    }

    render json: return_message

  end
end

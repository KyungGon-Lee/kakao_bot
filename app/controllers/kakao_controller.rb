
class KakaoController < ApplicationController
  def keyboard
    home_keyboard = {type => "text"}
    render json: home_keyboard
  end

  def message
    # 사용자가 보내준 텍스트를 그대로 다시 말하기
    user_message = params[:content]
    return_text = "임시 텍스트"
    image = false
    # 로또
    # 메뉴
    # 다른 명령어가 들어왔을 때

    if user_message == "로또"
      return_text = (1..45).to_a.sample(6).to_s
    elsif user_message == "메뉴"
      return_text = ["20층", "시골집", "다이어트"]
    elsif user_message == "고양이"
      # 고양이 사진
      image = true
      url = "http://thecatapi.com/api/images/get?format=xml&type=jpg"
      cat_xml = RestClient.get(url)
      doc = Nokogiri::XML(cat_xml)
      cat_url = doc.xpath("//url").text # 텍스트만 출력하기 위해 .text 함
    else
      return_text == "사용 가능 명령어 로또, 메뉴, 고양이"
    end

    # return_message = {
    #   :message => {
    #     :text => user_message
    #     },
    #   # :keyboard = "" # 생략 가능
    # }
    home_keyboard = {:type => "text"}

    return_message_with_img = {
      :message => { :text => "return_text", :photo => {:url => cat_url, :width => 640, :height => 480} },
      :keyboard => home_keyboard
    }

    return_message = {
     :message => { :text => "return_text" },
     :keyboard => home_keyboard
    }

  if image
    render json: return_message_with_img
  else
    render json: return_message
  end
end
end

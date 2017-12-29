require 'parser' # 헬퍼에다가 모듈화 해놧음
class KakaoController < ApplicationController
# AIzaSyALWzqL8t1VXLVxCSIChKKGCv-UVHqvbQQ
# 구글 커스텀 서치 api

  def keyboard
    # home_keyboard = { :type => "text"}
    home_keyboard = { :type => "buttons", :buttons => ["메뉴", "고양이", "영화", "로또"] }
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
      return_text = ["돈까스", "스테이크", "다이어트", "삼각김밥", "치킨", "피자", "햄버거", "샌드위치"].sample

    elsif user_message == "고양이"
      # 고양이 사진
      return_text = "나만 고양이 없어 ㅠㅠ"
      image = true
      animal = Parser::Animal.new
      img_url = animal.cat

    elsif user_message == "영화"
      image = true
      naver_movie = Parser::Movie.new
      naver_movie_info = naver_movie.naver
      return_text = naver_movie_info[0]
      img_url = naver_movie_info[1]  
    else
      return_text = "사용 가능 명령어 로또, 메뉴, 고양이, 영화 를 쳐보세요!"
    end

    # return_message = {
    #   :message => {
    #     :text => user_message
    #     },
    #   # :keyboard = "" # 생략 가능
    # }
    # home_keyboard = {:type => "text"}
    home_keyboard = { :type => "buttons", :buttons => ["로또", "메뉴", "고양이", "영화"] }

    return_message_with_img = {
      :message => { :text => return_text, :photo => {:url => img_url, :width => 640, :height => 480} },
      :keyboard => home_keyboard
    }

    return_message = {
     :message => { :text => return_text, },
     :keyboard => home_keyboard
    }

  if image
    render json: return_message_with_img
  else
    render json: return_message
  end
end
end

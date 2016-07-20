class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  def require_login
    unless user_signed_in?
      redirect_to '/users/sign_in'
    
    else
      user_email = current_user.email 
      
      mijeong = "student1@ksu.ac.kr"
      ahyun = "student2@ksu.ac.kr"
      cheol = "student3@ksu.ac.kr"
      admin = "admin@ksu.ac.kr"
      
      if user_email == mijeong
        @user_display_name = "미정"
        @user_name = "mijeong"
        @user_content = Post.where(user_name: "mijeong").reverse
        
      elsif user_email == ahyun
        @user_display_name = "아현"
        @user_name = "ahyun"
        @user_content = Post.where(user_name: "ahyun").reverse
        
      elsif user_email == cheol
        @user_display_name = "철"
        @user_name = "cheol"
        @user_content = Post.where(user_name: "cheol").reverse
      else
        @user_display_name = "신이올시다"
        @user_name = "admin"
        @user_content = Post.all.reverse
      end
      
    end
  end
end

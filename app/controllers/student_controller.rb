class StudentController < ApplicationController
  before_filter :authenticate_user!
  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    #@user = User.all
  end
  def proselects

  end
  def settings

  end
  
  def register
  end

  def register_save
    if params[:password] == params[:password2]
      student = Student.new({
        :tc => params[:tc],
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :blood_group_id => params[:blood_group_id],
        :gender => params[:gender],
        :birthday => params[:birthday],
        :email => params[:email],
        :password => params[:password],
        :phone_number => params[:phone_number],
        :city_id => params[:city_id],
        :district_id => params[:district_id],
        :address => params[:address],
      })

      if student.save
        if params[:image] and response = Image.upload('donors', student[:id], params[:image])
          student[:image] = response[1] if response[0]
          student.save
        end
        flash[:notice] = "Kaydınız Alınmıştır. Teşekkür Ederiz"
      else
        flash[:error] = "Kaydınız Alınamadı"
      end
    else
      flash[:error] = "Parolalar Eşleşmiyor"
    end
    redirect_to '/student/register'
  end  

  def documents
  
  end
  def probook

  end
  def reports

  end
  #def content
    # email = User.find(current_user_id).email.gsub(/@\w+.[A-z]+.[A-z]{2,4}+.[A,z]{2,4}/,'')
  #end  
end

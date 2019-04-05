class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def my_profile
        #need change when merge with log-in"
        @user = User.find(1)
    end
      
    

    # def new
    #     begin
    #         @school = School.find(params[:school_id])
    #     rescue
    #         redirect_to schools_url, alert: "Error: School not found!"
    #     end
    #     @teacher = Teacher.new
	#     # render 'teacher/new.html.erb'
    # end

    # def create
    #     begin
    #         @school = School.find(params[:school_id])
    #     rescue
    #         redirect_to schools_url, alert: "Error:School not found!"
    #     end
    #     @teacher = Teacher.new(params.require(:teacher).permit(:honorific, :last_name, :expiration, :email, :school_id))

    #     @school.teachers << @teacher
    #     if @teacher.save
    #         redirect_to school_url(@school), notice: "Teacher sucessfully created!"
    #     else
    #         flash.now[:alert] = 'Error! Enabled to create teacher.'
    #         render :new
    #     end
    # end

    
end
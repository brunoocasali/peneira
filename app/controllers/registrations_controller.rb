class RegistrationsController < Devise::RegistrationsController

  def new
    session[:user_params] ||= {}
    @user = User.new(session[:user_params])
    @user.current_step = session[:user_step]
  end

  def create
    session[:user_params].deep_merge!(params[:user]) if params[:user]
    @user = User.new(session['user_params'])
     
    if session[:omni_auth]
      session[:omni_auth] = false
      @user = User.find_by_email(session['user_params']['email'])
      @user.user_type = params['user']['user_type']
    end
    
    @user.current_step = session[:user_step]
    if @user.valid?
      if params[:back_button]
        @user.previous_step
      elsif @user.last_step?
        @user.save if @user.all_valid?
      else
        @user.next_step
      end
      session[:user_step] = @user.current_step
    end
    
    if @user.new_record?
      render "new"
    else
      session[:user_step] = session[:user_params] = nil
      flash[:notice] = "Aguarde a confirmação de email!"
      redirect_to root_path
    end
  end
end

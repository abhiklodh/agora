class User::ProfileController < User::BaseController

  def display
    responder_for(Pages::UserApp::Profile)
  end

  def update
    user = User.first
    user.update_attributes user_params

    if has_errors?
      render json: {
        errors: user.errors
      }, status: :unproccessable_entity
    else
      begin
        user.save!(validate: false)
        render json: {}, status: :ok
      rescue
        render json: {}, status: :unproccessable_entity
      end
    end
  end

  protected

  def has_errors?
    user = User.first

    user.valid? #trigger validations

    has_errors = false
    [
      :first_name,
      :last_name
    ].each do |key|
      has_errors = true if user.errors.added?(key, :blank)
    end

    has_errors = true if user.errors.added?(:email, :invalid)

    return has_errors
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end

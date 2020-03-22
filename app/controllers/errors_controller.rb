class ErrorsController < ApplicationController

  skip_before_action :authenticate_user!, raise: false # if using Devise

  def not_found
    @status = 404
    @message = ' Page Not Found'
  end

  def unacceptable
    @status = 422
    @message = ' Unprocessable Entity'
  end

  def internal_error
    @status = 500
    @message = ' Internal Server Error'
  end

end

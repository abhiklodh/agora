class ExampleController < ApplicationController

  def my_example_page
    responder_for(Pages::UserApp::ExamplePage)
  end

end

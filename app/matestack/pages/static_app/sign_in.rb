# # Moved to classic rails view layer

# class Pages::StaticApp::SignIn < Matestack::Ui::Page
#
#   def prepare
#     @user = User.new
#   end
#
#   def response
#     components do
#
#       div class: 'row' do
#         div class: 'col-md-6 offset-md-3 text-center' do
#           heading class: 'mt-4 mb-4', text: 'Login'
#           form form_config, :include do
#             div class: 'input-wrapper mb-2' do
#               form_input id: 'email', key: :email, type: :text, placeholder: 'Email'
#             end
#             div class: 'input-wrapper mb-4' do
#               form_input id: 'password', key: :password, type: :password, placeholder: 'Passwort'
#             end
#             link path: :root_path, class: 'pw-reset d-block mb-3', text: 'Passwort vergessen?'
#
#             form_submit do
#               button class: 'blue-button', text: 'Einloggen'
#             end
#           end
#           async show_on: "login_failed", hide_after: 5000 do
#             plain t(:login_failed)
#           end
#         end
#       end
#
#     end
#   end
#
#   private
#
#   def form_config
#     {
#       for: @user,
#       method: :post,
#       path: :user_session_path,
#       success: {
#         transition: {
#           follow_response: true
#         }
#       },
#       failure: { emit: "login_failed" }
#     }
#   end
#
# end

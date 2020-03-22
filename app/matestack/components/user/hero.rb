class Components::User::Hero < Matestack::Ui::StaticComponent

  def prepare
    @user = User.first
    @institute = Institution.find_by(user_id: @user.id)
  end

  def response
    components {
      div class: 'pt-4 pb-5 row' do
        div class: 'col-8' do
          img path: "icons/user_blue.svg", class: 'user-icon'
          heading class: 'd-inline', text: "#{@institute.title}"
          heading size: 3, class: 'd-inline', text: " (#{@user.first_name} #{@user.last_name})"
        end
        div class: 'col-4 pt-2' do
          transition path: :user_dashboard_path, class: 'blue-button', text: 'Inserat erstellen'
          link path: :user_chats_path do
            img path: "icons/message.svg", class: 'ml-3'
          end
          link path: :user_dashboard_path, class: 'ml-3 shadowed-bg-white circle' do
            img path: "icons/bell.svg", class: ''
          end
        end
      end
    }
  end

end

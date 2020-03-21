class Components::Navbar < Matestack::Ui::StaticComponent

  def response
    components {
      div class: 'bg-white' do
        heading size: 5, text: 'Menü'
        transition path: :user_dashboard_path, text: 'Marktplatz'
        br
        transition path: :user_show_profile_path, text: 'Mein Account'
        br
        transition path: :user_chat_index_path, text: 'Meine Nachrichten'
        br
        transition path: :root_path, text: 'Meine Inserate'
        br
        transition path: :root_path, text: 'Kontaktübersicht'
        br
        link_to "Logout", destroy_user_session_path, method: :delete
      end
    }
  end

end

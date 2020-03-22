class Components::Navbar < Matestack::Ui::StaticComponent

  def prepare
    @nav_items = {
      :user_dashboard_path => "Marktplatz",
      :user_show_profile_path => "Mein Account",
      :user_chats_path => "Meine Nachrichten",
      :user_items_path => "Meine Inserate",
      :user_contacts_path => "Kontaktübersicht"
    }
  end

  def response
    components {
      div class: 'navigation shadowed-bg-white pt-5' do

        transition path: :user_dashboard_path do
          img path: "agora_logo.png", class: 'mb-5 mt-2 logo'
        end

        heading size: 4, class: 'menu-header mb-4', text: 'Menü'

        @nav_items.each do |path, text|
          transition path: path,  text: text, class: "#{'nav-active' if text == 'Marktplatz'}"
          br
        end

        # link_to "Logout", destroy_user_session_path, method: :delete
      end
    }
  end

  def link_active? path
    current_path = context[:request].fullpath
    return current_path == ::Rails.application.routes.url_helpers.send(path)
  end

end

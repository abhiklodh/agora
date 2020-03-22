class Components::Navbar < Matestack::Ui::StaticComponent

  def prepare
    @nav_items = [
      {:path => :user_dashboard_path, :text => 'Marktplatz', :icon => 'dashboard'},
      {:path => :user_show_profile_path, :text => 'Mein Account', :icon => 'user'},
      {:path => :new_user_chat_path, :text => 'Meine Nachrichten', :icon => 'message'},
      {:path => :user_items_path, :text => 'Meine Inserate', :icon => 'document'},
      {:path => :user_contacts_path, :text => 'Kontaktübersicht', :icon => 'phone'}
    ]
  end

  def response
    components {
      div class: 'navigation shadowed-bg-white pt-3' do

        transition path: :user_dashboard_path do
          img path: "agora_logo.png", class: 'mb-5 mt-2 logo'
        end

        heading size: 4, class: 'menu-header mb-4', text: 'Menü'

        @nav_items.each do |link|
          transition path: link[:path] do
            img path: "icons/#{link[:icon]}.svg", class: "navbar-icon"
            span text: link[:text], class: "#{'nav-active' if link[:text] == 'Marktplatz'}"
          end
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

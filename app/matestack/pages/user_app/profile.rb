class Pages::UserApp::Profile < Matestack::Ui::Page

  def prepare
    @current_user = User.first
    @links = {
      request.path => "Mein Profil"
    }
  end

  def response
    components {
      custom_breadcrumb links: @links

      heading size: 2, class: 'mt-3 mb-4', text: 'Mein Account'

      heading size: 3, class: 'mt-2 mb-3', text: 'Persönliche Daten'

      form profile_form_config, :include do
        div class: 'mt-3 mb-3 pl-5' do
          form_input id: 'first_name', key: :first_name, type: :text, placeholder: @current_user[:first_name]
          span class: 'pr-4'
          form_input id: 'last_name', key: :last_name, type: :text, placeholder: @current_user[:first_name]
        end
        form_submit do
          button class: 'mt-3 mb-3 blue-button', text: 'Speichern'
        end
      end
      async show_on: "form_has_errors", hide_after: 5000 do
        plain 'Es ist ein Fehler aufgetreten'
      end
      async show_on: "update_successful", hide_after: 5000 do
        plain 'Update erfolgreich'
      end
    }
  end

  def profile_form_config
    {
      for: @current_user,
      method: :put,
      path: :user_update_profile_path,
      success: { emit: "update_successful" },
      failure: { emit: "form_has_errors" }
    }
  end

end

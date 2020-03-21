class Pages::UserApp::Profile < Matestack::Ui::Page

  def response
    components {
      heading text: 'Mein Account'

      form profile_form_config, :include do
        div do
          plain t :name
          form_input id: 'first_name', key: :first_name, type: :text, placeholder: current_user[:first_name]
          form_input id: 'last_name', key: :last_name, type: :text, placeholder: current_user[:first_name]
        end
        form_submit do
          button class: 'blue-button', text: 'Speichern'
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
      for: current_user,
      method: :put,
      path: :user_update_profile_path,
      success: { emit: "update_successful" },
      failure: { emit: "form_has_errors" }
    }
  end

end

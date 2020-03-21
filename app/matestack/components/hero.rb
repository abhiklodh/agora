class Components::Hero < Matestack::Ui::StaticComponent

  def prepare
    @user = current_user
    @institute = Institution.find_by(user_id: @user.id)
  end

  def response
    components {
      heading do
        strong text: "#{@institute.title}"
        plain " (#{@user.first_name} #{@user.last_name})"
      end
    }
  end

end

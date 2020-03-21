class Components::Breadcrumb < Matestack::Ui::StaticComponent

  def response
    components {
      transition path: :user_dashboard_path, text: 'Marktplatz'
      @options[:links].each do |path, text|
        plain ' > '
        transition path: path, text: text
      end
    }
  end

end

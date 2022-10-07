module ApplicationHelper

    def show_svg(path)
      File.open("app/assets/images/#{path}", "rb") do |file|
        raw file.read
      end
    end

    def helpers
      ActionController::Base.helpers
    end

end

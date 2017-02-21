module Frontend
    class PagesController < FrontendController
        def home; end

        def contact; end

        def timeline
            @photos = Photo.all
        end
    end
end

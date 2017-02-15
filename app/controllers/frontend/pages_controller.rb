module Frontend
    class PagesController < FrontendController
        def home; end

        def contact; end

        def engineering
            @photos = Photo.all
        end
    end
end

module ApplicationHelper
    @images
    def get_image_links
        
        @images = {
            'logoUrl': image_path("verticalfox-logo.png")
        }
        return @images
    end
end

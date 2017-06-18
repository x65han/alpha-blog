class PagesController < ApplicationController
    def about
        @title = 'About Me'
        @content = 'Author: Johnson Han'
    end
end

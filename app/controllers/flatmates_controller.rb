class FlatmatesController < ApplicationController

def index
    @flatmates = Flatmate.all
end

end

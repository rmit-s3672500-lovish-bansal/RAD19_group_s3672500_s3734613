class CoordinatorController < ApplicationController
    def show
        respond_to do |format|
  format.js {render layout: false} # Add this line to you respond_to block
end
end
end

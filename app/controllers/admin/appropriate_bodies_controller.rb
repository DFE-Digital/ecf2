module Admin
  class AppropriateBodiesController < ApplicationController
    include Authorisation
    include Pagy::Backend

    def index
      @pagy, @appropriate_bodies = pagy(
        AppropriateBodies::Search.new(params[:q]).search,
        limit: 30
      )
    end

  private

    def authorised?
      Admin::Access.new(current_user).can_access?
    end
  end
end

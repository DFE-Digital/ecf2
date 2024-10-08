class AppropriateBodiesController < ApplicationController
  include Authorisation

  before_action :set_appropriate_body
  layout "full", only: :show

  def show
    # FIXME: find within the scope of the current AB

    @teachers = Teachers::Search.new(params[:q]).search
  end

private

  def set_appropriate_body
    # FIXME: this should be stored in the session when someone logs
    #        in, then we can easily switch between ABs if a user is
    #        linked ot more than one

    @appropriate_body = current_user.appropriate_bodies.first
  end

  def authorised?
    current_user.appropriate_bodies.any?
  end
end

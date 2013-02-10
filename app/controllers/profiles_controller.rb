class ProfilesController < ApplicationController
  class CreateListener
    def initialize(controller)
      @controller = controller
    end

    def success
      @controller.flash[:notice] = "Profile successfully created"
      @controller.redirect_to :root
    end

    def failure(ex)
      @controller.flash[:error] = "#{ex}"
      @controller.redirect_to :action => :new
    end
  end

  def new
  end

  def create
    create_user = CreateUser.new(params)
    create_user.subscribe(CreateListener.new(self))
    create_user.create!
  end
end

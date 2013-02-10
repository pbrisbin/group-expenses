require 'test_helper'

class ProfilesControllerTest < ActiveSupport::TestCase

  def test_create
    options = fake_params

    create_user = mock
    create_user.expects(:subscribe).with(kind_of(listener_class))
    create_user.expects(:create!)

    CreateUser.expects(:new).with(has_entries(options)).returns(create_user)

    # prevents missing template error. other tests assert the action
    # will redirect via the Listener object.
    @controller.stubs(:render)

    post :create, options
  end

  def test_create_listener_success
    listener_test(:success) do |controller|
      controller.flash.expects(:[]=).with(:notice, "Profile successfully created")
      controller.expects(:redirect_to).with(:root)
    end
  end

  def test_create_listener_failure
    listener_test(:failure, "Error") do |controller|
      controller.flash.expects(:[]=).with(:error, "Error")
      controller.expects(:redirect_to).with(:action => :new)
    end
  end

  private

  def fake_params
    HashWithIndifferentAccess.new({
      :foo => "foo",
      :bar => "bar"
    })
  end

  def listener_class
    ProfilesController::CreateListener
  end

  def listener_test(method, *args)
    flash = mock
    controller = mock
    controller.stubs(:flash).returns(flash)

    yield(controller)

    listener = listener_class.new(controller)
    listener.send(method, *args)
  end

end

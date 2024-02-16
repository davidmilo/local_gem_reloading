class DashboardController < ApplicationController
  def show
    render inline: MyNamespace::MyGem.do_something
  end
end
class DashboardController < ApplicationController
  def show
    render inline: MyRootNamespace::MyNamespace::MyGem.do_something
  end
end
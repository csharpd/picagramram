class TagsController < ApplicationController

  def show
    @tag = Tag.find_by!(text: '#' + params[:name])
  end

end

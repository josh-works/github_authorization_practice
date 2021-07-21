class BragEntryController < ApplicationController
  def index
    @all_entries = current_user.brag_entries
  end
end
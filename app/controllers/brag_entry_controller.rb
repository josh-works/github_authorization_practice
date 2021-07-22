class BragEntryController < ApplicationController
  def index
    @all_entries = current_user.brag_entries
  end
  
  def new
    @brag_entry = BragEntry.new
    respond_to do |format|
      format.html { render :new, locals: { brag_entry: @brag_entry } }
    end
  end
  
  def create
    @brag_entry = current_user.brag_entries.create(brag_params)
    
    if @brag_entry.save
      redirect_to brag_entry_index_path
    else
      flash.alert "there was a problem"
      redirect_to brag_entry_path, notice: flash[:notice]
    end
    
  end
  
  private
  
  def brag_params
    params.require(:brag_entry).permit(:body)
  end
end
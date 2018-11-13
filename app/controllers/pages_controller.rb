class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: %i[home influencerinfo scoutinfo]
  def home
  end

  def influencerinfo
  end

  def scoutinfo
  end
end

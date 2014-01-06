class PagesController < HighVoltage::PagesController
      skip_filter :authenticate_user!
end

class PagesController < HighVoltage::PagesController 
  
  layout :layout_for_page

  protected 
    def layout_for_page
      case params[:id] 
      when 'about'
        'about'
      else
        'application'
      end   
    end
end

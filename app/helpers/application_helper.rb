module ApplicationHelper
   def fetchFormatTZ()
       begin
         tz = Timezone::Zone.new(:latlon => request.location.coordinates)
         z = Timezone::ActiveSupport.format(tz.zone.to_s)
       rescue
         z = 'Eastern Time (US & Canada)'
       end
   end
end

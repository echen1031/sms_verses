module ApplicationHelper
	def fetchFormatTZ()
	 	begin
	 		tz = Timezone::Zone.new(:latlon => request.location.coordinates)
	   	Timezone::ActiveSupport.format(tz.zone.to_s)	   	
	 	rescue
	   	'Eastern Time (US & Canada)'
	 	end
	end
end

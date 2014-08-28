class Application < ActiveRecord::Base
  belongs_to :ticket

  	def self.getAppName app_id
		@application = Application.find(app_id).name
	end
end

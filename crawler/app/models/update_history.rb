class UpdateHistory < ApplicationRecord
	def self.get_last_update(name)
		rec = self.find_by_name(name)

		if not rec then
			UpdateHistory.create(name: name)
			return nil
		else
			updated = rec["updated_at"]	
			rec.touch(:updated_at)
			if Time.now - rec["updated_at"] > 10*60*60*24 then
				return nil
			else
				return updated
			end
		end

		if not rec or Time.now - rec["updated_at"] > 10*60*60*24 then
			return nil
		else
			rec.touch(:updated_at)
			return updated
		end
	end
end

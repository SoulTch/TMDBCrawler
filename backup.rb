
					chg_base = "https://api.themoviedb.org/3/#{name}/#{x["id"]}changes?api_key=#{api_key}&start_date=#{start_time}&end_date=#{end_time}&page=%d"
					url = chg_base % [1]
					res = JSON.parse(open(url).read)

					for page_num in (1..1000)
						if page_num > 1 then
							url = chg_base % [page_num]
							res = JSON.parse(open(url).read)
						end

						# TODO:: break if not valid

						res["changes"].each do |change|
							key = change["key"]

							if self.respond_to? key
								change["items"].each do |detail|
									rec = self.find(x["id"])
									if detail["iso_639_1"] and detail["iso_639_1"] != "en" then
										next
									end
									if rec.updated_at > Time.parse(detail["time"]) then
										next
									end

									if detail["action"] == "updated" then
										rec.update(key => detail["value"])
									els
										p "Unknown action : ", detail["action"]
									end
								end
								self.find(x["id"]).update(key => change["items"][-1]["value"])
							elsif handler.key? key
								handler[key] 
								val.each do |changes|
									handler[key] val
								end
							end
						end
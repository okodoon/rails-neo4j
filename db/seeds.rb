puts "start seeding"

File.open("#{Rails.root}/db/school.json") do |file|
	metadata = JSON.load(file)

	university_metadata = metadata.each_slice(2).map(&:first)
	faculty_metadata = metadata.each_slice(2).map(&:last)

	university_metadata.each_with_index do |hash, index|
		university = University.create(name: hash["大学"])
		faculty_metadata[index]["学部"].each do |fac_name|
			if Faculty.find_by(name: fac_name).present?
				university.faculties << Faculty.find_by(name: fac_name) 
			else
				university.faculties << Faculty.create(name: fac_name)
			end
		end
	end
end
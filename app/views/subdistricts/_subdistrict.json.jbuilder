json.extract! subdistrict, :id, :name, :province, :city, :district, :subdistrict
json.communities subdistrict.communities.each do |community|
	json.id community.id
	json.name community.name
end
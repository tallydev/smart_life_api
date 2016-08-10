json.date @report.try(:date)
json.items(Exam::Report.item_infos.each) do |name, detail|
  value = @report.try(:send, name)
  json.name name
  json.alias detail[:alias]
  json.hint detail[:hint]
  json.value value
  json.state Exam::Report.item_state(name, value)
end

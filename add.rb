def entries_from(file_path)
	abs_path = File.expand_path(file_path)
	text = File.read(abs_path)
	text.split("\n")
end

old_path = "lib/burner_email_db/db.txt"
new_path = "new-domains.txt"

abort "File “./#{new_path}” not found" unless File.exist?(new_path)

new_entries = entries_from(new_path)
abort "Your file is empty" if new_entries.size.zero?

old_entries = entries_from(old_path)

combined_entries = (old_entries + new_entries).uniq.sort
new_domains_size = combined_entries.size - old_entries.size

abort "All domains from “#{new_path}” are already on the list" if new_domains_size.zero?

old_file = File.open(old_path, "w+")

combined_entries.each do |domain|
	old_file.write domain
	old_file.write "\n"
end

old_file.close

puts "Added #{new_domains_size} new domains"

require "make_dirs_from_list/version"
require "roo"
require "fileutils"

module MakeDirsFromList
  def self.make!(file_name, target_dir, title_template)
    columns = get_column_indices title_template
    title_placeholders = get_placeholders title_template
    rows = Roo::Spreadsheet.open file_name
    dir_names = []
    raise "Can't find a valid sheet at \"#{file_name}\"" if rows.nil?

    FileUtils.mkdir target_dir unless Dir.exists? target_dir

    rows.each_with_index do |row, i|
      next if i.zero?
      title_parts = row.values_at *columns
      dir_name = make_dir_name title_parts.zip(title_placeholders), title_template.dup
      dir_names << File.join(target_dir, dir_name)
    end
    
    puts "Making #{dir_names.size} dirs in #{target_dir} from text in columns #{columns}."

    dir_names.each_with_index do |dir_name|
      next if File.exists? dir_name
      FileUtils.mkdir dir_name
      print "."
    end

    puts "\n\aDone."
  end

  def self.make_dir_name(title_parts, tmpl)
    title_parts.each do |part, placeholder|
      tmpl.gsub! placeholder, part
    end
    tmpl
  end

  def self.get_column_indices(tmpl)
    tmpl.scan(/F(\d)/).flatten.map { |i| i.to_i - 1 }
  end

  def self.get_placeholders(tmpl)
    tmpl.scan /F\d/
  end
end

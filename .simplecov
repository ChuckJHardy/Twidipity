SimpleCov.configure do
  minimum_coverage 98

  start('rails') do
    formatter SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter
    ]

    add_group "Long files" do |src_file|
      src_file.lines.count > 100
    end
  end
end

namespace :add do
  desc "Add content to pages from html files"
  task content: :environment do
    dir = "db/pages"
    files = Dir.foreach(dir).select { |x| File.file?("#{dir}/#{x}") }
    slugs = files.map {|f| f.gsub(".html", "")}

    slugs.each do |slug|
      if page = Page.find_by(slug: slug)
        page.update(body: File.read("#{dir}/#{slug}.html"))
      end
    end
  end

end

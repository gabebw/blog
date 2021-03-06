xml.instruct!

xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.destination_path =~ /\.html/ && !(page.data.no_index == true) }.each do |page|
    xml.url do
      xml.loc "http://adarsh.io#{page.url}"
      xml.lastmod File.mtime(page.source_file).iso8601
      xml.changefreq page.data.changefreq || "weekly"
      xml.priority page.data.priority || "0.5"
    end
  end
end

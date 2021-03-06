module Ruhoh::Views::Helpers
  module Categories
    # Category dictionary
    def categories
      categories_url = nil
      [@ruhoh.to_url("categories"), @ruhoh.to_url("categories.html")].each { |url|
        categories_url = url and break if @ruhoh.db.routes.key?(url)
      }
      dict = {}
      @ruhoh.db.__send__(resource_name).each_value do |resource|
        Array(resource['categories']).each do |cat|
          cat = Array(cat).join('/')
          if dict[cat]
            dict[cat]['count'] += 1
          else
            dict[cat] = { 
              'count' => 1, 
              'name' => cat, 
              resource_name => [],
              'url' => "#{categories_url}##{cat}-ref"
            }
          end 

          dict[cat][resource_name] << resource['id']
        end
      end  
      dict["all"] = dict.each_value.map { |cat| cat }
      dict
    end
          
    # Convert single or Array of category ids (names) to category hash(es).
    def to_categories(sub_context)
      Array(sub_context).map { |id|
        categories[id] 
      }.compact
    end
  end
end
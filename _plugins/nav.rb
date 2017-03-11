module Navigation
  class Navigation < Jekyll::Generator
    def strip_leading(string, prefix)
      string = string.dup
      string[0..prefix.length-1] = '' if string.start_with? prefix
      return string
    end

    def strip_trailing(string, prefix)
      string = string.dup
      string[-prefix.length..-1] = '' if string.end_with? prefix
      return string
    end

    def order(node)
      @ordered_modules.push(node)

      children = @modules.find_all { |page| (page.permalink.start_with? node.permalink) && strip_leading(page.permalink, node.permalink).count('/') == 1 }
      children.sort_by! { |child| child.data['order'] }

      children.each do |child|
        child.data['parent'] = node
        order(child)
      end

      node.data['children'] = children
    end

    def generate(site)
      @ordered_modules = []
      @modules = site.collections['modules'].docs

      @modules.each do |page|
        page.data['permalink'] = strip_leading(strip_trailing(strip_trailing(page.url, '/index.html'), '.html'), '/modules') + '/'
      end

      root = @modules.find { |page| page.permalink == '/' }
      order(root)

      for i in 0..@ordered_modules.length-1
        @ordered_modules[i].data['previous_module'] = @ordered_modules[i-1] if i > 0
        @ordered_modules[i].data['next_module'] = @ordered_modules[i+1] if i < @ordered_modules.length-1
      end
    end
  end
end

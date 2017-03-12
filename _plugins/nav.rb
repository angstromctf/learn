module Navigation
  class Navigation < Jekyll::Generator
    # Strips a prefix from the beginning of a string if it's there
    def strip_leading(string, prefix)
      string = string.dup
      string[0..prefix.length-1] = '' if string.start_with? prefix
      return string
    end

    # Strips a suffix from the end of a string if it's there
    def strip_trailing(string, suffix)
      string = string.dup
      string[-suffix.length..-1] = '' if string.end_with? suffix
      return string
    end

    # Recursively orders all the nodes in the tree
    def order(node)
      # Add this node to the list of modules
      @ordered_modules.push(node)

      # Find this node's immediate children
      children = @modules.find_all { |page| (page.permalink.start_with? node.permalink) && strip_leading(page.permalink, node.permalink).count('/') == 1 }

      # Sort the children by the "order" parameters in their YAML
      children.sort_by! { |child| child.data['order'] }

      children.each do |child|
        # Annotate the child with information about its parent (this node)
        child.data['parent'] = node

        # Recursively order that child and its children
        order(child)
      end

      # Annotate the child with information about its children
      node.data['children'] = children
    end

    def generate(site)
      @ordered_modules = []

      # Retrieve the list of modules from Jekyll
      @modules = site.collections['modules'].docs

      @modules.each do |page|
        # Assign permalinks to each module, removing the leading /modules and the trailing .html, reassigning /<url>/index.html to /<url>, and adding a slash
        page.data['permalink'] = strip_leading(strip_trailing(strip_trailing(page.url, '/index.html'), '.html'), '/modules') + '/'
      end

      # Find the root module and order the modules starting from it
      site.config['root'] = @modules.find { |page| page.permalink == '/' }
      order(site.config['root'])

      # Annotate every module with information about its previous and next module in the sequence
      for i in 0..@ordered_modules.length-1
        @ordered_modules[i].data['previous_module'] = @ordered_modules[i-1] if i > 0
        @ordered_modules[i].data['next_module'] = @ordered_modules[i+1] if i < @ordered_modules.length-1
      end
    end
  end
end

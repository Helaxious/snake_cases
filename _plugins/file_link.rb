module Jekyll
  class FileLink < Liquid::Tag
    def initialize(tag_name, file_name, tokens)
      super
      @file_name = file_name.strip() || ""
      @get_folders_regex = /\/[^\/\s\.]*(?=\/)/  # get everything before the file name
      @get_file_name = /([^\/.\s]*)\.[^.\s]*$/ # get the file name excluding the extension
      @get_post_name = /[0-9]{4}-[0-9]{2}-[0-9]{2}-(.*)/ # gets only the post name, ignoring date
    end

    def make_url(url)
      # Removes any slashes from path and readds them in case of human error
      path = []
      for folder in url.flatten do
        folder_path = folder.split("/").select { |name| not name.empty? }
        path.push(*folder_path) if not folder_path.empty?
      end
      return path
    end

    def find_post_folder(post_folder, path, categories)
      # Recursively searches though folders for the post folder
      if path == nil
        path = []
      end
      if Dir.exists? post_folder
        return path
      end
      for folder in Dir.glob("*").select {|file| File.directory? file} do
        if categories.include? folder
          Dir.chdir(folder) do
            return find_post_folder(post_folder, path + [folder], categories)
          end
        end
      end
      return nil # If the folder wasn't found, return nil
    end

    def get_post_folder(baseurl, assets_folder, post_path)
      # Checks for folders that *might* contain the desired post folder, based on the folder
      # structure of the post given by the 'post_path' parameter.
      # If nothing matches, it just returns the file_path.

      post_name = post_path[-1]
      categories = post_path[0..-2].map { |name| name = name[1..-1] } # removing the underscores

      # Checking first the post's structure, to save computational time
      if Dir.exists? make_url([assets_folder, post_path]).join("/")
        return [baseurl, assets_folder, post_path]
      end

      Dir.chdir(assets_folder) do
        post_folder = find_post_folder(post_name, nil, categories)
        if post_folder
          path = make_url([baseurl, assets_folder, post_folder, post_name])
          return path
        end
      end

      # If the folder search didn't find the folder, just give the path back
      path = make_url([baseurl, assets_folder, post_path])
      return path
    end

    def render(context)
      site = context.registers[:site]
      page = context.registers[:page]

      baseurl = (site.config["baseurl"]) || ""
      assets_folder = (site.config["post_assets_folder"]) || "assets"

      # Get the post's folder structure in case it needs to give it to 'find_post_folder'
      post_file_name = page.relative_path.match(@get_file_name).captures[0]
      post_name = post_file_name.match(@get_post_name).captures[0]

      post_path = page.relative_path.scan(@get_folders_regex) + [post_name]

      post_folder = (page["assets_folder"] || page["assets"]) || post_path

      # If the post states where the assets_folder is, return it regardless if it exists or not
      if page["assets_folder"] or page["assets"]
        path = make_url([baseurl, assets_folder, post_folder, @file_name])
        file_path = "/" + path.join("/")
      else
        post_folder = get_post_folder(baseurl, assets_folder, post_folder)
        return "/" + make_url([post_folder, @file_name]).join("/")
      end
    end
  end
end

Liquid::Template.register_tag('file_link', Jekyll::FileLink)

namespace :schema do
  task update: :environment do
    github = Github.new
    20.times do |i|
      hash = github.search_repository(page: i)
    end

    # repository_names = hash['items'].map { |item| item["full_name"] }
    #
    # urls = repository_names.map { |repository| "https://raw.githubusercontent.com/#{repository}/master/db/schema.rb"}
    #
    # pp urls: urls
    # table_names = urls.flat_map do |url|
    #   schema = Schema.new(url)
    #   schema.table_names
    # end
    #
    # pp '------------'
    # pp table_names: table_names.sort
    # pp '------------'
    # pp user: table_names.grep(/.*User.*/)


    # urls = %w(
    #   https://raw.githubusercontent.com/gitlabhq/gitlabhq/master/db/schema.rb
    #   https://raw.githubusercontent.com/tootsuite/mastodon/master/db/schema.rb
    #   https://raw.githubusercontent.com/thepracticaldev/dev.to/master/db/schema.rb
    #   https://raw.githubusercontent.com/rapid7/metasploit-framework/master/db/schema.rb
    #   https://raw.githubusercontent.com/octobox/octobox/master/db/schema.rb
    #   https://raw.githubusercontent.com/thoughtbot/clearance/master/db/schema.rb
    #   https://raw.githubusercontent.com/ruby-china/homeland/master/db/schema.rb
    # )

    # repositories = %w(
    #   gitlabhq/gitlabhq
    #   tootsuite/mastodon
    #   thepracticaldev/dev.to
    #   rapid7/metasploit-framework
    #   octobox/octobox
    #   thoughtbot/clearance
    #   ruby-china/homeland
    # )

    # repositories = %w(
    #   alexpate/awesome-design-systems
    # )
    #
    # urls = repositories.map { |repository| "https://raw.githubusercontent.com/#{repository}/master/db/schema.rb"}
    #
    # table_names = urls.flat_map do |url|
    #   schema = Schema.new(url)
    #   schema.table_names
    # end
    # pp '------------'
    # pp table_names: table_names.sort
    # pp '------------'
    # pp user: table_names.grep(/.*User.*/)
  end
end

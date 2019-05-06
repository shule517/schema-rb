require 'net/http'

class Github
  def search_repository(page: 1)
    url = "https://api.github.com/search/repositories?q=topic:rails&sort=stars&order=desc&page=#{page}"
    search(url)
    url = "https://api.github.com/search/repositories?q=language:Ruby&sort=stars&order=desc&page=#{page}"
    search(url)
    url = "https://api.github.com/search/repositories?q=topic:ruby&sort=stars&order=desc&page=#{page}"
    search(url)
  end

  def search(url)
    source = fetch_source(url)
    hash = JSON.parse(source)

    hash['items'].each do |item|
      puts "----------------"

      next if Repository.where(id: item['id']).exists?
      repository = Repository.create! do |repository|
        repository.id = item['id']
        repository.name = item['name']
        repository.full_name = item['full_name']
        repository.description = item['description']
        repository.html_url = item['html_url']
        repository.pushed_at = item['pushed_at']
        repository.homepage = item['homepage']
        repository.stargazers_count = item['stargazers_count']
        repository.language = item['language']
        repository.rails = exists_db_schema?(repository.full_name)
        pp exists_db_schema?: exists_db_schema?(repository.full_name)
      end

      pp repository: repository
    end
  end

  def exists_db_schema?(repository_name)
    url = "https://raw.githubusercontent.com/#{repository_name}/master/db/schema.rb"
    fetch_source(url) =~ /ActiveRecord::Schema.define/
  end

  def fetch_source(url)
    uri = URI.parse(url)
    Net::HTTP.get(uri)
  end
end

require 'net/http'

class Github
  def search_repository(page: 1)
    # search(url)

    names = ["seven1m/onebody",
     "sudara/alonetone",
     "radiant/radiant",
     "thoughtbot/clearance",
     "publify/publify",
     "fatfreecrm/fat_free_crm",
     "linuxfrorg/linuxfr.org",
     "rubygems/rubygems.org",
     "elektronaut/sugar",
     "redbooth/teambox",
     "fs/rails-base",
     "expertiza/expertiza",
     "phoet/on_ruby",
     "activeadmin/demo.activeadmin.info",
     "TracksApp/tracks",
     "tomatoes-app/tomatoes",
     "rapid7/metasploit-framework",
     "gitlabhq/gitlabhq",
     "loomio/loomio",
     "doorkeeper-gem/doorkeeper-provider-app",
     "sectore/CafeTownsend-Angular-Rails",
     "natew/obtvse",
     "siwapp/siwapp",
     "codetriage/codetriage",
     "fjordllc/bootcamp",
     "lobsters/lobsters",
     "call4paperz/call4paperz",
     "openSUSE/osem",
     "gitlabhq/gitlab-ci",
     "apigy/selfstarter",
     "orientation/orientation",
     "openfoodfoundation/openfoodnetwork",
     "24pullrequests/24pullrequests",
     "ivaldi/brimir",
     "houndci/hound",
     "rubymonsters/speakerinnen_liste",
     "mateuszdw/qaror",
     "OWASP/railsgoat",
     "swanson/stringer",
     "Jellyfishboy/trado",
     "diowa/ruby2-rails4-bootstrap-heroku",
     "TheOdinProject/theodinproject",
     "iwasrobbed/Brevidy",
     "rails-girls-summer-of-code/rgsoc-teams",
     "tenex/rails-assets",
     "blairanderson/rails-hackernews-reddit-producthunt-clone",
     "glacials/splits-io",
     "vanderhoop/meta_pinger",
     "livoras/blog",
     "HuntBurdick/pushvendor",
     "peatio/peatio",
     "IcaliaLabs/furatto-rails-start-kit",
     "DefactoSoftware/Hours",
     "toshimaru/RailsTwitterClone",
     "ifmeorg/ifme",
     "globocom/GloboDNS",
     "heroku/ruby-getting-started",
     "annict/annict",
     "Netflix-Skunkworks/Scumblr",
     "qq99/muvee",
     "bigbinary/wheel",
     "librariesio/libraries.io",
     "autolab/Autolab",
     "eliotsykes/rspec-rails-examples",
     "vdaubry/github-awards",
     "adamcooke/staytus",
     "helpyio/helpy",
     "madeintandem/jsonb_accessor",
     "mackuba/sparkler",
     "education/classroom",
     "railslink/railslink",
     "jp7internet/rails-apz",
     "consul/consul",
     "coreinfrastructure/best-practices-badge",
     "scaffeinate/socify",
     "arvinwiyono/airbnb-clone",
     "gauravtiwari/relay-rails-blog",
     "spark-solutions/spark-starter-kit",
     "ryuzee/SlideHub",
     "biglovisa/creact",
     "hibiken/stories",
     "codervault/codervault",
     "wikitongues/poly",
     "Eric-Guo/wechat-starter",
     "tootsuite/mastodon",
     "rossta/serviceworker-rails-sandbox",
     "randy-girard/app_perf",
     "m0nad/HellRaiser",
     "minio/doctor",
     "adlerhsieh/interview",
     "vasilakisfil/rails5_api_tutorial",
     "Fuzzapi/fuzzapi",
     "PENGZhaoqing/HousePricing",
     "archonic/limestone",
     "ntamvl/rails_5_api_tutorial",
     "Betterment/test_track",
     "ledermann/docker-rails",
     "MatthieuSegret/graphql-rails-blog",
     "pivorakmeetup/pivorak-web-app",
     "thepracticaldev/dev.to",
     "dreamingechoes/adminlte-rails-template",
     "eggmantv/master_rails_by_actions",
     "octobox/octobox",
     "gauravtiwari/rails-webpacker",
     "BenjaminKim/awesome-blogs",
     "rlafranchi/pong",
     "learnetto/calreact",
     "kami-zh/repost",
     "mertbulan/RoRdit",
     "lockstep/rails_new",
     "atech/postal",
     "rubyforgood/diaper",
     "Calyhre/eshop-prices",
     "liaoziyang/stackneveroverflow",
     "howtographql/graphql-ruby",
     "rlafranchi/system_tester",
     "learnetto/reactchat",
     "syhsyh9696/javlibrary-rails",
     "pluosi/app-host",
     "snibox/snibox",
     "jetthoughts/vuejs-rails-5-starterkit",
     "yhirano55/ama",
     "ziptofaf/gdpr-rails",
     "kickstarter/event-sourcing-rails-todo-app-demo",
     "plugine/wei",
     "rhardih/pong",
     "thebluedoc/bluedoc"]

    names.each do |name|
      url = "https://api.github.com/search/repositories?q=#{name}&sort=stars&order=desc&page=1&per_page=1"
      search(url)
    end

    # url = "https://api.github.com/search/repositories?q=topic:rails&sort=stars&order=desc&page=#{page}"
    # search(url)
    # url = "https://api.github.com/search/repositories?q=language:Ruby&sort=stars&order=desc&page=#{page}"
    # search(url)
    # url = "https://api.github.com/search/repositories?q=topic:ruby&sort=stars&order=desc&page=#{page}"
    # search(url)

    # url = "https://api.github.com/search/repositories?q=rails&sort=stars&order=desc&page=#{page}"
    # search(url)
    # url = "https://api.github.com/search/repositories?q=ruby&sort=stars&order=desc&page=#{page}"
    # search(url)
  end

  def search(url)
    source = fetch_source(url)
    hash = JSON.parse(source)

    if hash['items'].blank?
      puts "error:hash['items'].blank?-------------------"
      pp hash: hash
      puts "-----------"
      pp source: source
      puts "-----------"
      pp url: hash
      return
    end

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
    uri = URI.parse("#{url}&client_id=#{ENV['GITHUB_CLIENT_ID']}&client_secret=#{ENV['GITHUB_CLIENT_SECRET']}")
    Net::HTTP.get(uri)
  end
end

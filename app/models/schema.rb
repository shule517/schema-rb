# # require 'net/http'
# # url = 'https://raw.githubusercontent.com/gitlabhq/gitlabhq/master/db/schema.rb'
# # uri = URI.parse(url)
# #
# # source = Net::HTTP.get(uri)
# #
# # puts source: source
# #
# # class Table
# #   attr_accessor :table_name
# #
# #   def initialize(table_name)
# #     @table_name = table_name
# #   end
# #
# #   %i(integer string date datetime text boolean time datetime_with_timezone decimal bigint float binary jsonb).each do |method_name|
# #     define_method(method_name) do |name, options = {}|
# #       puts "#{table_name}.#{name}"
# #     end
# #   end
# #
# #   def index(column_name, options = {})
# #   end
# # end
# #
# # def enable_extension(path)
# # end
# #
# # def create_table(table_name, comment: nil, **options)
# #   table = Table.new(table_name)
# #   yield(table)
# # end
# #
# # def add_foreign_key(from_table, to_table, options = {})
# # end
# #
# # module ActiveRecord
# #   def enable_extension
# #   end
# #
# #   class Schema
# #     def self.define(version:)
# #       yield
# #     end
# #   end
# # end
# #
# # eval(source)
#
#
# module SchemaEx
#   refine ActiveRecord::Schema do
#     class << ActiveRecord::Schema
#       def self.define(version:)
#         yield
#       end
#     end
#   end
#
#   # refine ActiveRecord::ConnectionAdapters::TableDefinition do
#   #   %i(integer string date datetime text boolean time datetime_with_timezone decimal bigint float binary jsonb).each do |method_name|
#   #     define_method(method_name) do |column_name, options = {}|
#   #       puts "#{name}.#{column_name}"
#   #     end
#   #   end
#   #
#   #   def index(column_name, options = {})
#   #     # puts "--------index------------"
#   #     # puts column_name: column_name
#   #     # puts options: options
#   #   end
#   # end
#   #
#   # # refine ActiveRecord::ConnectionAdapters::AbstractAdapter do
#   # #   def create_table(table_name, comment: nil, **options)
#   # #     puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
#   # #   end
#   # # end
# end
#
# using SchemaEx
#
# # module ActiveRecord::ConnectionAdapters::SchemaStatements
# #   def create_table(table_name, comment: nil, **options)
# #     puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
# #   end
# # end
#
# class Table
#   attr_accessor :table_name
#
#   def initialize(table_name)
#     @table_name = table_name
#   end
#
#   %i(integer string date datetime text boolean time datetime_with_timezone decimal bigint float binary jsonb).each do |method_name|
#     define_method(method_name) do |name, options = {}|
#       puts "#{table_name}.#{name}"
#     end
#   end
#
#   def index(column_name, options = {})
#   end
# end
#
# class ActiveRecord::ConnectionAdapters::AbstractAdapter
#   def create_table(table_name, comment: nil, **options)
#     table = Table.new(table_name)
#     yield(table)
#   end
# end
#
# class << ActiveRecord::Schema
#   def self.define(version:)
#     yield
#   end
# end
#
#
#
# # class ActiveRecord::Schema
# #   def self.define(info = {}, &block)
# #     puts "ooooooooooooooooooooo"
# #   end
# # end

require 'net/http'

class Schema
  attr_accessor :source, :url

  def initialize(url)
    @url = url
    @source = fetch_source(url)
  end

  def table_names
    tables = source.scan(/create_table.*?^[ ]+end/m)

    table_names = tables.map do |table|
      matches = table.match(/create_table[ ]+["']([a-z0-9_]+)["']/)
      if matches.blank?
        pp 'error---------------'
        pp table: table
        pp "!!!!!!!!!!!!!!!!!!!!!!!1"
        pp url: url
        next
      end
      table_name = matches.captures.first
    end
    table_names.map(&:classify)
  end

  def fetch_source(url)
    uri = URI.parse(url)
    Net::HTTP.get(uri)
  end
end

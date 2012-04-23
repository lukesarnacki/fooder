YAML::ENGINE.yamler = 'syck'

class Fixtories

  TABLE_MAPPINGS = {"website_accounts" => "Website::Account"}

  require 'factory_girl_rails'

  cattr_accessor :fixtories, :class_names
  self.fixtories = Hash.new { |hash, key| hash[key] = {} }
  self.class_names = {}

  def initialize(type, options = {})
    @type = type.to_s
    @options = {}
  end

  def self.define(type, options ={})
    define_method type do |name|
      self.class.fixtories[type.to_s][name.to_s].reload
    end
    class_names[type] = options[:class_name]

    yield new(type, options)
  end

  def create(name, attributes)
    self.class.fixtories[@type][name.to_s] = Factory.create @type, attributes.merge(:created_at => Time.now.to_date, :updated_at => Time.now.to_date)
  end

  def self.generate
    table_names = ActiveRecord::Base.connection.tables - ["schema_migrations"]

    table_names.each do |table_name|
      objects = fixtories[table_name.singularize]

      ids = objects.map { |k, v| v.id }

      begin
        klass = TABLE_MAPPINGS[table_name] || class_names[table_name.singularize.to_sym] || table_name.singularize.classify

        klass.constantize.where("id not in (#{ids.blank? ? 0 : ids.join(',')})").each do |object|
          objects["#{table_name}_#{object.id}"] = object
        end
      rescue NameError
      end
    end

    fixtories.each do |type, objects|
      objects.each do |name, object|
        fixtories[type][name] = object.reload.attributes
      end
    end

    fixtories.each do |type, objects|
      file_name = class_names[type.to_sym] ? class_names[type.to_sym].underscore : type
      file_path = Rails.root.join("spec/fixtures/#{file_name.pluralize}.yml")
      FileUtils.makedirs(File.dirname(file_path))

      File.open( file_path, 'w' ) do |file|
        file.write(objects.to_yaml)
      end
    end
  end
end

actions :create, :delete

default_action :create

attribute :template, :kind_of => [String, NilClass]
attribute :name, :kind_of => [String, NilClass]
attribute :conf_name, :kind_of => [String, NilClass]
attribute :block, :kind_of => [String, Array, NilClass]

def initialize(*args)
    super
    @action = :create
end

module Ruhoh::Resources::Data
  class Collection < Ruhoh::Resources::Base::Collection
    def generate
      Ruhoh::Utils.parse_yaml_file(@ruhoh.paths.base, "data.yml") || {}
    end
  end
end
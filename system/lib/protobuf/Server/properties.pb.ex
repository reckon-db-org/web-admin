defmodule Reckondb.Protobuf.Server.Properties.PropertiesValuesEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Reckondb.Protobuf.DynamicValue
end

defmodule Reckondb.Protobuf.Server.Properties do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :properties_values, 1,
    repeated: true,
    type: Reckondb.Protobuf.Server.Properties.PropertiesValuesEntry,
    json_name: "propertiesValues",
    map: true
end

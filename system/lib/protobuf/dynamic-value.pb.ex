defmodule Reckondb.Protobuf.DynamicValue do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  oneof :kind, 0

  field :null_value, 1,
    type: Google.Protobuf.NullValue,
    json_name: "nullValue",
    enum: true,
    oneof: 0

  field :int32_value, 2, type: :sint32, json_name: "int32Value", oneof: 0
  field :int64_value, 3, type: :sint64, json_name: "int64Value", oneof: 0
  field :bytes_value, 4, type: :bytes, json_name: "bytesValue", oneof: 0
  field :double_value, 5, type: :double, json_name: "doubleValue", oneof: 0
  field :float_value, 6, type: :float, json_name: "floatValue", oneof: 0
  field :string_value, 7, type: :string, json_name: "stringValue", oneof: 0
  field :boolean_value, 8, type: :bool, json_name: "booleanValue", oneof: 0

  field :timestamp_value, 9,
    type: Google.Protobuf.Timestamp,
    json_name: "timestampValue",
    oneof: 0

  field :duration_value, 10, type: Google.Protobuf.Duration, json_name: "durationValue", oneof: 0
end

defmodule Reckondb.Protobuf.DynamicValueList do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :values, 1, repeated: true, type: Reckondb.Protobuf.DynamicValue
end

defmodule Reckondb.Protobuf.DynamicValueMap.ValuesEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Reckondb.Protobuf.DynamicValue
end

defmodule Reckondb.Protobuf.DynamicValueMap do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :values, 1, repeated: true, type: Reckondb.Protobuf.DynamicValueMap.ValuesEntry, map: true
end

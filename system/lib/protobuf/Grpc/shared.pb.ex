defmodule Reckondb.Client.UUID.Structured do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :most_significant_bits, 1, type: :int64, json_name: "mostSignificantBits"
  field :least_significant_bits, 2, type: :int64, json_name: "leastSignificantBits"
end

defmodule Reckondb.Client.UUID do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  oneof :value, 0

  field :structured, 1, type: Reckondb.Client.UUID.Structured, oneof: 0
  field :string, 2, type: :string, oneof: 0
end

defmodule Reckondb.Client.Empty do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.StreamIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :stream_name, 3, type: :bytes, json_name: "streamName"
end

defmodule Reckondb.Client.AllStreamPosition do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :commit_position, 1, type: :uint64, json_name: "commitPosition"
  field :prepare_position, 2, type: :uint64, json_name: "preparePosition"
end

defmodule Reckondb.Client.WrongExpectedVersion do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  oneof :current_stream_revision_option, 0

  oneof :expected_stream_position_option, 1

  field :current_stream_revision, 1, type: :uint64, json_name: "currentStreamRevision", oneof: 0
  field :current_no_stream, 2, type: Google.Protobuf.Empty, json_name: "currentNoStream", oneof: 0
  field :expected_stream_position, 3, type: :uint64, json_name: "expectedStreamPosition", oneof: 1
  field :expected_any, 4, type: Google.Protobuf.Empty, json_name: "expectedAny", oneof: 1

  field :expected_stream_exists, 5,
    type: Google.Protobuf.Empty,
    json_name: "expectedStreamExists",
    oneof: 1

  field :expected_no_stream, 6,
    type: Google.Protobuf.Empty,
    json_name: "expectedNoStream",
    oneof: 1
end

defmodule Reckondb.Client.AccessDenied do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.StreamDeleted do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :stream_identifier, 1,
    type: Reckondb.Client.StreamIdentifier,
    json_name: "streamIdentifier"
end

defmodule Reckondb.Client.Timeout do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.Unknown do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.InvalidTransaction do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.MaximumAppendSizeExceeded do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :maxAppendSize, 1, type: :uint32
end

defmodule Reckondb.Client.MaximumAppendEventSizeExceeded do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :eventId, 1, type: :string
  field :proposedEventSize, 2, type: :uint32
  field :maxAppendEventSize, 3, type: :uint32
end

defmodule Reckondb.Client.BadRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :message, 1, type: :string
end

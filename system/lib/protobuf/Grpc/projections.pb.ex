defmodule Reckondb.Client.Projections.CreateReq.Options.Transient do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
end

defmodule Reckondb.Client.Projections.CreateReq.Options.Continuous do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
  field :emit_enabled, 2, type: :bool, json_name: "emitEnabled"
  field :track_emitted_streams, 3, type: :bool, json_name: "trackEmittedStreams"
end

defmodule Reckondb.Client.Projections.CreateReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  oneof :mode, 0

  field :one_time, 1, type: Reckondb.Client.Empty, json_name: "oneTime", oneof: 0
  field :transient, 2, type: Reckondb.Client.Projections.CreateReq.Options.Transient, oneof: 0
  field :continuous, 3, type: Reckondb.Client.Projections.CreateReq.Options.Continuous, oneof: 0
  field :query, 4, type: :string
end

defmodule Reckondb.Client.Projections.CreateReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.CreateReq.Options
end

defmodule Reckondb.Client.Projections.CreateResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.Projections.UpdateReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  oneof :emit_option, 0

  field :name, 1, type: :string
  field :query, 2, type: :string
  field :emit_enabled, 3, type: :bool, json_name: "emitEnabled", oneof: 0
  field :no_emit_options, 4, type: Reckondb.Client.Empty, json_name: "noEmitOptions", oneof: 0
end

defmodule Reckondb.Client.Projections.UpdateReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.UpdateReq.Options
end

defmodule Reckondb.Client.Projections.UpdateResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.Projections.DeleteReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
  field :delete_emitted_streams, 2, type: :bool, json_name: "deleteEmittedStreams"
  field :delete_state_stream, 3, type: :bool, json_name: "deleteStateStream"
  field :delete_checkpoint_stream, 4, type: :bool, json_name: "deleteCheckpointStream"
end

defmodule Reckondb.Client.Projections.DeleteReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.DeleteReq.Options
end

defmodule Reckondb.Client.Projections.DeleteResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.Projections.StatisticsReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  oneof :mode, 0

  field :name, 1, type: :string, oneof: 0
  field :all, 2, type: Reckondb.Client.Empty, oneof: 0
  field :transient, 3, type: Reckondb.Client.Empty, oneof: 0
  field :continuous, 4, type: Reckondb.Client.Empty, oneof: 0
  field :one_time, 5, type: Reckondb.Client.Empty, json_name: "oneTime", oneof: 0
end

defmodule Reckondb.Client.Projections.StatisticsReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.StatisticsReq.Options
end

defmodule Reckondb.Client.Projections.StatisticsResp.Details do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :coreProcessingTime, 1, type: :int64
  field :version, 2, type: :int64
  field :epoch, 3, type: :int64
  field :effectiveName, 4, type: :string
  field :writesInProgress, 5, type: :int32
  field :readsInProgress, 6, type: :int32
  field :partitionsCached, 7, type: :int32
  field :status, 8, type: :string
  field :stateReason, 9, type: :string
  field :name, 10, type: :string
  field :mode, 11, type: :string
  field :position, 12, type: :string
  field :progress, 13, type: :float
  field :lastCheckpoint, 14, type: :string
  field :eventsProcessedAfterRestart, 15, type: :int64
  field :checkpointStatus, 16, type: :string
  field :bufferedEvents, 17, type: :int64
  field :writePendingEventsBeforeCheckpoint, 18, type: :int32
  field :writePendingEventsAfterCheckpoint, 19, type: :int32
end

defmodule Reckondb.Client.Projections.StatisticsResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :details, 1, type: Reckondb.Client.Projections.StatisticsResp.Details
end

defmodule Reckondb.Client.Projections.StateReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
  field :partition, 2, type: :string
end

defmodule Reckondb.Client.Projections.StateReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.StateReq.Options
end

defmodule Reckondb.Client.Projections.StateResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :state, 1, type: Google.Protobuf.Value
end

defmodule Reckondb.Client.Projections.ResultReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
  field :partition, 2, type: :string
end

defmodule Reckondb.Client.Projections.ResultReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.ResultReq.Options
end

defmodule Reckondb.Client.Projections.ResultResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :result, 1, type: Google.Protobuf.Value
end

defmodule Reckondb.Client.Projections.ResetReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
  field :write_checkpoint, 2, type: :bool, json_name: "writeCheckpoint"
end

defmodule Reckondb.Client.Projections.ResetReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.ResetReq.Options
end

defmodule Reckondb.Client.Projections.ResetResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.Projections.EnableReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
end

defmodule Reckondb.Client.Projections.EnableReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.EnableReq.Options
end

defmodule Reckondb.Client.Projections.EnableResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.Projections.DisableReq.Options do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
  field :write_checkpoint, 2, type: :bool, json_name: "writeCheckpoint"
end

defmodule Reckondb.Client.Projections.DisableReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :options, 1, type: Reckondb.Client.Projections.DisableReq.Options
end

defmodule Reckondb.Client.Projections.DisableResp do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Reckondb.Client.Projections.Projections.Service do
  @moduledoc false

  use GRPC.Service,
    name: "reckondb.client.projections.Projections",
    protoc_gen_elixir_version: "0.14.1"

  rpc :Create, Reckondb.Client.Projections.CreateReq, Reckondb.Client.Projections.CreateResp

  rpc :Update, Reckondb.Client.Projections.UpdateReq, Reckondb.Client.Projections.UpdateResp

  rpc :Delete, Reckondb.Client.Projections.DeleteReq, Reckondb.Client.Projections.DeleteResp

  rpc :Statistics,
      Reckondb.Client.Projections.StatisticsReq,
      stream(Reckondb.Client.Projections.StatisticsResp)

  rpc :Disable, Reckondb.Client.Projections.DisableReq, Reckondb.Client.Projections.DisableResp

  rpc :Enable, Reckondb.Client.Projections.EnableReq, Reckondb.Client.Projections.EnableResp

  rpc :Reset, Reckondb.Client.Projections.ResetReq, Reckondb.Client.Projections.ResetResp

  rpc :State, Reckondb.Client.Projections.StateReq, Reckondb.Client.Projections.StateResp

  rpc :Result, Reckondb.Client.Projections.ResultReq, Reckondb.Client.Projections.ResultResp

  rpc :RestartSubsystem, Reckondb.Client.Empty, Reckondb.Client.Empty
end

defmodule Reckondb.Client.Projections.Projections.Stub do
  @moduledoc false

  use GRPC.Stub, service: Reckondb.Client.Projections.Projections.Service
end

defmodule Mix.Tasks.Gen.Protobuf do
  use Mix.Task
  @shortdoc "Generates Elixir code from protobuf definitions"

  @impl true
  def run(_args) do
    # Get the umbrella project root
    umbrella_root = File.cwd!()
    
    # Build paths relative to the umbrella root
    base_path = Path.join([umbrella_root, "apps", "web_admin", "protobuf"])
    proto_files = [
      # Core types first
      "Grpc/shared.proto",
      "dynamic-value.proto",
      # Then dependent types
      "Server/properties.proto",
      "ClientAPI/ClientMessageDtos.proto",
      "Grpc/projections.proto"
    ]

    output_path = Path.join(umbrella_root, "lib/protobuf")
    File.mkdir_p!(output_path)

    result = System.cmd("protoc",
      [
        "--elixir_out=plugins=grpc:#{output_path}",
        "-I", base_path,
        "-I", "/usr/include"
      ] ++ Enum.map(proto_files, &Path.join(base_path, &1)),
      stderr_to_stdout: true
    )

    case result do
      {_, 0} -> 
        Mix.shell().info([:green, "Successfully generated protobuf code in #{output_path}"])
      {output, _} -> 
        Mix.shell().error("Failed to generate protobuf code: #{output}")
    end
  end
end

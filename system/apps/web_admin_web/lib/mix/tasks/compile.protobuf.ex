defmodule Mix.Tasks.Compile.Protobuf do
  use Mix.Task
  @shortdoc "Compiles protobuf definitions"
  @recursive true

  @recursive true
  @manifest_path Mix.Project.manifest_path()
  @manifest_file "compile.protobuf"

  def run(_args) do
    app_path = Path.join(File.cwd!(), "apps/web_admin")
    proto_path = Path.join(app_path, "protobuf")
    proto_files = [
      Path.join(proto_path, "dynamic-value.proto"),
      Path.join(proto_path, "Server/properties.proto"),
      Path.join(proto_path, "ClientAPI/ClientMessageDtos.proto"),
      Path.join(proto_path, "Grpc/projections.proto"),
      Path.join(proto_path, "Grpc/shared.proto")
    ]

    output_path = Path.join(File.cwd!(), "apps/web_admin_web/lib/protobuf")
    File.mkdir_p!(output_path)

    {_, 0} = System.cmd("protoc",
      [
        "--elixir_out=plugins=grpc:#{output_path}",
        "-I", proto_path,
        "-I", Path.join(proto_path, "Server"),
        "-I", Path.join(proto_path, "ClientAPI"),
        "-I", Path.join(proto_path, "Grpc")
      ] ++ proto_files)

    :ok
  end

  def manifests, do: [manifest_path()]

  def manifest_path, do: Path.join(@manifest_path, @manifest_file)

  def clean do
    File.rm_rf!("lib/protobuf")
    File.rm(manifest_path())
    :ok
  end
end

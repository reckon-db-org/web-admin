################# Variables ################
ARG ELIXIR_VERSION=1.17.3
ARG OTP_VERSION=27.0.1
ARG DEBIAN_VERSION=bookworm-20250630-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"
ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE} AS builder

# Install build dependencies
RUN apt-get update -y && \
  apt-get install -y pkg-config openssl curl build-essential git protobuf-compiler npm esbuild libc6 && \
  apt-get clean && rm -f /var/lib/apt/lists/*_*

# prepare build dir
WORKDIR /build_space

# install hex + rebar
RUN mix local.hex --force && \
  mix local.rebar --force

# install protoc-gen-elixir
RUN mix escript.install hex protobuf --force

# set build ENV
ARG MIX_ENV=prod
ENV MIX_ENV=prod

ENV OTPROOT=/usr/lib/erlang
ENV ERL_LIBS=/usr/lib/erlang/lib
ENV PATH="/root/.mix/escripts:${PATH}"

# copy umbrella configuration
COPY mix.exs mix.lock ./
COPY config/config.exs config/prod.exs config/runtime.exs config/

# copy umbrella apps
COPY apps/web_admin apps/web_admin/
COPY apps/web_admin_web apps/web_admin_web/

# install mix dependencies and generate protobuf code
RUN MIX_ENV="prod" mix do deps.get --only "prod", deps.compile
RUN MIX_ENV="prod" mix gen.protobuf

# build assets
RUN mix assets.deploy

# compile project
RUN MIX_ENV="prod" mix compile && \
  MIX_ENV="prod" mix release web_admin

########### RUNTIME ###############
# prepare release image
FROM ${RUNNER_IMAGE} AS web_admin

RUN apt-get update -y && \
  apt-get install -y libstdc++6 openssl libncurses5 locales ca-certificates libc6 curl && \
  apt-get clean && rm -f /var/lib/apt/lists/*_*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

WORKDIR /app

# Create directories
RUN mkdir -p /app/data

# Set ownership
RUN chown nobody /app
RUN chown nobody /app/data

# Copy release from builder
COPY --from=builder --chown=nobody /build_space/_build/prod/rel/web_admin .

USER nobody

ENV HOME=/app
ENV MIX_ENV="prod"

# Default environment variables
ENV SECRET_KEY_BASE="changeme"
ENV PORT="4000"

EXPOSE 4000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:4000/ || exit 1

ENTRYPOINT ["/app/bin/web_admin"]
CMD ["start"]

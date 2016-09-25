FROM msaraiva/elixir-dev:1.3.1
MAINTAINER Clayton Gentry <cg3ntry@gmail.com>

ADD . /app

WORKDIR /app

RUN mix local.hex --force && mix local.rebar --force

ENV PORT 4000

RUN mix clean
RUN mix deps.get
RUN mix deps.compile
RUN mix compile

EXPOSE 4000

CMD ["sh", "-c", "mix ecto.migrate; mix phoenix.server"]

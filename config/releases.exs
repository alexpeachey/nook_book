import Config

config :libcluster,
  topologies: [
    nook_book: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"nook_book@10.0.1.110",
          :"nook_book@10.0.1.154"
        ]
      ]
    ]
  ]

config :nook_book, cluster_role: System.get_env("CLUSTER_ROLE", "member") |> String.to_atom()

config :nook_book, NookBookWeb.Endpoint,
  server: true,
  http: [port: 4000],
  url: [host: "alex.nookbook.online"],
  secret_key_base: "3t5dqOhPDTZUCJu4HwDHWBNr6PYtX1Rgr/VBDgoqX80NZvWGkmD3YK/JhLpmHWu7"

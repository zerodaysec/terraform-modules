variable "domain" {
  type = string
}

variable "gh_token" {
  type = string
}

variable "repo_path" {
  type = string
  # Defaulted for Jekyll sites - set to / for failover
  # NOTE: This prevents us sharing / when we dont intend for source files to
  # be shared, but can explicitly be done if needed.
  default = "/docs"
}

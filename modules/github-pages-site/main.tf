terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.gh_token
}

resource "github_repository" "repo" {
  name               = var.domain
  archive_on_destroy = true
  # github_branch_default = "main" # Not working
  delete_branch_on_merge = true
  has_downloads          = false
  # Always private for these sites
  visibility           = "private"
  vulnerability_alerts = true
  #   pages {
  #     source {
  #       branch = "main"

  #       path = var.repo_path
  #     }
  #   }
}

# resource "github_repository" "repo_www" {
#   name = "www.${var.domain}"
#   archive_on_destroy = true
#   # github_branch_default = "main" # Not working
#   delete_branch_on_merge = true
#   has_downloads = false
#   # Always private for these sites
#   # private = true
#   visibility = "private"
#   vulnerability_alerts = true
#   # pages {
#   #   source {
#   #     branch = "main"

#   #     path = var.repo_path
#   #   }
#   # }
# }

# resource "github_repository" "repo_blog" {
#   name = "blog.${var.domain}"
#   archive_on_destroy = true
#   # github_branch_default = "main" # Not working
#   delete_branch_on_merge = true
#   has_downloads = false
#   # Always private for these sites
#   # private = true
#   visibility = "private"
#   vulnerability_alerts = true
#   # pages {
#   #   source {
#   #     branch = "main"

#   #     path = var.repo_path
#   #   }
#   # }
# }


# data "github_repositories" "example" {
#   query = "org:hashicorp language:Go"
# }

# data "github_repository" "example" {
#   full_name = "hashicorp/terraform"
# }

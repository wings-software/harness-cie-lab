terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

variable "account_id" {
  description = "The ID of the account."
  type        = string
}

variable "PAT" {
  description = "The Platform API key."
  type        = string
}

provider "harness" {
  endpoint   = "https://app.harness.io/gateway"
  account_id = var.account_id
  platform_api_key    = var.PAT
}


data "harness_platform_organization" "org" {
  identifier = "CSE_Labs"
}


data "harness_platform_project" "project" {
  identifier = "CSE_Lab_Project"
  org_id     = "CSE_Labs"
}

data "harness_platform_pipeline" "pipeline" {
  identifier = "testBBTrigger"
  org_id     = "CSE_Labs"
  project_id = "CSE_Lab_Project"
}


# Remote InputSet
resource "harness_platform_input_set" "test" {
  identifier = "test"
  name       = "test"
  org_id      = data.harness_platform_organization.org.id
  project_id  = data.harness_platform_project.project.id
  pipeline_id = data.harness_platform_pipeline.pipeline.id
  git_details {
    branch_name    = "main"
    commit_message = "Commit"
    file_path      = ".harness/test.yaml"
    connector_ref  = "austinbbcselabs"
    store_type     = "REMOTE"
    repo_name      = "harness-pr-test"
  }
  yaml = <<-EOT
inputSet:
  name: test
  tags: {}
  identifier: test
  orgIdentifier: CSE_Labs
  projectIdentifier: CSE_Lab_Project
  pipeline:
    identifier: testBBTrigger
    stages:
      - stage:
          identifier: run
          type: Custom
          variables:
            - name: test
              type: String
              default: a
              value: test
          when:
            condition: a

EOT
}

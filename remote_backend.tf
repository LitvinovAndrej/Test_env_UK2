terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "LRS"

    workspaces {
      name = "Test_env_UK_2"
    }
  }
}
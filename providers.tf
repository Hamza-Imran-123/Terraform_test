provider "aws" {
  region = var.region
}

provider "random" {
  # Optional provider for random strings, IDs, etc.
}

variable "token" {
  type        = string
  description = "Linode token"
}

variable "pools" {
  description = "The Node Pool specifications for the Kubernetes cluster."
  type = list(object({
    type  = string
    count = number
    min   = number
    max   = number
  }))
  default = [
    {
      type  = "g6-standard-1"
      count = 2
      min   = 2
      max   = 4
    },
    {
      type  = "g6-standard-2"
      count = 1
      min   = 1
      max   = 2
    }
  ]
}
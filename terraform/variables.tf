variable "username" {
  description = "The username for the DB master user"
  type        = string
  default     = "postgres"
}

variable "password" {
  description = "The password for the DB master user"
  type        = string
}

variable "name" {
  description = "The name of the database"
  type        = string
  default     = "production"
}

variable "port" {
  description = "The port which the database should run on"
  type        = number
  default     = 5432
}

variable "allocated_storage" {
  description = "The disk space to be allocated to the DB instance"
  type        = number
  default     = 5
}

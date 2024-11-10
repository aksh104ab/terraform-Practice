variable "SAName" {
  type = string
  default = "tfpractaks01"
}
variable "SATire" {
  type = string
  default = "Standard"
}
variable "SAReplicationT" {
  type = string
  default = "LRS"
}
variable "RGName" {
  default = "Tf-Practice-01"
}
variable "AzLocation" {
  type = string
  default = "westeurope"
}
variable "SAContainerNm" {
  type = string
  default = "tfstorstatef"
}
variable "SAContAccessTyp" {
  type = string
  default = "blob"
}
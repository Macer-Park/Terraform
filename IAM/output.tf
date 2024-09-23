output "tf02_image_id" {
 value = var.image_id
}

output "tf02_availability_zone_names" {
  value = var.avaialability_zone_names
}

output "tf02_ami_id_maps" {
  value = var.ami_id_maps
}

output "tf02_first_availability_zone_names" {
  value = var.avaialability_zone_names[0]
}
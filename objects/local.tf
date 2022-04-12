locals {

  # Color Code IDs
  geolocation_obj_color_id  = 9
  subnet_obj_color_id       = 3
  addressgroup_obj_color_id = 4
  fw_service_obj_color_id   = 2
  fw_service_obj_group_color_id = 5
  schedule_obj_color_id     = 12


  service_obj_groups = {
    File_sharing = {
      name      = "file share"
      iprange    = "0.0.0.0"
      proxy = "disable"
      comment = "File share group "
      member_srv = ["SMB", "FTP", "NFS", "TFTP", "FTP_OVER_TLS", "FTP_OVER_SSL","CIFS", "iSCSI"]
    }
  }
}
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
      comment = "File share group"
      member_srv = ["SMB", "FTP", "AFP","RTSP","NFS", "TFTP", "FTP_OVER_TLS", "FTP_OVER_SSL","CIFS", "iSCSI"]
    }
  }

  address_obj = {
    ntaddsfl1pp001 = {
      name      = "grp-ntaddsfl1pp001"
      subnet    = "192.168.100.5/24"
      interface = "vlan.0100"
    },
    ntaddsfl1pv001 = {
      name      = "grp-ntaddsfl1pv001"
      subnet    = "192.168.100.10/24"
      interface = "vlan.0100"
    }

  }

  address_groups = {
    adds = {
      name      = "grp-adds"
      comments  = "Active Directory Servers"
      address_objects = ["grp-ntaddsfl1pv001", "grp-ntaddsfl1pp001"]
    }

  }
  
}
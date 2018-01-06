# Template(Windows Userdata)
## ad01
data "template_file" "iw-ad001_template_file_ad01" {
	template = "${file("windows_userdata")}"

  vars {
    windows_admin_password = "${var.windows_admin_password}"
		windows_hostname = "${var.windows_hostname["ad01"]}"
  }
}
## ad02
data "template_file" "iw-ad001_template_file_ad02" {
	template = "${file("windows_userdata")}"

  vars {
    windows_admin_password = "${var.windows_admin_password}"
		windows_hostname = "${var.windows_hostname["ad02"]}"
  }
}
## client01
data "template_file" "iw-ad001_template_file_client01" {
	template = "${file("windows_userdata")}"

  vars {
    windows_admin_password = "${var.windows_admin_password}"
		windows_hostname = "${var.windows_hostname["client01"]}"
  }
}

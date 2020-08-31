# Copy all files to /vr/lib dir
resource "null_resource" "copy_jmx_files" {
  count = length(var.source)
  provisioner "file" {
    source      = var.source[count.index]
    destination = format("/var/lib/%s", basename(var.source[count.index]))

    connection {
      type        = "ssh"
      host        = var.host
      user        = var.user
      port        = var.port
      private_key = var.private_key
    }
  }
}

resource "time_static" "this" {}

resource "null_resource" "run_jmeter_loadtesting" {
  count = length(var.source)
  provisioner "remote-exec" {
    inline = [
      "/var/lib/apache-jmeter-5.3/bin/jmeter -n -t ${var.source[count.index]} -Dserver.rmi.ssl.disable=true -R ${var.slave_ips}  -l /usr/share/nginx/html/logfile${time_static.this.unix}.jtl -e -o /usr/share/nginx/html/${time_static.this.unix}-${count.index}",
    ]
    connection {
      type        = "ssh"
      host        = var.host
      user        = var.user
      port        = var.port
      private_key = var.private_key
    }
  }
}

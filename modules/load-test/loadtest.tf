# Copy all files to /vr/lib dir
resource "null_resource" "copy_jmx_files" {
  count = length(var.source_jmx)
  provisioner "file" {
    source      = var.source_jmx[count.index]
    destination = format("/home/${var.user}/%s", basename(var.source_jmx[count.index]))

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
  count = length(var.source_jmx)
  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /var/lib/apache-jmeter-5.3/bin/jmeter ]; do sleep 10; done",
      "sudo rm -rf /usr/share/nginx/html/logfile-${time_static.this.unix}.jtl",
      "sudo /var/lib/apache-jmeter-5.3/bin/jmeter -n -t /home/${var.user}/${basename(var.source_jmx[count.index])} -Dserver.rmi.ssl.disable=true -R ${var.slave_ips}  -l /usr/share/nginx/html/logfile-${time_static.this.unix}.jtl -e -o /usr/share/nginx/html/${replace(var.source_jmx[count.index],".","-")}-${time_static.this.unix}-${count.index}",
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

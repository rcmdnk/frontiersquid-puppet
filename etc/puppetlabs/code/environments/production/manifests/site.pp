$main_role = ""

node /^*squid*/ {
  $main_role = "squid"
  lookup('classes', Array[String], 'unique').include
}

node /^*cvmfs-px*/ {
  $main_role = "cvmfs"
  lookup('classes', Array[String], 'unique').include
}

node /^*conddb-px*/ {
  $main_role = "conddb"
  lookup('classes', Array[String], 'unique').include
}

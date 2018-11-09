$main_role = ""

node /^*cvmfs-px*/ {
  $main_role = "cvmfs"
  lookup('classes', Array[String], 'unique').include
}

node /^*conddb-px*/ {
  $main_role = "conddb"
  lookup('classes', Array[String], 'unique').include
}

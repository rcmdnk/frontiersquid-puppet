$main_role = ""

node /^*cvmfs-px*/ {
  $main_role = "cvmfs"
  lookup('classes', Array[String], 'unique').include
}

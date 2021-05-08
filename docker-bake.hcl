group "default" {
	targets = ["3.12-alpine", "3.11-alpine", "latest"]
}
target "common" {
	platforms = ["linux/amd64"]
	args = {"GOCRONVER" = "v0.0.9"}
}
# target "debian" {
# 	inherits = ["common"]
# 	dockerfile = "Dockerfile-debian"
# }
target "alpine" {
	inherits = ["common"]
	dockerfile = "Dockerfile-alpine"
}
target "latest" {
  inherits = ["alpine"]
	args = {"BASETAG" = "latest"}
  tags = ["akhilrs/postgres-backup:latest"]
}
target "3.12-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "3.12"}
  tags = ["akhilrs/postgres-backup:3.12-alpine"]
}
target "3.11-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "3.11"}
  tags = ["akhilrs/postgres-backup:3.11-alpine"]
}
target "latest-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "latest"}
  tags = ["akhilrs/postgres-backup:latest-alpine"]
}

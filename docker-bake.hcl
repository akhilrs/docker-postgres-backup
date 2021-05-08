group "default" {
	targets = ["12-alpine", "11-alpine", "10-alpine", "9.6-alpine", "9.5-alpine", "9.4-alpine", "latest"]
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
target "12-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "12"}
  tags = ["akhilrs/postgres-backup:12-alpine"]
}
target "11-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "11"}
  tags = ["akhilrs/postgres-backup:11-alpine"]
}
target "10-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "10"}
  tags = ["akhilrs/postgres-backup:10-alpine"]
}
target "9.6-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "9.6"}
  tags = ["akhilrs/postgres-backup:9.6-alpine"]
}
target "9.5-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "9.5"}
  tags = ["akhilrs/postgres-backup:9.5-alpine"]
}
target "9.4-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "9.4"}
  tags = ["akhilrs/postgres-backup:9.4-alpine"]
}
target "latest-alpine" {
  inherits = ["alpine"]
	args = {"BASETAG" = "latest"}
  tags = ["akhilrs/postgres-backup:latest-alpine"]
}

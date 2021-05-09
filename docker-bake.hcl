group "default" {
	targets = ["alpine-latest", "alpine-3.12", "alpine-3.11"]
}
target "common" {
	platforms = ["linux/amd64"]
	args = {"GOCRONVER" = "v0.0.9"}
}
target "alpine" {
	inherits = ["common"]
	dockerfile = "Dockerfile-alpine"
}
target "alpine-latest" {
	inherits = ["alpine"]
	args = {"BASETAG" = "3.13"}
	tags = [
		"akhilrs/postgres-backup:alpine",
		"akhilrs/postgres-backup:3.13-alpine"
	]
}
target "alpine-3.12" {
	inherits = ["alpine"]
	args = {"BASETAG" = "3.12"}
	tags = [
		"akhilrs/postgres-backup:3.12-alpine"
	]
}
target "alpine-3.11" {
	inherits = ["alpine"]
	args = {"BASETAG" = "3.11"}
	tags = [
		"akhilrs/postgres-backup:3.11-alpine"
	]
}

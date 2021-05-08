group "default" {
	targets = ["alpine-latest", "alpine-12", "alpine-11", "alpine-10", "alpine-9.6", "alpine-9.5"]
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
	args = {"BASETAG" = "13-alpine"}
	tags = [
		"akhilrs/postgres-backup:alpine",
		"akhilrs/postgres-backup:13-alpine"
	]
}
target "alpine-12" {
	inherits = ["alpine"]
	args = {"BASETAG" = "12-alpine"}
	tags = [
		"akhilrs/postgres-backup:12-alpine"
	]
}
target "alpine-11" {
	inherits = ["alpine"]
	args = {"BASETAG" = "11-alpine"}
	tags = [
		"akhilrs/postgres-backup:11-alpine"
	]
}
target "alpine-10" {
	inherits = ["alpine"]
	args = {"BASETAG" = "10-alpine"}
	tags = [
		"akhilrs/postgres-backup:10-alpine"
	]
}
target "alpine-9.6" {
	inherits = ["alpine"]
	args = {"BASETAG" = "9.6-alpine"}
	tags = [
		"akhilrs/postgres-backup:9.6-alpine"
	]
}
target "alpine-9.5" {
	inherits = ["alpine"]
	args = {"BASETAG" = "9.5-alpine"}
	tags = [
		"akhilrs/postgres-backup:9.5-alpine"
	]
}

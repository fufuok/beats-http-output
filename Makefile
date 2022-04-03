.PHONY: filebeat auditbeat heartbeat metricbeat packetbeat winlogbeat help

NOW=$(shell date -u '+%Y-%m-%dT%H:%M:%SZ')
COMMIT_ID=$(shell git rev-parse HEAD)
GOBUILD_FLAGS?=-ldflags "-s -w -X github.com/elastic/beats/v7/libbeat/version.buildTime=$(NOW) -X github.com/elastic/beats/v7/libbeat/version.commit=$(COMMIT_ID)"

all: filebeat auditbeat heartbeat metricbeat packetbeat winlogbeat

filebeat:
	go build $(GOBUILD_FLAGS) -o bin/filebeat_linux_amd64 filebeat/main.go

auditbeat:
	go build $(GOBUILD_FLAGS) -o bin/auditbeat_linux_amd64 auditbeat/main.go

heartbeat:
	go build $(GOBUILD_FLAGS) -o bin/heartbeat_linux_amd64 heartbeat/main.go

metricbeat:
	go build $(GOBUILD_FLAGS) -o bin/metricbeat_linux_amd64 metricbeat/main.go

packetbeat:
	go build $(GOBUILD_FLAGS) -o bin/packetbeat_linux_amd64 packetbeat/main.go

winlogbeat:
	go build $(GOBUILD_FLAGS) -o bin/winlogbeat_linux_amd64 winlogbeat/main.go

help:
	@echo make: compile packages and dependencies

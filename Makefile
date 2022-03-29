.PHONY: build filebeat auditbeat heartbeat metricbeat packetbeat winlogbeat help

NOW=$(shell date -u '+%Y-%m-%dT%H:%M:%SZ')
COMMIT_ID=$(shell git rev-parse HEAD)
GOBUILD_FLAGS?=-ldflags "-X github.com/elastic/beats/v7/libbeat/version.buildTime=$(NOW) -X github.com/elastic/beats/v7/libbeat/version.commit=$(COMMIT_ID)"

all: build

filebeat:
	go build $(GOBUILD_FLAGS) -o bin/filebeat filebeat/main.go

auditbeat:
	go build $(GOBUILD_FLAGS) -o bin/auditbeat auditbeat/main.go

heartbeat:
	go build $(GOBUILD_FLAGS) -o bin/heartbeat heartbeat/main.go

metricbeat:
	go build $(GOBUILD_FLAGS) -o bin/metricbeat metricbeat/main.go

packetbeat:
	go build $(GOBUILD_FLAGS) -o bin/packetbeat packetbeat/main.go

winlogbeat:
	go build $(GOBUILD_FLAGS) -o bin/winlogbeat winlogbeat/main.go

build:
	$(MAKE) filebeat
	$(MAKE) auditbeatt
	$(MAKE) heartbeatt
	$(MAKE) metricbeatt
	$(MAKE) packetbeatt
	$(MAKE) winlogbeatt

help:
	@echo make: compile packages and dependencies

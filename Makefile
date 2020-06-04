.PHONY: list
list:
	@sh -c "$(MAKE) -p no_targets__ 2>/dev/null | \
	awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | \
	grep -v Makefile | \
	grep -v '%' | \
	grep -v '__\$$' | \
	sort"

cmd/flag_string.go: cmd/flag.go
	go generate cmd/flag.go

.PHONY: build
build: cmd/flag_string.go
	go build

.PHONY: demo
demo: build
	 ./db insert --event-name demo --event-state start --release-version 0.0.0

.PHONY: clean
clean:
	rm -f ./db
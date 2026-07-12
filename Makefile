.PHONY: run build check_links check_orbstack

run: check_orbstack
	docker run --rm -ti -v $(PWD):/docs -p 8000:8000 squidfunk/mkdocs-material:9 serve --dev-addr=0.0.0.0:8000

build: check_orbstack
	docker run --rm -it -v $(PWD):/docs squidfunk/mkdocs-material:9 build

check_links: check_orbstack
	docker run --rm dcycle/broken-link-checker:3 https://recursos.compilersoft.es/

check_orbstack:
	@if ! docker info > /dev/null 2>&1; then \
		echo "OrbStack is not running. Starting OrbStack..."; \
		orbctl start; \
		echo "Waiting for OrbStack..."; \
		while ! docker info > /dev/null 2>&1; do \
			sleep 1; \
		done; \
	fi

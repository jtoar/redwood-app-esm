clean:
	git restore .
	git clean -fxd -e .env

install:
	yarn

migrate:
	yarn rw prisma migrate dev

seed:
	yarn rw prisma db seed

reset: clean install migrate seed
	yarn rw --version

upgrade: install
	yarn rw upgrade

# run
# ---

run-dev:
	yarn rw dev

run-build:
	yarn rw build --verbose

run-serve: run-build
	yarn rw serve

run-tests:
	yarn rw test --no-watch

run-tsc:
	yarn rw tsc

run-seed:
	yarn rw prisma db seed

run-prerender: run-build
	yarn rw prerender --verbose

# files
# -----

PACKAGE_JSONS=$(shell fd 'package.json')

open-package-jsons:
	code $(PACKAGE_JSONS)

sort-package-jsons:
	yarn dlx sort-package-json $(PACKAGE_JSONS)

TSCONFIG_JSON=$(shell fd 'tsconfig.json')

open-tsconfig-jsons:
	code $(TSCONFIG_JSON)

# framework
# ---------

CWD=$(shell pwd)

tarsync:
	cd $(RWFW_PATH) && \
		yarn node ./tasks/framework-tools/tarsync.mjs $(CWD) --verbose

reset_framework:
	cd $(RWFW_PATH) && \
		git clean -fxd -e .env && \
		yarn && \
		yarn build

reset_tarsync: reset reset_framework tarsync

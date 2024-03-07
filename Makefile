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

run-build:
	yarn rw build --verbose

run-check:
	yarn rw check

run-dev:
	yarn rw dev

run-exp:
	yarn rw exp setup-docker
	yarn rw exp setup-opentelemetry

run-info:
	yarn rw info

run-prisma:
	yarn rw prisma generate
	yarn rw prisma studio
	yarn rw prisma migrate dev

run-serve: run-build
	yarn rw serve

run-studio:
	yarn rw studio

run-tsc:
	yarn rw tsc

run-ts-to-js:
	yarn rw ts-to-js

run-upgrade:
	yarn rw upgrade

# ❓ tbd
# ------

run-setup:
	yarn rw setup

run-deploy:
	yarn rw deploy

# ❌ broken
# ---------

# ?
run-storybook:
	yarn rw storybook

# prettier
run-exp-setup-inngest:
	yarn rw exp setup-inngest

# if i rename prettier.config.js to prettier.config.cjs, it works
run-lint:
	yarn rw lint

# jest
run-tests:
	yarn rw test --no-watch

# babel register
run-console:
	yarn rw console

run-data-migrate:
	yarn rw data-migrate

run-exec:
	yarn rw exec

run-prerender: run-build
	yarn rw prerender --verbose

run-seed:
	yarn rw prisma db seed

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

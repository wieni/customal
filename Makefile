assets:=$(shell find scss -type f)
.PHONY: clean

css: package.json yarn.lock $(assets)
	$(MAKE) node_modules
	npm run build
	rm -rf node_modules
	touch css

node_modules: package.json yarn.lock
	yarn --pure-lockfile
	npm rebuild node-sass
	touch node_modules

clean:
	@- rm -rf node_modules

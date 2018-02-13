assets:=$(shell find css font icons -type f)
.PHONY: clean css

css: package.json yarn.lock $(assets)
	$(MAKE) node_modules
	npm run build
	rm -rf node_modules

node_modules: package.json yarn.lock
	yarn --pure-lockfile
	npm rebuild node-sass
	touch node_modules

clean:
	@- rm -rf node_modules

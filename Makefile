assets:=$(shell find resources -type f)
.PHONY: clean

public/resources: package.json package-lock.json $(assets)
	$(MAKE) node_modules
	npm run build
	rm -rf node_modules
	touch public/resources

node_modules: package.json package-lock.json
	npm ci
	touch node_modules

clean:
	@- rm -rf node_modules

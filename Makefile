assets:=$(shell find resources -type f)
.PHONY: clean

public/resources: package.json package-lock.json .nvmrc magic.config.js $(assets)
	$(MAKE) node_modules
	npm run build
	@rm -rf node_modules
	touch public/resources

node_modules: package.json package-lock.json .nvmrc
	npm ci --no-optional
	touch node_modules

package-lock.json:
	npm install
	touch package-lock.json

clean:
	@- rm -rf node_modules

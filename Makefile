VERSION := "0.3"

test: build
	@docker build -t broyal/md-secure-renderer-example:latest --build-arg KEY=test123 example/.
	@docker run -d -p 8080:8080 --name md-secure-renderer-example -e KEY=test123 broyal/md-secure-renderer-example:latest

cleanup:
	@docker rm -f md-secure-renderer-example

build:
	@docker build -t broyal/md-secure-renderer:latest app/.

release: build
	@docker tag broyal/md-secure-renderer:latest broyal/md-secure-renderer:$(VERSION)
	@docker push broyal/md-secure-renderer:latest
	@docker push broyal/md-secure-renderer:$(VERSION)

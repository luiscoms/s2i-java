
IMAGE_NAME = s2i-gradle

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app


.PHONY: clean
clean:
	# Remove image
	docker images --format "{{.Repository}}:{{.Tag}}" | grep $(IMAGE_NAME) && \
	 docker rmi --force $(docker images --format "{{.Repository}}:{{.Tag}}" | grep $(IMAGE_NAME)) \
	 || echo "Image $(IMAGE_NAME) not found"
	# Remove candidate image
	docker images --format "{{.Repository}}:{{.Tag}}" | grep $(IMAGE_NAME)-candidate && \
	 docker rmi --force $(docker images --format "{{.Repository}}:{{.Tag}}" | grep $(IMAGE_NAME)-candidate) \
	 || echo "Image $(IMAGE_NAME)-candidate not found"



IMAGE_NAME = s2i-java8-all

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app-mvn
	# IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app-mvnw
	# IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app-gradle
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run test-app-gradlew

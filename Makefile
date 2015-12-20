IMAGE = nginx
REPOSITORY_IMAGE = armhfbuild/nginx
ADDITIONAL_TAGS = 1.9 1.9.9

default: build tag

build:
	docker build -t $(IMAGE) .

tag:
	docker tag -f $(IMAGE) $(REPOSITORY_IMAGE)
	for tag in $(ADDITIONAL_TAGS); do \
		docker tag -f $(IMAGE) $(IMAGE):$$tag; \
		docker tag -f $(IMAGE) $(REPOSITORY_IMAGE):$$tag; \
	done

push:
	docker push $(REPOSITORY_IMAGE)
	for tag in $(ADDITIONAL_TAGS); do \
		docker push $(REPOSITORY_IMAGE):$$tag; \
	done

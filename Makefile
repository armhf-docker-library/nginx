IMAGE_NAME = mazzolino/armhf-nginx

default:
	docker build -t $(IMAGE_NAME) .
	docker tag -f $(IMAGE_NAME) $(IMAGE_NAME):1.7.10
	docker tag -f $(IMAGE_NAME) $(IMAGE_NAME):1.7
	docker tag -f $(IMAGE_NAME) $(IMAGE_NAME):1
	docker push $(IMAGE_NAME)

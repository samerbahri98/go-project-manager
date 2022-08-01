default:
	make up

.PHONY: network-up
network-up:
	docker network create go-project-manager

.PHONY: network-down
network-down:
	docker network rm go-project-manager

.PHONY: minio-up
minio-up:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/minio up -d

.PHONY: minio-down
minio-down:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/minio down --volumes

.PHONY: mysql-up
mysql-up:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/mysql up -d

.PHONY: mysql-down
mysql-down:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/mysql down --volumes

.PHONY: redis-up
redis-up:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/redis up -d

.PHONY: redis-down
redis-down:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/redis down --volumes

.PHONY: ldap-up
ldap-up:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/ldap up -d

.PHONY: ldap-down
ldap-down:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/ldap down --volumes

.PHONY: keycloak-up
keycloak-up:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/keycloak up -d

.PHONY: keycloak-down
keycloak-down:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/keycloak down --volumes

.PHONY: envoyproxy-up
envoyproxy-up:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/envoyproxy up -d

.PHONY: envoyproxy-down
envoyproxy-down:
	/usr/libexec/docker/cli-plugins/docker-compose --env-file ./.env --project-directory ./third_party/envoyproxy down

.PHONY: up
up:
	make network-up && \
	make minio-up && \
	make mysql-up && \
	make redis-up && \
	make ldap-up && \
	make keycloak-up && \
	make envoyproxy-up

.PHONY: down
down:
	make minio-down && \
	make mysql-down && \
	make redis-down && \
	make keycloak-down && \
	make ldap-down && \
	make envoyproxy-down && \
	make network-down

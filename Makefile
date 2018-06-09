all:
	docker build -t klrkdekira/nim-alpine-starter .
clean:
	rm -rfv nim_alpine_starter src/nimcache

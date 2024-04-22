phony: build_web


build_web:
	flutter build web --release --web-renderer canvaskit


deploy_web:
	make build_web && firebase deploy --only hosting
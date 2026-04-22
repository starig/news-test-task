generate:
	flutter pub run build_runner build --delete-conflicting-outputs

watch:
	flutter pub run build_runner watch

slang:
	flutter pub run slang

clean:
	flutter clean
	yes | flutter pub cache clean
	flutter pub get

.PHONY: generate watch slang clean
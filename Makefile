.PHONY: default proto l10n gen-hive

all: l10n

default: l10n

# enable protobuf: `flutter pub global activate protoc_plugin`
# and `export PATH=$PATH:$HOME/.pub-cache/bin`

proto:
	protoc --proto_path=proto/ --dart_out=grpc:lib/Services/proto proto/bragi/bragi.proto

l10n:
	fvm flutter gen-l10n

gen-hive:
	fvm flutter packages pub run build_runner build

run:
	fvm flutter run --debug

clean:
	fvm flutter clean
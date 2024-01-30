.PHONY: default proto l10n gen-hive

all: l10n

default: l10n

l10n:
	fvm flutter gen-l10n

gen-hive:
	fvm flutter packages pub run build_runner build

run:
	fvm flutter run --debug

clean:
	fvm flutter clean
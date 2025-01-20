# Makefile

# Variables
PHPCS=vendor/bin/phpcs
PHPCBF=vendor/bin/phpcbf
PHPSTAN=vendor/bin/phpstan
ESLINT=node_modules/.bin/eslint

# Dossiers à analyser
PHP_SRC=src
JS_SRC=public/assets # Changez ceci selon l'emplacement de vos fichiers JavaScript

# Cibles
.PHONY: all phpcs phpcs-fix phpstan eslint eslint-fix clean

all: phpcs phpcs-fix phpstan eslint eslint-fix

phpcs:
	@echo "Exécution de PHP_CodeSniffer..."
	$(PHPCS) --standard=phpcs.xml $(PHP_SRC)

phpcs-fix:
	@echo "Correction automatique des problèmes avec PHP_CodeSniffer..."
	$(PHPCBF) --standard=phpcs.xml $(PHP_SRC)

phpstan:
	@echo "Exécution de PHPStan..."
	$(PHPSTAN) analyse -c phpstan.neon

eslint:
	@echo "Exécution d'ESLint..."
	$(ESLINT) $(JS_SRC)

eslint-fix:
	@echo "Correction automatique des problèmes avec ESLint..."
	$(ESLINT) --fix $(JS_SRC)

define PRINT_HELP_PYSCRIPT
import re, sys

print("make option")
print("  --option:")
for line in sys.stdin:
    match = re.match(r'^([0-9a-zA-Z_-]+):.*?## (.*)$$', line)
    if match:
        target, help = match.groups()
        print("    {:<20}{}".format(target, help))
endef
export PRINT_HELP_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"

help: ## 帮助
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)


run-os2: ## 运行os2
	bash ./os2/run.sh

clean: clean-os1 ## 清理所有不该进代码库的文件

clean-os1: ## 清理 Python 运行文件
	find . -name '*.img' -exec rm -f {} +
	find . -name '*.img.lock' -exec rm -f {} +
	find . -name 'boot.bin' -exec rm -f {} +
	find . -name 'bochsout.txt' -exec rm -f {} +

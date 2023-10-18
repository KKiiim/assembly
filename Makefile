WAT2WASM = wat2wasm
WASM_DIR = wasm-practice

all: sum-n add2num abs_if qsort

.PHONY: sum-n
sum-n:
	$(WAT2WASM) $(WASM_DIR)/sum-n/t_sumn.wat -o $(WASM_DIR)/sum-n/mysum_n.wasm

.PHONY: add2num
add2num:
	$(WAT2WASM) $(WASM_DIR)/add2num/t_add.wat -o $(WASM_DIR)/add2num/mysum.wasm

.PHONY: abs_if
abs_if:
	$(WAT2WASM) $(WASM_DIR)/abs_if/t_abs.wat -o $(WASM_DIR)/abs_if/myabs.wasm

.PHONY: qsort
qsort:
	$(WAT2WASM) $(WASM_DIR)/qsort/t_qqsort.wat -o $(WASM_DIR)/qsort/myqsort.wasm

clean:
	rm -f $(WASM_DIR)/*/my*.wasm
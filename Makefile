WAT2WASM = wat2wasm
WAT_DIR = src
WASM_DIR = build


all: sum-n add2num abs_if qsort

.PHONY: sum-n
sum-n:
	$(WAT2WASM) $(WAT_DIR)/t_sumn.wat -o $(WASM_DIR)/mysum_n.wasm

.PHONY: add2num
add2num:
	$(WAT2WASM) $(WAT_DIR)/t_add.wat -o $(WASM_DIR)/mysum.wasm

.PHONY: abs_if
abs_if:
	$(WAT2WASM) $(WAT_DIR)/t_abs.wat -o $(WASM_DIR)/myabs.wasm

.PHONY: qsort
qsort:
	$(WAT2WASM) $(WAT_DIR)/t_qqsort.wat -o $(WASM_DIR)/myqsort.wasm

clean:
	rm -f $(WASM_DIR)/my*.wasm
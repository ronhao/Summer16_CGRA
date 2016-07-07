ln -fs /work/zhang/users/liu/rocket-chip/riscv-tools/riscv-tests/benchmarks/sample.riscv.hex output/sample.riscv.hex
./simv-Top-SampleCPPConfig -q +ntb_random_seed_automatic +dramsim +verbose +max-cycles=100000000 +loadmem=output/sample.riscv.hex 2> output/sample.riscv.out && [ $PIPESTATUS -eq 0 ]

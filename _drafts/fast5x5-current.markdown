.
├── README.md
├── CMakeLists.txt
├── include/
│   ├── fast5x5/
│   │   └── fast5x5.hpp
│   └── benchmarks/
│       ├── coord-transform
│       ├── gemm
│       ├── inversion
│       ├── similarity
│       ├── shared
│       ├── mat_mul.hpp
│       ├── mat_inv.hpp
│       ├── mat_sim.hpp
│       └── mat_coord_transform.hpp
└── src/
    ├── CMakeLists.txt
    ├── libs/
    │   ├── eigen
    │   ├── xsimd
    │   ├── googletest
    │   ├── benchmark
    │   ├── blaze
    │   └── Fastor
    ├── benchmarks/
    │   ├── CMakeLists.txt
    │   ├── combined_benchmark.cpp
    │   ├── gemm_benchmark.cpp
    │   ├── inversion_benchmark.cpp
    │   ├── similarity_benchmark.cpp
    │   └── coord_transform_benchmark.cpp
    └── test/
        ├── CMakeLists.txt
        ├── unit_inverse.cpp
        ├── unit_matrix.cpp
        ├── unit_operator.cpp
        ├── unit_vector.cpp
        └── run_all.cpp

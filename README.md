# Torch

A Julia interface for PyTorch's C++ backend.

## Getting Started

1. Build the package: run `julis deps/build.jl` or use `Pkg.build`.
   The build script will download the libtorch zip file, compile the
   shared library, and generate many Julia methods.
2. Run an example:

   ```julia
    julia> using Torch

    julia> t = Tensor( -rand(3, 3) )
    PyTorch.Tensor{Float64, 2}:
    -0.1428 -0.7099 -0.1446
    -0.3447 -0.0686 -0.8287
    -0.2692 -0.0501 -0.2092
    [ CPUDoubleType{3,3} ]

    julia> abs(t)
    PyTorch.Tensor{Float64, 2}:
     0.1428  0.7099  0.1446
     0.3447  0.0686  0.8287
     0.2692  0.0501  0.2092
    [ CPUDoubleType{3,3} ]

    julia> pow(sin(t), 2) + pow(cos(t), 2)
    PyTorch.Tensor{Float64, 2}:
     1.0000  1.0000  1.0000
     1.0000  1.0000  1.0000
     1.0000  1.0000  1.0000
    [ CPUDoubleType{3,3} ]

    julia> t
    PyTorch.Tensor{Float64, 2}:
    -0.1428 -0.7099 -0.1446
    -0.3447 -0.0686 -0.8287
    -0.2692 -0.0501 -0.2092
    [ CPUDoubleType{3,3} ]

    julia> abs!(t)
    PyTorch.Tensor{Float64, 2}:
     0.1428  0.7099  0.1446
     0.3447  0.0686  0.8287
     0.2692  0.0501  0.2092
    [ CPUDoubleType{3,3} ]

    julia> t
    PyTorch.Tensor{Float64, 2}:
     0.1428  0.7099  0.1446
     0.3447  0.0686  0.8287
     0.2692  0.0501  0.2092
    [ CPUDoubleType{3,3} ]

    julia>

   ```
   See the test directory for more examples.

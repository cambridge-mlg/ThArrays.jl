module Torch

using Libdl

export TorchNumber, Tensor, Scalar,
    eltype_id, grad, backward

const PROJECT_DIR = (@__DIR__) |> dirname

function __init__()
    Libdl.dlopen(joinpath(PROJECT_DIR, "csrc/build/libtorch_capi"))
    err_handler = "jl_error"
    ccall((:set_error_handler, :libtorch_capi),
          Cvoid, (Cstring, Csize_t),
          pointer(err_handler), length(err_handler))
end


const TYPE_MAP = Dict{Type, Int8}(
    ### float
    Float16 => 5,
    Float32 => 6,
    Float64 => 7,
    ### bool and char
    Bool => 11,
    # Char => 1, # Char in Julia is not single byte
    ### int
    Int8 => 1,
    # UInt8 => 1,
    Int16 => 2,
    # UInt16 => 2,
    Int32 => 3,
    # UInt32 => 3,
    Int64 => 4,
    # UInt64 => 4,
    # Int128 => ?,
    # UInt128 => ?,
)

const REVERSE_TYPE_MAP = Dict(reverse(p) for p in TYPE_MAP)

TorchNumber = Union{Float16, Float32, Float64,
                    Bool,
                    Int8, Int16, Int32, Int64}

include("tensor.jl")
include("scalar.jl")
include("autogen-methods.jl")
include("julia-style-methods.jl")

end

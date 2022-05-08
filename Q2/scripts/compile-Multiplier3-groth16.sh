#!/bin/bash

# [assignment] create your own bash script to compile Multipler3.circom modeling after compile-HelloWorld.sh below

#!/bin/bash

cd contracts/circuits

mkdir Multipler3

if [ -f ./powersOfTau28_hez_final_10.ptau ]; then
    echo "powersOfTau28_hez_final_10.ptau already exists. Skipping."
else
    echo 'Downloading powersOfTau28_hez_final_10.ptau'
    wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_10.ptau
fi

echo "Compiling Multiplier3.circom..."

# compile circuit

circom Multiplier3.circom --r1cs --wasm --sym -o Multipler3
snarkjs r1cs info Multipler3/Multipler3.r1cs

# Start a new zkey and make a contribution

snarkjs groth16 setup HelloWorld/HelloWorld.r1cs powersOfTau28_hez_final_10.ptau HelloWorld/circuit_0000.zkey
snarkjs zkey contribute HelloWorld/circuit_0000.zkey HelloWorld/circuit_final.zkey --name="1st Contributor Name" -v -e="random text"
snarkjs zkey export verificationkey HelloWorld/circuit_final.zkey HelloWorld/verification_key.json

# generate solidity contract
snarkjs zkey export solidityverifier HelloWorld/circuit_final.zkey ../HelloWorldVerifier.sol

cd ../..
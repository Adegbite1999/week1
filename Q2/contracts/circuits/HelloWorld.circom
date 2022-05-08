pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;  
   signal output c;  

   // Constraints.  
   c <== a * b;  


    The circuit Multiplier2() in HelloWorld.circum multiplies a * b and the out c.
   That is Given the block of code, we specify firstly our compiler version, then define a new circuit using the keyword template called Multiplier2()
    
}

component main = Multiplier2();
tinytest
========

Test of cabal's test-suite directive

With the first revision, it doesn't work:

    mach:tinytest $ cabal configure --enable-tests
    Resolving dependencies...
    Configuring tinytest-0.1.0.0...
    mach:tinytest $ cabal build
    Building tinytest-0.1.0.0...
    Preprocessing library tinytest-0.1.0.0...
    In-place registering tinytest-0.1.0.0...
    Preprocessing test suite 'testing' for tinytest-0.1.0.0...
    
    src/TinyTest.hs:11:8:
        Could not find module `Control.Monad.Maybe'
        It is a member of the hidden package `MaybeT-0.1.2'.
        Perhaps you need to add `MaybeT' to the build-depends in your .cabal file.
        Use -v to see a list of the files searched for.
    mach:tinytest $ 

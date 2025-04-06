# KONALIB

This project's purpose is to provide examples of how to incorporate C libraries in KONA

Run the project with 
```sh
make install && make
```

`make install` performs the following:
1. clone kona
2. overwrite src/kapi.c and Makefile
3. build kona with api flags
4. clone raylib
5. build raylib

`make` performs the following:
1. compile `t.c` with external library flags
2. execute `./run`


## Explanation

Certain files in the kona project need edits in order to build correctly 

Those edits are stored in `./extern` and copied during `make install`


# Credits

Thanks to 'Bakul Shah' in the [Kona-User Mailing List](https://groups.google.com/g/kona-user) for the timely and correct response. 


